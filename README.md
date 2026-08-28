# ARM64 Assembly Language Masters Course

Runnable source examples for the ARM64 course articles. The standalone
programs use Linux AArch64 system calls; the examples under `examples/` show
the AAPCS64 interface between C and assembly.

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

Run a standalone example through QEMU, for example:

```sh
make run-kernel_calls
```

The programs that demonstrate calculations return the result as their exit
status. Check it with `echo $?` after running the program.

## Lesson examples

| Lesson topic | Source |
|---|---|
| Labels and memory layout | `labels.s` |
| Registers and values | `registers.s` |
| Calling the kernel | `kernel_calls.s` |
| Jumping around the program | `jumping.s` |
| Conditional jumping | `conditional.s` |
| Mathematics in assembly / quiz | `mathematics.s` |
| Floating-point operations | `floating_point.s` |
| The stack and how to use it | `stack.s` |
| Storing integers and strings in memory | `runtime_string.s` |
| Calling and returning from subroutines | `subroutines.s` |
| Mixing C with assembly: C calls assembly | `examples/c-calls-assembly/` |
| Mixing C with assembly: assembly calls C | `examples/assembly-calls-c/` |
| Passing more than eight arguments | `examples/sum-ten/` |
| Returning a 24-byte structure | `examples/make-three/` |
| Pre-indexed and post-indexed addressing | `indexed_stack.s` |

The original `hello.s`, `compare.s`, `math.s`, and `float.s` examples remain
available as the concise versions introduced earlier in the course.
