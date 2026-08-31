.global _start

.section .text

_start:
    // adr calculates the nearby label's address. It does not read the string.
    mov x0, #1
    adr x1, message
    mov x2, #message_len
    mov x8, #64
    svc #0

    mov x0, #0
    mov x8, #93
    svc #0

.section .rodata

message:
    .ascii "ADR found this address.\n"
.equ message_len, . - message

