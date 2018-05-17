EESchema Schematic File Version 2
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
LIBS:CountingPRU_v2-3-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 741G74 U1
U 1 1 59B04E95
P 2575 1880
F 0 "U1" H 2725 2180 50  0000 C CNN
F 1 "741G74" H 2875 1585 50  0000 C CNN
F 2 "CONTROLE:TSSOP-8" H 2575 1880 50  0001 C CNN
F 3 "" H 2575 1880 50  0000 C CNN
	1    2575 1880
	1    0    0    -1  
$EndComp
NoConn ~ 3175 2080
Text Label 1625 1880 0    60   ~ 0
SINAL_2
Text Label 2975 2455 2    60   ~ 0
CLEAR_2
Text Label 3550 1680 2    60   ~ 0
CONTA_2
$Comp
L 741G74 U2
U 1 1 59B050A1
P 5735 1900
F 0 "U2" H 5885 2200 50  0000 C CNN
F 1 "741G74" H 6035 1605 50  0000 C CNN
F 2 "CONTROLE:TSSOP-8" H 5735 1900 50  0001 C CNN
F 3 "" H 5735 1900 50  0000 C CNN
	1    5735 1900
	1    0    0    -1  
$EndComp
NoConn ~ 6335 2100
Text Label 4785 1900 0    60   ~ 0
SINAL_1
Text Label 6135 2475 2    60   ~ 0
CLEAR_1
Text Label 6710 1700 2    60   ~ 0
CONTA_1
Text Notes 3100 1080 0    118  ~ 0
BERGOZ
$Comp
L 2SC1945 Q1
U 1 1 59C2DE0D
P 3380 3575
F 0 "Q1" H 3580 3650 50  0000 L CNN
F 1 "BSR14" H 3580 3575 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 3580 3500 50  0001 L CIN
F 3 "" H 3380 3575 50  0000 L CNN
	1    3380 3575
	1    0    0    -1  
$EndComp
$Comp
L R_Small R3
U 1 1 59C2DEC8
P 3025 3575
F 0 "R3" H 3055 3595 50  0000 L CNN
F 1 "100" H 3055 3535 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 3025 3575 50  0001 C CNN
F 3 "" H 3025 3575 50  0000 C CNN
	1    3025 3575
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R5
U 1 1 59C2DF36
P 3480 3175
F 0 "R5" H 3510 3195 50  0000 L CNN
F 1 "1k" H 3510 3135 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 3480 3175 50  0001 C CNN
F 3 "" H 3480 3175 50  0000 C CNN
	1    3480 3175
	1    0    0    -1  
$EndComp
$Comp
L 1G04 U12
U 1 1 59C2DFC2
P 4105 3350
F 0 "U12" H 4080 3375 39  0000 C CNN
F 1 "1G04" H 4130 3325 39  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-353_SC-70-5_Handsoldering" H 4155 3350 60  0001 C CNN
F 3 "" H 4155 3350 60  0000 C CNN
	1    4105 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR070
U 1 1 59C2E065
P 4130 3550
F 0 "#PWR070" H 4130 3300 50  0001 C CNN
F 1 "GND" H 4130 3400 50  0000 C CNN
F 2 "" H 4130 3550 50  0000 C CNN
F 3 "" H 4130 3550 50  0000 C CNN
	1    4130 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR071
U 1 1 59C2E27A
P 3480 3775
F 0 "#PWR071" H 3480 3525 50  0001 C CNN
F 1 "GND" H 3480 3625 50  0000 C CNN
F 2 "" H 3480 3775 50  0000 C CNN
F 3 "" H 3480 3775 50  0000 C CNN
	1    3480 3775
	1    0    0    -1  
$EndComp
Text Label 4430 3350 0    60   ~ 0
SINAL_2
Text Label 2080 3575 2    60   ~ 0
D+_02
Text Label 2080 3975 2    60   ~ 0
D-_02
$Comp
L +5V #PWR072
U 1 1 59C2EC15
P 3780 3000
F 0 "#PWR072" H 3780 2850 50  0001 C CNN
F 1 "+5V" H 3780 3140 50  0000 C CNN
F 2 "" H 3780 3000 50  0000 C CNN
F 3 "" H 3780 3000 50  0000 C CNN
	1    3780 3000
	1    0    0    -1  
$EndComp
$Comp
L 2SC1945 Q2
U 1 1 59C2F7FD
P 3385 4725
F 0 "Q2" H 3585 4800 50  0000 L CNN
F 1 "BSR14" H 3585 4725 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 3585 4650 50  0001 L CIN
F 3 "" H 3385 4725 50  0000 L CNN
	1    3385 4725
	1    0    0    -1  
$EndComp
$Comp
L R_Small R4
U 1 1 59C2F809
P 3025 4725
F 0 "R4" H 3055 4745 50  0000 L CNN
F 1 "100" H 3055 4685 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 3025 4725 50  0001 C CNN
F 3 "" H 3025 4725 50  0000 C CNN
	1    3025 4725
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R6
U 1 1 59C2F80F
P 3485 4325
F 0 "R6" H 3515 4345 50  0000 L CNN
F 1 "1k" H 3515 4285 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 3485 4325 50  0001 C CNN
F 3 "" H 3485 4325 50  0000 C CNN
	1    3485 4325
	1    0    0    -1  
$EndComp
$Comp
L 1G04 U13
U 1 1 59C2F815
P 4110 4500
F 0 "U13" H 4085 4525 39  0000 C CNN
F 1 "1G04" H 4135 4475 39  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-353_SC-70-5_Handsoldering" H 4160 4500 60  0001 C CNN
F 3 "" H 4160 4500 60  0000 C CNN
	1    4110 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR073
U 1 1 59C2F81B
P 4135 4700
F 0 "#PWR073" H 4135 4450 50  0001 C CNN
F 1 "GND" H 4135 4550 50  0000 C CNN
F 2 "" H 4135 4700 50  0000 C CNN
F 3 "" H 4135 4700 50  0000 C CNN
	1    4135 4700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR074
U 1 1 59C2F821
P 3485 4925
F 0 "#PWR074" H 3485 4675 50  0001 C CNN
F 1 "GND" H 3485 4775 50  0000 C CNN
F 2 "" H 3485 4925 50  0000 C CNN
F 3 "" H 3485 4925 50  0000 C CNN
	1    3485 4925
	1    0    0    -1  
$EndComp
Text Label 4435 4500 0    60   ~ 0
SINAL_1
Text Label 2090 4725 2    60   ~ 0
D+_01
Text Label 2090 5125 2    60   ~ 0
D-_01
$Comp
L +5V #PWR075
U 1 1 59C2F83D
P 3785 4150
F 0 "#PWR075" H 3785 4000 50  0001 C CNN
F 1 "+5V" H 3785 4290 50  0000 C CNN
F 2 "" H 3785 4150 50  0000 C CNN
F 3 "" H 3785 4150 50  0000 C CNN
	1    3785 4150
	1    0    0    -1  
$EndComp
$Comp
L RJ45 J3
U 1 1 59C2FDAC
P 9185 3730
F 0 "J3" H 9385 4230 50  0000 C CNN
F 1 "BERGOZ_02" H 9035 4230 50  0000 C CNN
F 2 "Controle:RJ45-STEWART" H 9185 3730 50  0001 C CNN
F 3 "" H 9185 3730 50  0000 C CNN
	1    9185 3730
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR076
U 1 1 59C2FF31
P 9735 3380
F 0 "#PWR076" H 9735 3130 50  0001 C CNN
F 1 "GND" H 9735 3230 50  0000 C CNN
F 2 "" H 9735 3380 50  0000 C CNN
F 3 "" H 9735 3380 50  0000 C CNN
	1    9735 3380
	1    0    0    -1  
$EndComp
Text Label 8935 4180 3    60   ~ 0
D+_02
Text Label 8835 4180 3    60   ~ 0
D-_02
Text Label 9035 4180 3    60   ~ 0
+24V
Text Label 9135 4180 3    60   ~ 0
AIN_02
Text Label 9235 4180 3    60   ~ 0
BIN_02
Text Label 9435 4180 3    60   ~ 0
+5V
Text Label 9535 4180 3    60   ~ 0
-5V
$Comp
L GND #PWR077
U 1 1 59C303F9
P 9335 4355
F 0 "#PWR077" H 9335 4105 50  0001 C CNN
F 1 "GND" H 9335 4205 50  0000 C CNN
F 2 "" H 9335 4355 50  0000 C CNN
F 3 "" H 9335 4355 50  0000 C CNN
	1    9335 4355
	1    0    0    -1  
$EndComp
$Comp
L RJ45 J4
U 1 1 59C30637
P 10410 3730
F 0 "J4" H 10610 4230 50  0000 C CNN
F 1 "BERGOZ_01" H 10260 4230 50  0000 C CNN
F 2 "Controle:RJ45-STEWART" H 10410 3730 50  0001 C CNN
F 3 "" H 10410 3730 50  0000 C CNN
	1    10410 3730
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR078
U 1 1 59C3063D
P 10960 3380
F 0 "#PWR078" H 10960 3130 50  0001 C CNN
F 1 "GND" H 10960 3230 50  0000 C CNN
F 2 "" H 10960 3380 50  0000 C CNN
F 3 "" H 10960 3380 50  0000 C CNN
	1    10960 3380
	1    0    0    -1  
$EndComp
Text Label 10160 4180 3    60   ~ 0
D+_01
Text Label 10060 4180 3    60   ~ 0
D-_01
Text Label 10260 4180 3    60   ~ 0
+24V
Text Label 10360 4180 3    60   ~ 0
AIN_01
Text Label 10460 4180 3    60   ~ 0
BIN_01
Text Label 10660 4180 3    60   ~ 0
+5V
Text Label 10760 4180 3    60   ~ 0
-5V
$Comp
L GND #PWR079
U 1 1 59C3064A
P 10560 4355
F 0 "#PWR079" H 10560 4105 50  0001 C CNN
F 1 "GND" H 10560 4205 50  0000 C CNN
F 2 "" H 10560 4355 50  0000 C CNN
F 3 "" H 10560 4355 50  0000 C CNN
	1    10560 4355
	1    0    0    -1  
$EndComp
$Comp
L TS5A21366 U14
U 1 1 59E9E98B
P 7030 4305
F 0 "U14" H 7505 4730 60  0000 C CNN
F 1 "TS5A21366" H 6730 4730 60  0000 C CNN
F 2 "Controle:VSSOP-8" H 7030 4305 60  0001 C CNN
F 3 "" H 7030 4305 60  0000 C CNN
	1    7030 4305
	1    0    0    -1  
$EndComp
$Comp
L R_Small R7
U 1 1 59E9EAE3
P 6230 4005
F 0 "R7" H 6260 4025 50  0000 L CNN
F 1 "4k7" H 6260 3965 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6230 4005 50  0001 C CNN
F 3 "" H 6230 4005 50  0000 C CNN
	1    6230 4005
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R8
U 1 1 59E9ECBA
P 6230 4405
F 0 "R8" H 6260 4425 50  0000 L CNN
F 1 "4k7" H 6260 4365 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6230 4405 50  0001 C CNN
F 3 "" H 6230 4405 50  0000 C CNN
	1    6230 4405
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR080
U 1 1 59E9ED81
P 7730 4555
F 0 "#PWR080" H 7730 4305 50  0001 C CNN
F 1 "GND" H 7730 4405 50  0000 C CNN
F 2 "" H 7730 4555 50  0000 C CNN
F 3 "" H 7730 4555 50  0000 C CNN
	1    7730 4555
	1    0    0    -1  
$EndComp
Text Label 6130 4005 2    60   ~ 0
+5V
Text Label 6130 4405 2    60   ~ 0
+5V
Text Label 6330 4180 2    60   ~ 0
AIN_02
Text Label 6330 4555 2    60   ~ 0
BIN_02
$Comp
L TS5A21366 U15
U 1 1 59E9F62F
P 7030 5255
F 0 "U15" H 7505 5680 60  0000 C CNN
F 1 "TS5A21366" H 6730 5680 60  0000 C CNN
F 2 "Controle:VSSOP-8" H 7030 5255 60  0001 C CNN
F 3 "" H 7030 5255 60  0000 C CNN
	1    7030 5255
	1    0    0    -1  
$EndComp
$Comp
L R_Small R9
U 1 1 59E9F635
P 6230 4955
F 0 "R9" H 6260 4975 50  0000 L CNN
F 1 "4k7" H 6260 4915 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6230 4955 50  0001 C CNN
F 3 "" H 6230 4955 50  0000 C CNN
	1    6230 4955
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R10
U 1 1 59E9F63B
P 6230 5355
F 0 "R10" H 6260 5375 50  0000 L CNN
F 1 "4k7" H 6260 5315 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6230 5355 50  0001 C CNN
F 3 "" H 6230 5355 50  0000 C CNN
	1    6230 5355
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR081
U 1 1 59E9F641
P 7730 5505
F 0 "#PWR081" H 7730 5255 50  0001 C CNN
F 1 "GND" H 7730 5355 50  0000 C CNN
F 2 "" H 7730 5505 50  0000 C CNN
F 3 "" H 7730 5505 50  0000 C CNN
	1    7730 5505
	1    0    0    -1  
$EndComp
Text Label 6130 4955 2    60   ~ 0
+5V
Text Label 6130 5355 2    60   ~ 0
+5V
Text Label 6330 5130 2    60   ~ 0
AIN_01
Text Label 6330 5505 2    60   ~ 0
BIN_01
$Comp
L GND #PWR082
U 1 1 59EA0104
P 3050 5145
F 0 "#PWR082" H 3050 4895 50  0001 C CNN
F 1 "GND" H 3050 4995 50  0000 C CNN
F 2 "" H 3050 5145 50  0000 C CNN
F 3 "" H 3050 5145 50  0000 C CNN
	1    3050 5145
	1    0    0    -1  
$EndComp
Wire Wire Line
	2575 2455 2575 2430
Wire Wire Line
	3550 1680 3175 1680
Wire Wire Line
	1625 1880 1975 1880
Wire Wire Line
	2975 2455 2575 2455
Wire Wire Line
	5735 2475 5735 2450
Wire Wire Line
	6710 1700 6335 1700
Wire Wire Line
	4785 1900 5135 1900
Wire Wire Line
	6135 2475 5735 2475
Wire Wire Line
	3480 3375 3480 3275
Wire Wire Line
	3480 3350 3905 3350
Connection ~ 3480 3350
Wire Wire Line
	3005 3975 2880 3975
Wire Wire Line
	3780 3000 3780 3050
Wire Wire Line
	3480 3050 4130 3050
Wire Wire Line
	4130 3050 4130 3150
Wire Wire Line
	3480 3050 3480 3075
Connection ~ 3780 3050
Wire Wire Line
	3485 4525 3485 4425
Wire Wire Line
	3485 4500 3910 4500
Connection ~ 3485 4500
Wire Wire Line
	3785 4150 3785 4200
Wire Wire Line
	3485 4200 4135 4200
Wire Wire Line
	4135 4200 4135 4300
Wire Wire Line
	3485 4200 3485 4225
Connection ~ 3785 4200
Wire Wire Line
	9335 4355 9335 4180
Wire Wire Line
	10560 4355 10560 4180
Text Label 7730 4180 0    60   ~ 0
CH1
Text Label 7730 5130 0    60   ~ 0
CH3
Text Label 7730 5355 0    60   ~ 0
CH4
Text Label 7730 4405 0    60   ~ 0
CH2
$Comp
L Transformer_1P_1S T2
U 1 1 5A1588EC
P 2480 3775
F 0 "T2" H 2480 4025 50  0000 C CNN
F 1 "CMC" H 2480 3475 50  0000 C CNN
F 2 "Controle:Trafo_murata_SMD" H 2480 3775 50  0001 C CNN
F 3 "" H 2480 3775 50  0001 C CNN
	1    2480 3775
	1    0    0    -1  
$EndComp
$Comp
L Transformer_1P_1S T3
U 1 1 5A158B9C
P 2490 4925
F 0 "T3" H 2490 5175 50  0000 C CNN
F 1 "CMC" H 2490 4625 50  0000 C CNN
F 2 "Controle:Trafo_murata_SMD" H 2490 4925 50  0001 C CNN
F 3 "" H 2490 4925 50  0001 C CNN
	1    2490 4925
	1    0    0    -1  
$EndComp
Wire Wire Line
	3125 3575 3180 3575
$Comp
L GND #PWR083
U 1 1 59E9F78C
P 3005 3975
F 0 "#PWR083" H 3005 3725 50  0001 C CNN
F 1 "GND" H 3005 3825 50  0000 C CNN
F 2 "" H 3005 3975 50  0000 C CNN
F 3 "" H 3005 3975 50  0000 C CNN
	1    3005 3975
	1    0    0    -1  
$EndComp
Wire Wire Line
	2925 3575 2880 3575
Wire Wire Line
	3185 4725 3125 4725
Wire Wire Line
	2890 4725 2925 4725
Wire Wire Line
	2890 5125 3050 5125
Wire Wire Line
	3050 5125 3050 5145
$Comp
L +3.3V #PWR084
U 1 1 5A1701CA
P 2630 5450
F 0 "#PWR084" H 2630 5300 50  0001 C CNN
F 1 "+3.3V" H 2630 5590 50  0000 C CNN
F 2 "" H 2630 5450 50  0001 C CNN
F 3 "" H 2630 5450 50  0001 C CNN
	1    2630 5450
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR085
U 1 1 5A170BA8
P 5735 1350
F 0 "#PWR085" H 5735 1200 50  0001 C CNN
F 1 "+3.3V" H 5735 1490 50  0000 C CNN
F 2 "" H 5735 1350 50  0001 C CNN
F 3 "" H 5735 1350 50  0001 C CNN
	1    5735 1350
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR086
U 1 1 5A17106F
P 5135 1700
F 0 "#PWR086" H 5135 1550 50  0001 C CNN
F 1 "+3.3V" H 5135 1840 50  0000 C CNN
F 2 "" H 5135 1700 50  0001 C CNN
F 3 "" H 5135 1700 50  0001 C CNN
	1    5135 1700
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR087
U 1 1 5A17144F
P 2575 1195
F 0 "#PWR087" H 2575 1045 50  0001 C CNN
F 1 "+3.3V" H 2575 1335 50  0000 C CNN
F 2 "" H 2575 1195 50  0001 C CNN
F 3 "" H 2575 1195 50  0001 C CNN
	1    2575 1195
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR088
U 1 1 5A1718C3
P 1975 1680
F 0 "#PWR088" H 1975 1530 50  0001 C CNN
F 1 "+3.3V" H 1975 1820 50  0000 C CNN
F 2 "" H 1975 1680 50  0001 C CNN
F 3 "" H 1975 1680 50  0001 C CNN
	1    1975 1680
	1    0    0    -1  
$EndComp
$Comp
L R R23
U 1 1 5A1854C4
P 2505 3325
F 0 "R23" V 2585 3325 50  0000 C CNN
F 1 "0" V 2505 3325 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2435 3325 50  0001 C CNN
F 3 "" H 2505 3325 50  0001 C CNN
	1    2505 3325
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5A18579E
P 2485 4180
F 0 "R2" V 2565 4180 50  0000 C CNN
F 1 "0" V 2485 4180 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2415 4180 50  0001 C CNN
F 3 "" H 2485 4180 50  0001 C CNN
	1    2485 4180
	0    1    1    0   
$EndComp
$Comp
L R R24
U 1 1 5A1859CF
P 2505 4505
F 0 "R24" V 2585 4505 50  0000 C CNN
F 1 "0" V 2505 4505 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2435 4505 50  0001 C CNN
F 3 "" H 2505 4505 50  0001 C CNN
	1    2505 4505
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 5A185CC8
P 2400 5430
F 0 "R1" V 2480 5430 50  0000 C CNN
F 1 "0" V 2400 5430 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2330 5430 50  0001 C CNN
F 3 "" H 2400 5430 50  0001 C CNN
	1    2400 5430
	0    1    1    0   
$EndComp
Wire Wire Line
	2355 3325 2080 3325
Wire Wire Line
	2080 3325 2080 3575
Wire Wire Line
	2655 3325 2880 3325
Wire Wire Line
	2880 3325 2880 3575
Wire Wire Line
	2335 4180 2080 4180
Wire Wire Line
	2080 4180 2080 3975
Wire Wire Line
	2635 4180 2880 4180
Wire Wire Line
	2880 4180 2880 3975
Wire Wire Line
	2655 4505 2890 4505
Wire Wire Line
	2890 4505 2890 4725
Wire Wire Line
	2355 4505 2090 4505
Wire Wire Line
	2090 4505 2090 4725
Wire Wire Line
	2250 5430 2090 5430
Wire Wire Line
	2090 5430 2090 5125
Wire Wire Line
	2550 5430 2890 5430
Wire Wire Line
	2890 5430 2890 5125
$Comp
L +5V #PWR089
U 1 1 5A6F3C34
P 7730 4955
F 0 "#PWR089" H 7730 4805 50  0001 C CNN
F 1 "+5V" H 7730 5095 50  0000 C CNN
F 2 "" H 7730 4955 50  0000 C CNN
F 3 "" H 7730 4955 50  0000 C CNN
	1    7730 4955
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR090
U 1 1 5A6F3F85
P 7730 4005
F 0 "#PWR090" H 7730 3855 50  0001 C CNN
F 1 "+5V" H 7730 4145 50  0000 C CNN
F 2 "" H 7730 4005 50  0000 C CNN
F 3 "" H 7730 4005 50  0000 C CNN
	1    7730 4005
	1    0    0    -1  
$EndComp
Text HLabel 6710 1700 2    60   Output ~ 0
CONTA_1
Text HLabel 3550 1680 2    60   Output ~ 0
CONTA_2
Text HLabel 2975 2455 2    60   Output ~ 0
CLEAR_2
Text HLabel 6135 2475 2    60   Output ~ 0
CLEAR_1
Text GLabel 9040 4590 3    60   Input ~ 0
+24V
Wire Wire Line
	9040 4590 9040 4180
Wire Wire Line
	9040 4180 9035 4180
Text GLabel 9535 4600 3    60   Input ~ 0
-5V
Wire Wire Line
	9535 4180 9535 4600
Wire Wire Line
	9435 4180 9435 4600
Text GLabel 9435 4600 3    60   Input ~ 0
+5V
$Comp
L +5V #PWR091
U 1 1 5AD0A99D
P 5825 3955
F 0 "#PWR091" H 5825 3805 50  0001 C CNN
F 1 "+5V" H 5825 4095 50  0000 C CNN
F 2 "" H 5825 3955 50  0000 C CNN
F 3 "" H 5825 3955 50  0000 C CNN
	1    5825 3955
	1    0    0    -1  
$EndComp
Wire Wire Line
	5825 3955 5825 4005
Wire Wire Line
	5825 4005 6130 4005
Text HLabel 7930 4180 2    60   Input ~ 0
CH1
Text HLabel 7930 4405 2    60   Input ~ 0
CH2
Text HLabel 7935 5130 2    60   Input ~ 0
CH3
Text HLabel 7935 5355 2    60   Input ~ 0
CH4
Wire Wire Line
	7730 5355 7935 5355
Wire Wire Line
	7935 5130 7730 5130
Wire Wire Line
	7930 4405 7730 4405
Wire Wire Line
	7730 4180 7930 4180
Text GLabel 2730 1260 2    60   Input ~ 0
+3.3V
Wire Wire Line
	2575 1195 2575 1330
Wire Wire Line
	2730 1260 2575 1260
Connection ~ 2575 1260
$EndSCHEMATC