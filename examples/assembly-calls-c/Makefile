CROSS ?= aarch64-linux-gnu-
CC = $(CROSS)gcc
AS = $(CROSS)as
QEMU ?= qemu-aarch64
SYSROOT ?= /usr/aarch64-linux-gnu

.PHONY: all run clean

all: assembly_calls_c

assembly_calls_c: main.o call_c.o
	$(CC) $^ -o $@

main.o: main.c
	$(CC) -c $< -o $@

call_c.o: call_c.s
	$(AS) $< -o $@

run: assembly_calls_c
	$(QEMU) -L $(SYSROOT) ./assembly_calls_c

clean:
	$(RM) main.o call_c.o assembly_calls_c

