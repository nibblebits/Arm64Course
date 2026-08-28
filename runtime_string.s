.global _start

.section .text

_start:
    // x1 holds the address where the string will be built.
    adr x1, buffer

    mov  w0, #72          // Decimal ASCII code for H.
    strb w0, [x1]

    mov  w0, #101         // Decimal ASCII code for e.
    strb w0, [x1, #1]

    mov  w0, #108         // Decimal ASCII code for l.
    strb w0, [x1, #2]

    mov  w0, #108         // Decimal ASCII code for l.
    strb w0, [x1, #3]

    mov  w0, #111         // Decimal ASCII code for o.
    strb w0, [x1, #4]

    mov  w0, #10          // Decimal ASCII code for newline.
    strb w0, [x1, #5]

    // Print the six bytes beginning at buffer.
    mov x0, #1
    mov x2, #6
    mov x8, #64
    svc #0

    mov x0, #0
    mov x8, #93
    svc #0

.section .bss

buffer:
    .skip 16

