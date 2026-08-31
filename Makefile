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
	adr \
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

STANDALONE_DIRS := \
	lessons/03-hello-world \
	lessons/04-labels-and-memory-layout \
	lessons/05-registers-and-values \
	lessons/06-adr \
	lessons/07-calling-the-kernel \
	lessons/08-jumping-around-the-program \
	lessons/11-conditional-jumping \
	lessons/13-mathematics-in-assembly \
	lessons/16-floating-point-operations \
	lessons/19-the-stack-and-how-to-use-it \
	lessons/23-storing-integers-and-strings-in-memory \
	lessons/25-calling-and-returning-from-subroutines \
	lessons/31-pre-indexed-and-post-indexed-addressing

# Let the existing root-level targets find their sources in lesson directories.
VPATH := $(STANDALONE_DIRS)

ABI_EXAMPLES := \
	lessons/26-mixing-c-with-assembly-code/c-calls-assembly \
	lessons/26-mixing-c-with-assembly-code/assembly-calls-c \
	lessons/28-passing-more-arguments-and-returning-large-values/sum-ten \
	lessons/28-passing-more-arguments-and-returning-large-values/make-three

MASTERY_EXAMPLES := \
	lessons/34-bitwise-logic-and-masks \
	lessons/35-bitwise-masks-assignment \
	lessons/36-bitwise-programming-with-crc32 \
	lessons/37-neon-simd-dot-product \
	lessons/38-atomic-operations-and-memory-ordering \
	lessons/39-function-pointers-and-indirect-calls \
	lessons/40-position-independent-shared-libraries

.PHONY: all standalone abi mastery run-% clean

all: standalone abi mastery

standalone: $(PROGRAMS)

abi:
	@for directory in $(ABI_EXAMPLES); do $(MAKE) -C $$directory || exit $$?; done

mastery:
	@for directory in $(MASTERY_EXAMPLES); do $(MAKE) -C $$directory || exit $$?; done

%: %.o
	$(LD) -o $@ $<

%.o: %.s
	$(AS) -o $@ $<

run-%: %
	$(QEMU) ./$<

clean:
	$(RM) $(PROGRAMS) $(addsuffix .o,$(PROGRAMS))
	@for directory in $(ABI_EXAMPLES); do $(MAKE) -C $$directory clean || exit $$?; done
	@for directory in $(MASTERY_EXAMPLES); do $(MAKE) -C $$directory clean || exit $$?; done
