CROSS ?= aarch64-linux-gnu-
CC = $(CROSS)gcc
AS = $(CROSS)as
QEMU ?= qemu-aarch64
SYSROOT ?= /usr/aarch64-linux-gnu
CFLAGS ?= -O2 -Wall -Wextra -Werror

.PHONY: all run inspect clean

all: pic_demo libbias.so

pic_demo: main.o libbias.so
	$(CC) main.o -L. -lbias -Wl,-rpath,'$$ORIGIN' -o $@

libbias.so: pic_bias.o
	$(CC) -shared $< -o $@

main.o: main.c
	$(CC) $(CFLAGS) -c $< -o $@

pic_bias.o: pic_bias.s
	$(AS) $< -o $@

run: pic_demo libbias.so
	$(QEMU) -L $(SYSROOT) ./pic_demo

inspect: pic_bias.o libbias.so
	$(CROSS)readelf -r pic_bias.o
	$(CROSS)readelf -d libbias.so

clean:
	$(RM) main.o pic_bias.o libbias.so pic_demo

