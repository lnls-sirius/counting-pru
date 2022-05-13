PRU_SWPKG = /usr/lib/ti/pru-software-support-package
PRU_CGT = /usr/share/ti/cgt-pru

CC = clpru
LD = lnkpru
CFLAGS = -i$(PRU_SWPKG)/include \
        -i$(PRU_SWPKG)/include/am335x \
        -v3 -O4 --opt_for_speed=5 --endian=little \
        --define=am3359 --define=pru0 --hardware_mac=on --verbose
LFLAGS = --library=$(PRU_SWPKG)/lib/rpmsg_lib.lib -i$(PRU_CGT)/lib --reread_libs --warn_sections --library=libc.a --stack_size=0x100 --heap_size=0x100
LDFLAGS = ../AM335x_PRU.cmd

SRCS = $(wildcard *.c)
PROGS = $(patsubst %.c,%,$(SRCS))

ASM_SRCS = $(wildcard *.asm)
ASM_PROGS = $(patsubst %.asm,%,$(ASM_SRCS))

OUT = ../../../bin

all: directories $(PROGS) $(ASM_PROGS) $(OUT)/pru0.out

directories: $(OUT)

$(OUT):
	mkdir -p $(OUT)

%: %.c
	$(CC) -i$(PRU_CGT)/include $(CFLAGS) $< --output_file $@

%: %.asm
	$(CC) $(CFLAGS) $< --output_file $@

$(OUT)/pru0.out: $(ASM_PROGS) $(PROGS)
	$(LD) $(LDFLAGS) $^ -o $@ $(LFLAGS)

clean:
	rm -rf $(OUT) $(ASM_PROGS) $(PROGS)
