/*
CountingPRU.c
v2-2

--------------------------------------------------------------------------------
PRU-based Counters
--------------------------------------------------------------------------------
Interfaces with CountingPRU Hardware (v2-2) in order to count trains of pulses
either from Bergoz Differential BLM or from LNLS Gamma Sensors (4-channel
standard TTL signal)

Brazilian Synchrotron Light Laboratory (LNLS/CNPEM)
Controls Group

Author: Patricia HENRIQUES NALLIN
Date: March/2018
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <prussdrv.h>
#include <pruss_intc_mapping.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <time.h>
#include <signal.h>
#include "CountingPRU.h"

#define PRU_Bergoz_LNLS			0
#define PRU_LNLS				1
#define	START					0xff
#define STOP					0x00
#define DATAOK					0x55
#define PRU_BINARY_Bergoz_LNLS	"/usr/bin/CountBergozLNLS.bin"
#define PRU_BINARY_LNLS			"/usr/bin/CountLNLS.bin"


/* PRU SHARED MEMORY (12kB) - MAPPING
 *
 * prudata[00] = Start/Stop/DataReady flag
 * prudata[01] = Data Ready 1 (Counter Value)
 * prudata[02] = Data Ready 0 (Counter Value)
 * prudata[04..07] = Count 1 LNLS
 * prudata[08..11] = Count 2 LNLS
 * prudata[12..15] = Count 3 LNLS
 * prudata[16..19] = Count 4 LNLS
 * prudata[20..23] = Count 5 LNLS
 * prudata[24..27] = Count 6 LNLS
 * prudata[28..31] = Count 1 Bergoz
 * prudata[35..35] = Count 2 Bergoz
 *
 */

volatile uint8_t* prudata;


int init_start_PRU(){
	int i;

	tpruss_intc_initdata pruss_intc_initdata = PRUSS_INTC_INITDATA;

	// ----- PRU first initialization
	prussdrv_init();

	// ----- PRU interruption initialization
	if (prussdrv_open(PRU_EVTOUT_1)){
		printf("prussdrv_open open failed\n");
		return -1;
	}
	prussdrv_pruintc_init(&pruss_intc_initdata);

	// ----- Shared RAM mapping and initializing bytes as 0x00
	prussdrv_map_prumem(PRUSS0_SHARED_DATARAM, (void**)&prudata);

	for(i=0; i<36; i++)
		prudata[i] = 0;

	// ----- Run binaries in parallel in both PRUs
	prussdrv_exec_program(PRU_LNLS, PRU_BINARY_LNLS);
	prussdrv_exec_program(PRU_Bergoz_LNLS, PRU_BINARY_Bergoz_LNLS);

	return 0;
}


/* Actual duration of the last counting gate, in seconds */
static double last_gate = 0.0;


/* Opens the gate, sleeps for time_base_ns, closes it and normalizes counts to
 * time_base_ns. The sleep only guarantees a minimum duration (Linux is not
 * real-time), so the actual gate is measured with CLOCK_MONOTONIC, which
 * includes the NTP frequency correction of the board crystal. */
static void gated_counting(uint64_t time_base_ns, uint32_t *data){

	int i;
	uint32_t raw;
	double scale;
	struct timespec ts, t0, t1;

	ts.tv_sec = time_base_ns / 1000000000ULL;
	ts.tv_nsec = time_base_ns % 1000000000ULL;

	// ----- Says it is time to start counting
	clock_gettime(CLOCK_MONOTONIC, &t0);
	prudata[0] = START;

	// ----- Delay: pre-defined Time Base
	while(nanosleep(&ts, &ts) != 0){
	}

	// ----- Says it is time to stop counting
	prudata[0] = STOP;
	clock_gettime(CLOCK_MONOTONIC, &t1);


	// ----- Wait until values of both counters are available in shared RAM
	while(prudata[1] != 0x55){
	}
	while(prudata[2] != 0x55){
	}


	// ----- Measured gate duration
	last_gate = (t1.tv_sec - t0.tv_sec) + (t1.tv_nsec - t0.tv_nsec) * 1e-9;
	scale = (time_base_ns * 1e-9) / last_gate;


	// ----- Get counting values, normalized to the nominal time base
	for(i=1; i<=8; i++){
		raw = (prudata[(i*4)+3]<<24) + (prudata[(i*4)+2]<<16) + (prudata[(i*4)+1]<<8) + (prudata[(i*4)]);
		// +0.5 rounds to nearest (cast truncates, which would bias counts by -0.5)
		data[i-1] = (uint32_t)(raw * scale + 0.5);
	}


	// ----- Counting values successfully copied
	prudata[1] = 0;
	prudata[2] = 0;


	return;
}


void Counting(float time_base, uint32_t *data){
	gated_counting((uint64_t)(time_base * 1e9), data);
}


void Counting_ms(long time_base, uint32_t *data){
	gated_counting((uint64_t)time_base * 1000000ULL, data);
}


double Last_gate(){
	return last_gate;
}


void close_PRU(){
	// ----- Disables PRU and closes shared RAM memory mapping
	prussdrv_pru_disable(PRU_LNLS);
	prussdrv_pru_disable(PRU_Bergoz_LNLS);
	prussdrv_exit();
}
