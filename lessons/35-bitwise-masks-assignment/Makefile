CROSS ?= aarch64-linux-gnu-
CC = $(CROSS)gcc
AS = $(CROSS)as
QEMU ?= qemu-aarch64
SYSROOT ?= /usr/aarch64-linux-gnu
CFLAGS ?= -O2 -Wall -Wextra -Werror

.PHONY: all starter solution run-starter run-solution clean

all: starter solution

starter: bitwise_assignment_starter

solution: bitwise_assignment_solution

bitwise_assignment_starter: test.o starter.o
	$(CC) $^ -o $@

bitwise_assignment_solution: test.o solution.o
	$(CC) $^ -o $@

test.o: test.c
	$(CC) $(CFLAGS) -c $< -o $@

starter.o: starter/bitwise_assignment.s
	$(AS) $< -o $@

solution.o: solution/bitwise_assignment.s
	$(AS) $< -o $@

run-starter: bitwise_assignment_starter
	$(QEMU) -L $(SYSROOT) ./bitwise_assignment_starter

run-solution: bitwise_assignment_solution
	$(QEMU) -L $(SYSROOT) ./bitwise_assignment_solution

clean:
	$(RM) test.o starter.o solution.o \
		bitwise_assignment_starter bitwise_assignment_solution

