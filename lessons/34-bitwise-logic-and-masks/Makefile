CROSS ?= aarch64-linux-gnu-
CC = $(CROSS)gcc
AS = $(CROSS)as
QEMU ?= qemu-aarch64
SYSROOT ?= /usr/aarch64-linux-gnu
CFLAGS ?= -O2 -Wall -Wextra -Werror

.PHONY: all run clean

all: bitwise_demo

bitwise_demo: main.o bitwise_demo.o
	$(CC) $^ -o $@

main.o: main.c
	$(CC) $(CFLAGS) -c $< -o $@

bitwise_demo.o: bitwise_demo.s
	$(AS) $< -o $@

run: bitwise_demo
	$(QEMU) -L $(SYSROOT) ./bitwise_demo

clean:
	$(RM) main.o bitwise_demo.o bitwise_demo

