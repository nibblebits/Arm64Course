.global _start

.section .text

_start:
    fmov d0, #1.5
    fmov d1, #2.0
    fmul d2, d0, d1      // d2 = 3.0

    fmov d3, #4.0
    fadd d2, d2, d3      // d2 = 7.0

    fcvtzs x0, d2        // Convert floating-point 7.0 to integer 7.

    mov x8, #93          // Linux ARM64 system call: exit.
    svc #0

