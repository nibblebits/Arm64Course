CROSS ?= aarch64-linux-gnu-
AS = $(CROSS)as
LD = $(CROSS)ld
QEMU ?= qemu-aarch64

# Do not let make's host-compiler .s-to-executable rule bypass the cross tools.
.SUFFIXES:

# Keep the object files so students can inspect them after a build.
.SECONDARY:

PROGRAMS := \
	hello \
	labels \
	registers \
	kernel_calls \
	jumping \
	compare \
	conditional \
	math \
	mathematics \
	float \
	floating_point \
	stack \
	runtime_string \
	subroutines \
	indexed_stack

ABI_EXAMPLES := \
	examples/c-calls-assembly \
	examples/assembly-calls-c \
	examples/sum-ten \
	examples/make-three

.PHONY: all standalone abi run-% clean

all: standalone abi

standalone: $(PROGRAMS)

abi:
	@for directory in $(ABI_EXAMPLES); do $(MAKE) -C $$directory || exit $$?; done

%: %.o
	$(LD) -o $@ $<

%.o: %.s
	$(AS) -o $@ $<

run-%: %
	$(QEMU) ./$<

clean:
	$(RM) $(PROGRAMS) $(addsuffix .o,$(PROGRAMS))
	@for directory in $(ABI_EXAMPLES); do $(MAKE) -C $$directory clean || exit $$?; done
