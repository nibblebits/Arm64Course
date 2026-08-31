CROSS ?= aarch64-linux-gnu-
CC = $(CROSS)gcc
AS = $(CROSS)as
QEMU ?= qemu-aarch64
SYSROOT ?= /usr/aarch64-linux-gnu
CFLAGS ?= -O2 -Wall -Wextra -Werror -std=c11

.PHONY: all run clean

all: atomic_counter

atomic_counter: main.o atomic_increment.o
	$(CC) $^ -pthread -o $@

main.o: main.c
	$(CC) $(CFLAGS) -pthread -c $< -o $@

atomic_increment.o: atomic_increment.s
	$(AS) $< -o $@

run: atomic_counter
	$(QEMU) -L $(SYSROOT) ./atomic_counter

clean:
	$(RM) main.o atomic_increment.o atomic_counter

