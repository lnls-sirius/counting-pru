EESchema Schematic File Version 2
LIBS:Contador-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Controle
LIBS:Contador-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 4395 1250 2    60   Input ~ 0
TD1
Text HLabel 4395 1690 2    60   Input ~ 0
TD2
Text HLabel 4395 2195 2    60   Input ~ 0
RD1
Text HLabel 4395 2635 2    60   Input ~ 0
RD2
$Comp
L Diode_Bridge-RESCUE-Contador BR1
U 1 1 59EA2B3A
P 1300 1230
F 0 "BR1" H 1050 1530 50  0000 C CNN
F 1 "Diode_Bridge" H 1650 880 50  0000 C CNN
F 2 "Controle:RECT_BRIDGE" H 1300 1230 50  0001 C CNN
F 3 "" H 1300 1230 50  0000 C CNN
	1    1300 1230
	1    0    0    -1  
$EndComp
$Comp
L Diode_Bridge-RESCUE-Contador BR2
U 1 1 59EA2C29
P 1310 2660
F 0 "BR2" H 1060 2960 50  0000 C CNN
F 1 "Diode_Bridge" H 1660 2310 50  0000 C CNN
F 2 "Controle:RECT_BRIDGE" H 1310 2660 50  0001 C CNN
F 3 "" H 1310 2660 50  0000 C CNN
	1    1310 2660
	1    0    0    -1  
$EndComp
$Comp
L Module-XFRMR-POE T1
U 1 1 59EA3BD9
P 3630 850
F 0 "T1" H 3630 930 60  0000 C CNN
F 1 "Module-XFRMR-POE" H 3630 850 60  0000 C CNN
F 2 "Controle:module-xfrmr-poe" H 3630 850 60  0001 C CNN
F 3 "" H 3630 850 60  0001 C CNN
	1    3630 850 
	1    0    0    -1  
$EndComp
Text Label 1700 1230 0    60   ~ 0
VIN+
Text Label 1710 2660 0    60   ~ 0
VIN+
Text Label 900  1230 2    60   ~ 0
VIN-
Text Label 910  2660 2    60   ~ 0
VIN-
Text Label 1300 830  1    60   ~ 0
TDCT
Text Label 1300 1630 3    60   ~ 0
RDCT
Text HLabel 2900 1245 0    60   Output ~ 0
TX+
Text HLabel 2900 1685 0    60   Output ~ 0
TX-
Text HLabel 2900 2190 0    60   Output ~ 0
RX+
Text HLabel 2900 2630 0    60   Output ~ 0
RX-
Text HLabel 1310 2260 1    60   Input ~ 0
BR2A
Text HLabel 1310 3060 3    60   Input ~ 0
BR2B
$Comp
L Ag9200 U16
U 1 1 59EA455F
P 5965 1260
F 0 "U16" H 5960 1665 60  0000 C CNN
F 1 "Ag9200" H 5960 1595 60  0000 C CNN
F 2 "Controle:9200-Silvertel" H 5960 1595 60  0001 C CNN
F 3 "" H 5960 1595 60  0001 C CNN
	1    5965 1260
	1    0    0    -1  
$EndComp
Text Label 5115 1605 3    60   ~ 0
VIN+
Text Label 5200 1605 3    60   ~ 0
VIN-
NoConn ~ 5560 1605
NoConn ~ 5470 1605
NoConn ~ 5380 1605
NoConn ~ 5290 1605
NoConn ~ 6840 1605
NoConn ~ 6750 1605
$Comp
L C C1
U 1 1 59EA4788
P 6660 2045
F 0 "C1" H 6685 2145 50  0000 L CNN
F 1 "470uF" H 6415 1955 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_8x5.4" H 6698 1895 50  0001 C CNN
F 3 "" H 6660 2045 50  0000 C CNN
	1    6660 2045
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 59EA48C2
P 6895 2050
F 0 "R11" V 6975 2050 50  0000 C CNN
F 1 "100" V 6895 2050 50  0000 C CNN
F 2 "Resistors_SMD:R_MELF_MMB-0207" V 6825 2050 50  0001 C CNN
F 3 "" H 6895 2050 50  0000 C CNN
	1    6895 2050
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 59EA4937
P 7060 2050
F 0 "R12" V 7140 2050 50  0000 C CNN
F 1 "100" V 7060 2050 50  0000 C CNN
F 2 "Resistors_SMD:R_MELF_MMB-0207" V 6990 2050 50  0001 C CNN
F 3 "" H 7060 2050 50  0000 C CNN
	1    7060 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6660 1895 6660 1605
Wire Wire Line
	7060 1900 7060 1830
Wire Wire Line
	7060 1830 6660 1830
Connection ~ 6660 1830
Wire Wire Line
	6895 1900 6895 1830
Connection ~ 6895 1830
Text Label 6570 1605 3    60   ~ 0
GND
Text Label 6660 2195 3    60   ~ 0
GND
Wire Wire Line
	6660 2195 6660 2200
Wire Wire Line
	6660 2200 7060 2200
Connection ~ 6895 2200
Text HLabel 7115 1830 2    60   Output ~ 0
+5V
Wire Wire Line
	7115 1830 7055 1830
Connection ~ 7055 1830
Text HLabel 9940 2350 2    60   Input ~ 0
GND
Text Label 9785 2350 2    60   ~ 0
GND
Wire Wire Line
	9785 2350 9940 2350
Text Label 4395 1470 0    60   ~ 0
TDCT
Text Label 4395 2415 0    60   ~ 0
RDCT
$Comp
L VIBLSD1-S5-S5-DIP U17
U 1 1 59EAB1EB
P 3470 3905
F 0 "U17" H 3475 4025 60  0000 C CNN
F 1 "VIBLSD1-S5-S5-DIP" H 3470 3905 60  0000 C CNN
F 2 "Controle:VIBLSD1-DIP" H 3470 3905 60  0001 C CNN
F 3 "" H 3470 3905 60  0001 C CNN
	1    3470 3905
	1    0    0    -1  
$EndComp
Text Label 3205 4145 2    60   ~ 0
GND
NoConn ~ 3205 4600
Text Label 3770 4565 0    60   ~ 0
GND
Text Label 6660 1825 0    60   ~ 0
+5V
Text Label 3770 4145 0    60   ~ 0
+5V
$Comp
L C C2
U 1 1 59EAB569
P 4615 4350
F 0 "C2" H 4640 4450 50  0000 L CNN
F 1 "4.7uF" H 4640 4250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4653 4200 50  0001 C CNN
F 3 "" H 4615 4350 50  0000 C CNN
	1    4615 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4615 4145 4615 4200
Wire Wire Line
	3770 4145 4615 4145
Text Label 4615 4500 3    60   ~ 0
GND
Text HLabel 4260 4405 2    60   Output ~ 0
-5V
$Comp
L C C3
U 1 1 59EAB980
P 4025 4645
F 0 "C3" H 4050 4745 50  0000 L CNN
F 1 "1uF" H 4050 4545 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4063 4495 50  0001 C CNN
F 3 "" H 4025 4645 50  0000 C CNN
	1    4025 4645
	1    0    0    -1  
$EndComp
Text Label 4025 4795 3    60   ~ 0
GND
Wire Wire Line
	3770 4405 4260 4405
Wire Wire Line
	4025 4405 4025 4495
$Comp
L R R13
U 1 1 59EABAFD
P 4230 4585
F 0 "R13" V 4310 4585 50  0000 C CNN
F 1 "120" V 4230 4585 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4160 4585 50  0001 C CNN
F 3 "" H 4230 4585 50  0000 C CNN
	1    4230 4585
	1    0    0    -1  
$EndComp
$Comp
L R R14
U 1 1 59EABBD4
P 4230 4920
F 0 "R14" V 4310 4920 50  0000 C CNN
F 1 "120" V 4230 4920 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4160 4920 50  0001 C CNN
F 3 "" H 4230 4920 50  0000 C CNN
	1    4230 4920
	1    0    0    -1  
$EndComp
Wire Wire Line
	4230 4770 4230 4735
Wire Wire Line
	4230 4405 4230 4435
Connection ~ 4025 4405
Connection ~ 4230 4405
Text Label 4230 5070 3    60   ~ 0
GND
$Comp
L MEV1D0512DC U18
U 1 1 59EAE3D3
P 5440 3935
F 0 "U18" H 5445 4015 60  0000 C CNN
F 1 "MEV1D0512DC" H 5440 3935 60  0000 C CNN
F 2 "Controle:MEV1D0512DC" H 5440 3935 60  0001 C CNN
F 3 "" H 5440 3935 60  0001 C CNN
	1    5440 3935
	1    0    0    -1  
$EndComp
Text Label 5185 4120 2    60   ~ 0
GND
NoConn ~ 5185 4535
NoConn ~ 5705 4435
Text Label 5705 4335 0    60   ~ 0
GND
Text Label 5705 4120 0    60   ~ 0
+5V
$Comp
L C C4
U 1 1 59EAE90B
P 5790 4700
F 0 "C4" H 5815 4800 50  0000 L CNN
F 1 "1uF" H 5815 4600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5828 4550 50  0001 C CNN
F 3 "" H 5790 4700 50  0000 C CNN
	1    5790 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5705 4535 6165 4535
Wire Wire Line
	5790 4535 5790 4550
Text Label 5790 4850 3    60   ~ 0
GND
$Comp
L R R15
U 1 1 59EAEB3A
P 6025 4700
F 0 "R15" V 6105 4700 50  0000 C CNN
F 1 "4.7k" V 6025 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5955 4700 50  0001 C CNN
F 3 "" H 6025 4700 50  0000 C CNN
	1    6025 4700
	1    0    0    -1  
$EndComp
$Comp
L R R16
U 1 1 59EAEC68
P 6025 5030
F 0 "R16" V 6105 5030 50  0000 C CNN
F 1 "620" V 6025 5030 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5955 5030 50  0001 C CNN
F 3 "" H 6025 5030 50  0000 C CNN
	1    6025 5030
	1    0    0    -1  
$EndComp
Text Label 6025 5180 3    60   ~ 0
GND
Wire Wire Line
	6025 4850 6025 4880
Wire Wire Line
	6025 4535 6025 4550
Connection ~ 5790 4535
Text HLabel 6165 4535 2    60   Output ~ 0
+24V
Connection ~ 6025 4535
NoConn ~ 2900 1465
NoConn ~ 2900 2410
$EndSCHEMATC
