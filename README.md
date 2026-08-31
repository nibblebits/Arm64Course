# ARM64 Assembly Language Masters Course

Runnable source examples for the ARM64 course articles. The standalone
programs use Linux AArch64 system calls; the mixed C and assembly examples show
the AAPCS64 interface.

Each directory under `lessons/` uses the number of its matching course lesson.
Lessons without a source-code example do not need a directory here, so gaps in
the repository's directory numbers are intentional. The original concise
examples are kept beside the expanded example for the same lesson.

## Prerequisites

On a Debian or Ubuntu development machine, install the cross-toolchain and
QEMU user-mode emulator:

```sh
sudo apt install binutils-aarch64-linux-gnu gcc-aarch64-linux-gnu qemu-user
```

## Build

Build every standalone and C/assembly example:

```sh
make
```

Build only the programs that use `_start` and Linux system calls:

```sh
make standalone
```

Build only the mixed C/assembly examples:

```sh
make abi
```

Build the bitwise foundation, assignment, and five advanced capstone examples:

```sh
make mastery
```

Run a standalone example through QEMU, for example:

```sh
make run-kernel_calls
```

The programs that demonstrate calculations return the result as their exit
status. Check it with `echo $?` after running the program.

## Code examples by course lesson

| Number | Lesson | Directory |
|---:|---|---|
| 03 | Hello world program | [`lessons/03-hello-world/`](lessons/03-hello-world/) |
| 04 | Labels and memory layout | [`lessons/04-labels-and-memory-layout/`](lessons/04-labels-and-memory-layout/) |
| 05 | Registers and values | [`lessons/05-registers-and-values/`](lessons/05-registers-and-values/) |
| 06 | The `adr` instruction | [`lessons/06-adr/`](lessons/06-adr/) |
| 07 | Calling the kernel | [`lessons/07-calling-the-kernel/`](lessons/07-calling-the-kernel/) |
| 08 | Jumping around the program | [`lessons/08-jumping-around-the-program/`](lessons/08-jumping-around-the-program/) |
| 11 | Conditional jumping | [`lessons/11-conditional-jumping/`](lessons/11-conditional-jumping/) |
| 13 | Mathematics in assembly | [`lessons/13-mathematics-in-assembly/`](lessons/13-mathematics-in-assembly/) |
| 16 | Floating-point operations | [`lessons/16-floating-point-operations/`](lessons/16-floating-point-operations/) |
| 19 | The stack and how to use it | [`lessons/19-the-stack-and-how-to-use-it/`](lessons/19-the-stack-and-how-to-use-it/) |
| 23 | Storing integers and strings in memory | [`lessons/23-storing-integers-and-strings-in-memory/`](lessons/23-storing-integers-and-strings-in-memory/) |
| 25 | Calling and returning from subroutines | [`lessons/25-calling-and-returning-from-subroutines/`](lessons/25-calling-and-returning-from-subroutines/) |
| 26 | Mixing C with assembly code | [`lessons/26-mixing-c-with-assembly-code/`](lessons/26-mixing-c-with-assembly-code/) |
| 28 | Passing more arguments and returning large values | [`lessons/28-passing-more-arguments-and-returning-large-values/`](lessons/28-passing-more-arguments-and-returning-large-values/) |
| 31 | Pre-indexed and post-indexed addressing | [`lessons/31-pre-indexed-and-post-indexed-addressing/`](lessons/31-pre-indexed-and-post-indexed-addressing/) |

The original `hello.s`, `compare.s`, `math.s`, and `float.s` examples remain
available in their corresponding lesson directories as concise versions.

## Bitwise foundations and advanced mastery lessons

Lessons 34 through 40 move from reusable bitwise foundations into larger
assembly programs. Every runnable program has an independent C test harness
and returns a nonzero status if its result is wrong. Lesson 35 includes both a
compilable student starter and a published solution.

| Lesson | Program | Topics |
|---:|---|---|
| 34 | [Bitwise logic and masks](lessons/34-bitwise-logic-and-masks/) | AND, OR, XOR, NOT, masks, shifts, flag-only tests |
| 35 | [Bitwise masks assignment](lessons/35-bitwise-masks-assignment/) | Set, clear, toggle, extract, and test permission fields |
| 36 | [Bitwise CRC-32](lessons/36-bitwise-programming-with-crc32/) | Masks, shifts, large immediates, nested loops |
| 37 | [NEON dot product](lessons/37-neon-simd-dot-product/) | SIMD vectorization, fused operations, horizontal reduction |
| 38 | [Atomic counter](lessons/38-atomic-operations-and-memory-ordering/) | Exclusive accesses, memory ordering, multithreading |
| 39 | [Function-pointer map](lessons/39-function-pointers-and-indirect-calls/) | Indirect calls, callbacks, stack frames, callee-saved registers |
| 40 | [Position-independent shared library](lessons/40-position-independent-shared-libraries/) | ELF shared objects, GOT relocations, dynamic linking |
