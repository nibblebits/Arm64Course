CROSS ?= aarch64-linux-gnu-
CC = $(CROSS)gcc
AS = $(CROSS)as
QEMU ?= qemu-aarch64
SYSROOT ?= /usr/aarch64-linux-gnu

.PHONY: all run clean

all: c_calls_assembly

c_calls_assembly: main.o add.o
	$(CC) $^ -o $@

main.o: main.c
	$(CC) -c $< -o $@

add.o: add.s
	$(AS) $< -o $@

run: c_calls_assembly
	$(QEMU) -L $(SYSROOT) ./c_calls_assembly

clean:
	$(RM) main.o add.o c_calls_assembly

