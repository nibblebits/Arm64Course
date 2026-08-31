CROSS ?= aarch64-linux-gnu-
CC = $(CROSS)gcc
AS = $(CROSS)as
QEMU ?= qemu-aarch64
SYSROOT ?= /usr/aarch64-linux-gnu

.PHONY: all run clean

all: make_three

make_three: main.o make_three.o
	$(CC) $^ -o $@

main.o: main.c
	$(CC) -c $< -o $@

make_three.o: make_three.s
	$(AS) $< -o $@

run: make_three
	$(QEMU) -L $(SYSROOT) ./make_three

clean:
	$(RM) main.o make_three.o make_three

