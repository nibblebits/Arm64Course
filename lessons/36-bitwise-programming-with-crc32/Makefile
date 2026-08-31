CROSS ?= aarch64-linux-gnu-
CC = $(CROSS)gcc
AS = $(CROSS)as
QEMU ?= qemu-aarch64
SYSROOT ?= /usr/aarch64-linux-gnu
CFLAGS ?= -O2 -Wall -Wextra -Werror

.PHONY: all run clean

all: crc32_demo

crc32_demo: main.o crc32.o
	$(CC) $^ -o $@

main.o: main.c
	$(CC) $(CFLAGS) -c $< -o $@

crc32.o: crc32.s
	$(AS) $< -o $@

run: crc32_demo
	$(QEMU) -L $(SYSROOT) ./crc32_demo

clean:
	$(RM) main.o crc32.o crc32_demo

