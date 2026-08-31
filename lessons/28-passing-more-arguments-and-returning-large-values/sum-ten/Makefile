CROSS ?= aarch64-linux-gnu-
CC = $(CROSS)gcc
AS = $(CROSS)as
QEMU ?= qemu-aarch64
SYSROOT ?= /usr/aarch64-linux-gnu

.PHONY: all run clean

all: sum_ten

sum_ten: main.o sum_ten.o
	$(CC) $^ -o $@

main.o: main.c
	$(CC) -c $< -o $@

sum_ten.o: sum_ten.s
	$(AS) $< -o $@

run: sum_ten
	$(QEMU) -L $(SYSROOT) ./sum_ten

clean:
	$(RM) main.o sum_ten.o sum_ten

