.global _start

.section .text

_start:
    // System call 1: write the message.
    mov x0, #1
    adr x1, message
    mov x2, #14
    mov x8, #64
    svc #0

    // System call 2: exit successfully.
    mov x0, #0
    mov x8, #93
    svc #0

.section .rodata

message:
    .ascii "Hello, ARM64!\n"

