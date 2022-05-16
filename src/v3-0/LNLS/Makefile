PRU_SWPKG = /usr/lib/ti/pru-software-support-package
PRU_CGT = /usr/share/ti/cgt-pru

CC = clpru
LD = lnkpru
CFLAGS = -i$(PRU_SWPKG)/include \
        -i$(PRU_SWPKG)/include/am335x \
        -v3 -O4 --opt_for_speed=5 --endian=little \
        --define=am3359 --define=pru1 --hardware_mac=on --verbose
LFLAGS = --library=../rpmsg_lib.lib -i/usr/share/ti/cgt-pru/lib --reread_libs --warn_sections --library=libc.a
LDFLAGS = ../AM335x_PRU.cmd

SRCS = $(wildcard *.c)
PROGS = $(patsubst %.c,%,$(SRCS))

ASM_SRCS = $(wildcard *.asm)
ASM_PROGS = $(patsubst %.asm,%,$(ASM_SRCS))

OUT = ../../../bin

all: directories $(PROGS) $(ASM_PROGS) $(OUT)/pru1.out

directories: $(OUT)

$(OUT):
	mkdir -p $(OUT)

%: %.c
	$(CC) -i$(PRU_CGT)/include $(CFLAGS) $< --output_file $@

%: %.asm
	$(CC) $(CFLAGS) $< --output_file $@

$(OUT)/pru1.out: $(ASM_PROGS) $(PROGS)
	$(LD) $(LDFLAGS) $^ -o $@ $(LFLAGS)

clean:
	rm -rf $(OUT) $(ASM_PROGS) $(PROGS)
