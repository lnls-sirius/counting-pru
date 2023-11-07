#!/usr/bin/env python-sirius
# -*- coding: utf-8 -*-

import sys
import traceback
import time
import datetime
import socket
import struct
import numpy as np
from threading import Thread
import Adafruit_BBIO.GPIO as GPIO
import CountingPRU
import redis

# Connect to local Redis DB
redis_db = redis.StrictRedis(host="127.0.0.1", port=6379)

# Variable for timebase counting and Serial Numbers
global globalTimeBase, SerialNumber, countingChannel, minTimebase

TIMEBASE_MIN_VALUE = 200 # milliseconds
TIMEBASE_MIN_GCD_VALUE = 50 # milliseconds

BSMP_ID_SERIALNUMBER_CHANNEL = {11: "1", 12: "2", 13: "3", 14: "4", 15: "5", 16: "6", 17: "7", 18: "8"}

# Error Codes - bsmp
COMMAND_OK = 0xe0
ERROR_READ_ONLY = 0xe6

# [LNLS1, LNLS2, LNLS3, LNLS4, LNLS5, LNLS6, Bergoz1, Bergoz2]
# Create Channels Dictionnary
countingChannel = {}
for ch in range(8):
    countingChannel[ch] = {"BSMP_ID_TIMEBASE": 0,
               "BSMP_ID_COUNTING": 0,
               "countingList": [],
               "timebaseList": [],
               "currentTimebase": 0,
               "lastCounting": 0 }


# Populate Channels Dictionnary
for ch in countingChannel.keys():
    countingChannel[ch]["BSMP_ID_TIMEBASE"] = 0x21 + ch
    countingChannel[ch]["BSMP_ID_COUNTING"] = 0x01 + ch

    if not redis_db.hexists("Timebase", ch):
        sys.stdout.write("Creating timebase variable for channel {} and setting it to 1 second.\n".format(ch))
        countingChannel[ch]["currentTimebase"] = 1
        redis_db.hset("Timebase", ch, 1)
    
    else:
        tbase = float(redis_db.hget("Timebase", ch))
        if tbase >= TIMEBASE_MIN_VALUE:
            countingChannel[ch]["currentTimebase"] = tbase
        # If TimeBase is zero, set it to a different value
        else:
            sys.stdout.write("Timebase for channel {} was {}. Set it to a reasonable value: {} ms.\n".format(ch, tbase, TIMEBASE_MIN_VALUE))
            countingChannel[ch]["currentTimebase"] = TIMEBASE_MIN_VALUE
            redis_db.hset("Timebase", ch, TIMEBASE_MIN_VALUE)
    
# MDC TIMEBASE
minTimebase = np.gcd.reduce([int(countingChannel[ch]["currentTimebase"]) for ch in countingChannel.keys()])
if minTimebase < TIMEBASE_MIN_GCD_VALUE:
    minTimebase = TIMEBASE_MIN_GCD_VALUE


# GLOBAL TIMEBASE
# Get value from Redis key. If does not exist, create it.
if not redis_db.exists("globalTimebase"):
    sys.stdout.write("Creating globalTimebase variable\n")
    redis_db.set("globalTimebase", TIMEBASE_MIN_VALUE)
else:
    tbase = float(redis_db.get("globalTimebase"))
    if tbase >= TIMEBASE_MIN_VALUE:
        globalTimeBase = tbase
    else:
        # If TimeBase is zero, set it to a different value
        sys.stdout.write("TimeBase was {}. Set it to a reasonable value: {} millisecond.\n".format(tbase, TIMEBASE_MIN_VALUE))
        globalTimeBase = TIMEBASE_MIN_VALUE
        redis_db.set("globalTimebase", TIMEBASE_MIN_VALUE)


sys.stdout.flush()    
redis_db.save()



# Inhibit pins - Bergoz
Inhibit = {"A1": "P9_14", "B1": "P9_16", "A2": "P9_13", "B2": "P9_15"}

for pin in Inhibit:
    GPIO.setup(Inhibit[pin], GPIO.OUT)
    GPIO.output(Inhibit[pin], GPIO.LOW)



# Get Serial Numbers from Redis DB
for channel in list(BSMP_ID_SERIALNUMBER_CHANNEL.keys()):
    if not redis_db.hexists("DetectorSerialNumber", BSMP_ID_SERIALNUMBER_CHANNEL[channel]):
        redis_db.hset("DetectorSerialNumber", BSMP_ID_SERIALNUMBER_CHANNEL[channel], 0)

# Datetime string
def time_string():
    return datetime.datetime.now().strftime("%d/%m/%Y %H:%M:%S.%f")[:-4] + " - "


def includeChecksum(list_values) -> list:
    counter = 0
    i = 0
    while i < len(list_values):
        counter += list_values[i]
        i += 1
    counter = counter & 0xff
    counter = (256 - counter) & 0xff
    return bytes(list_values + [counter])


def verifyChecksum(list_values):
    counter = 0
    i = 0
    while i < len(list_values):
        counter += list_values[i]
        i += 1
    counter = counter & 0xff
    return counter


def sendVariable(variableID, value, size) -> bytes:
    send_message = [0x00, 0x11]
    send_message += struct.pack("!h", size)

    if size == 1:
        send_message.append(value)
    elif size == 2:
        send_message += struct.pack("!h", value)
    elif size == 4:
        send_message += struct.pack("!I", int(value))
    return includeChecksum(send_message)


def sendGroup(GroupID, values, size) -> bytes:
    send_message = [0x00, 0x13]
    send_message += struct.pack("!h", size)

    size_var = size / len(values)
    if size_var == 2:
        for value in values:
            send_message += struct.pack("!h", value)
    elif size_var == 4:
        for value in values:
            send_message += struct.pack("!I", int(value))
    return includeChecksum(send_message)


def sendMessage(ErrorCode) -> bytes:
    return includeChecksum([0x00, ErrorCode, 0x00, 0x00])


# Thead to send and receive values on demand
class Communication(Thread):
    def __init__(self, port):
        Thread.__init__(self)
        self.port = port

    def run(self):
        global globalTimeBase, countingChannel
        while True:
            try:

                # TCP/IP socket initialization
                self.tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.tcp.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
                self.tcp.bind(("", self.port))
                self.tcp.listen(1)
                sys.stdout.write(time_string() + "TCP/IP Server on port " + str(self.port) + " started.\n")
                sys.stdout.write(time_string() + "globalTimeBase: {}.\n".format(globalTimeBase))
                sys.stdout.flush()

                while True:

                    sys.stdout.write(time_string() + "Waiting for connection.\n")
                    sys.stdout.flush()
                    con, client_info = self.tcp.accept()

                    # New connection
                    sys.stdout.write(time_string() + "Connection accepted from {}:{}.\n".format(client_info[0], client_info[1]))
                    sys.stdout.flush()

                    while True:
                        # Get message
                        message = con.recv(100)
                        if message:
                            if verifyChecksum(message) == 0:

                                # Variable Read
                                if message[1] == 0x10:
                                    # globalTimeBase
                                    if message[4] == 0x00:
                                        con.send(sendVariable(message[4], int(globalTimeBase), 2))

                                    # Countings
                                    elif message[4] <= 0x08:
                                        con.send(sendVariable(message[4], countingChannel[message[4] - 1]["lastCounting"], 4))

                                    # Inhibit pins - 8 bits: X X X X B2 A2 B1 A1
                                    elif message[4] == 0x09:
                                        inh_value = 0
                                        for i in range(4):
                                            inh_value += GPIO.input(Inhibit[list(Inhibit.keys())[i]]) * (2 ** i)
                                        con.send(sendVariable(message[4], inh_value, 1))

                                    # SerialNumbers
                                    elif message[4] >= 11 and message[4] <= 18:
                                        snumber = int(redis_db.hget("DetectorSerialNumber",BSMP_ID_SERIALNUMBER_CHANNEL[message[4]]))
                                        con.send(sendVariable(message[4],snumber,1))

                                    # Individual TimeBase
                                    elif message[4] >= 0x21 and message[4] <= 0x28:
                                        channel = message[4] - 0x21
                                        tbase = countingChannel[channel]["currenTimebase"]
                                        con.send(sendVariable(message[4],tbase,2))

                                # Group Read
                                elif message[1] == 0x12:
                                    if message[4] == 0x01:
                                        Counting = [int(countingChannel[ch]["lastCounting"]) for ch in countingChannel.keys()]
                                        con.send(sendGroup(message[4], Counting, len(Counting) * 4))

                                # Variable Write
                                elif message[1] == 0x20:
                                    # Global TimeBase
                                    if message[4] == 0x00:
                                        tbase = (message[5] << 8) + message[6] #(message[5] << 24) + (message[6] << 16) + (message[7] << 8) + message[8]
                                        if tbase < TIMEBASE_MIN_VALUE:
                                            tbase = TIMEBASE_MIN_VALUE
                                
                                        globalTimeBase = tbase
                                        minTimebase = tbase
                                        redis_db.set("globalTimebase", tbase)
                                        try:
                                            redis_db.save()
                                        except:
                                            pass
                                        con.send(sendMessage(COMMAND_OK))
                                        sys.stdout.write(time_string() + "Write global timebase to {}\n".format(tbase))
                                        sys.stdout.flush()

                                    # Counting channels
                                    elif message[4] <= 0x08:
                                        con.send(sendMessage(ERROR_READ_ONLY))

                                    # Inhibit pins - 8 bits: X X X X B2 A2 B1 A1
                                    elif message[4] == 0x09:
                                        for i in range(4):
                                            GPIO.output(Inhibit[list(Inhibit.keys())[i]], bool(message[5] & (1 << i)))
                                        con.send(sendMessage(COMMAND_OK))
                                        sys.stdout.write(time_string() + "Write Inhibits to " + bin(message[5] & 0x0f) + " \n")
                                        sys.stdout.flush()

                                    # SerialNumbers
                                    elif message[4] >= 11 and message[4] <= 18:
                                        redis_db.hset("DetectorSerialNumber", BSMP_ID_SERIALNUMBER_CHANNEL[message[4]], message[5])
                                        try:
                                            redis_db.save()
                                        except:
                                            pass
                                        con.send(sendMessage(COMMAND_OK))
                                        sys.stdout.write(time_string() + "Write SN {} to device attached to ch {}\n".format(message[5], BSMP_ID_SERIALNUMBER_CHANNEL[message[4]]))
                                        sys.stdout.flush()


                                    # Individual TimeBases
                                    elif message[4] >= 0x21 and message[4] <= 0x28:
                                        channel = message[4] - 0x21
                                        tbase = (message[5] << 8) + message[6]
                                        if tbase < TIMEBASE_MIN_VALUE:
                                            tbase = TIMEBASE_MIN_VALUE
                                        countingChannel[channel]["currenTimebase"] = tbase
                                        countingChannel[ch]["countingList"] = []
                                        countingChannel[ch]["timebaseList"] = []
                                        redis_db.hset("Timebase", channel, tbase)
                                        try:
                                            redis_db.save()
                                        except:
                                            pass

                                        minTimebase = np.gcd.reduce([int(countingChannel[ch]["currentTimebase"]) for ch in countingChannel.keys()])
                                        if minTimebase < TIMEBASE_MIN_GCD_VALUE:
                                            minTimebase = TIMEBASE_MIN_GCD_VALUE

                                        con.send(sendMessage(COMMAND_OK))
                                        sys.stdout.write(time_string() + "Write timebase for channel {} as {}\n".format(tbase))
                                        sys.stdout.flush()

                            else:
                                sys.stdout.write(time_string() + "Unknown message\n")
                                sys.stdout.flush()
                                continue

                        else:
                            # Disconnection
                            sys.stdout.write(time_string() + "Client {}:{} disconnected.\n".format(client_info[0], client_info[1]))
                            sys.stdout.flush()
                            break

            except Exception:
                self.tcp.close()
                sys.stdout.write(time_string() + "Connection problem. TCP/IP server was closed. Error:\n\n")
                traceback.print_exc(file=sys.stdout)
                sys.stdout.write("\n")
                sys.stdout.flush()
                time.sleep(5)


# --------------------- MAIN LOOP ---------------------
# -------------------- starts here --------------------

# Initialize CountingPRU
CountingPRU.Init()


# Socket thread
net = Communication(5000)
net.daemon = True
net.start()


# Main loop - Counting Values!
# Counting stores countings/second
while True:

    # [LNLS1, LNLS2, LNLS3, LNLS4, LNLS5, LNLS6, Bergoz1, Bergoz2]
    values = CountingPRU.Counting_ms(minTimebase)

    for ch in countingChannel.keys():
        countingChannel[ch]["countingList"].append(values[ch])
        countingChannel[ch]["timebaseList"].append(minTimebase)
        if(sum(countingChannel[ch]["timebaseList"]) >= countingChannel[ch]["currentTimebase"]):
            countingChannel[ch]["lastCounting"] = sum(countingChannel[ch]["countingList"])/(0.001*sum(countingChannel[ch]["timebaseList"]))

            countingChannel[ch]["countingList"] = []
            countingChannel[ch]["timebaseList"] = []
