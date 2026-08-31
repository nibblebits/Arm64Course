CROSS ?= aarch64-linux-gnu-
CC = $(CROSS)gcc
AS = $(CROSS)as
QEMU ?= qemu-aarch64
SYSROOT ?= /usr/aarch64-linux-gnu
CFLAGS ?= -O2 -Wall -Wextra -Werror

.PHONY: all run clean

all: function_pointer_map

function_pointer_map: main.o map_i64.o
	$(CC) $^ -o $@

main.o: main.c
	$(CC) $(CFLAGS) -c $< -o $@

map_i64.o: map_i64.s
	$(AS) $< -o $@

run: function_pointer_map
	$(QEMU) -L $(SYSROOT) ./function_pointer_map

clean:
	$(RM) main.o map_i64.o function_pointer_map

