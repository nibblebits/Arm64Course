.global _start

.section .text

_start:
    mov x0, #10
    mov x1, #5

    add x2, x0, x1      // x2 = 10 + 5 = 15
    sub x2, x2, #3      // x2 = 15 - 3 = 12
    mul x2, x2, x1      // x2 = 12 * 5 = 60
    udiv x0, x2, x1     // x0 = 60 / 5 = 12

    mov x8, #93         // Linux ARM64 system call: exit.
    svc #0

