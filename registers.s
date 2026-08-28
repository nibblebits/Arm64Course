.global _start

.section .text

_start:
    // General-purpose registers contain bits; the program gives them meaning.
    mov x0, #42
    mov x1, x0
    adr x2, message
    mov x3, xzr

    // Exit with the copied numeric value.
    mov x0, x1
    mov x8, #93
    svc #0

.section .rodata

message:
    .ascii "Hello\n"

