CROSS ?= aarch64-linux-gnu-
CC = $(CROSS)gcc
AS = $(CROSS)as
QEMU ?= qemu-aarch64
SYSROOT ?= /usr/aarch64-linux-gnu
CFLAGS ?= -O2 -Wall -Wextra -Werror

.PHONY: all run clean

all: neon_dot_product

neon_dot_product: main.o dot_product.o
	$(CC) $^ -lm -o $@

main.o: main.c
	$(CC) $(CFLAGS) -c $< -o $@

dot_product.o: dot_product.s
	$(AS) $< -o $@

run: neon_dot_product
	$(QEMU) -L $(SYSROOT) ./neon_dot_product

clean:
	$(RM) main.o dot_product.o neon_dot_product

