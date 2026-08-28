.global _start

.section .text

_start:
    mov x0, #7
    b exit_program

    mov x0, #99       // This instruction is skipped.

exit_program:
    mov x8, #93       // Linux ARM64 system call: exit.
    svc #0

