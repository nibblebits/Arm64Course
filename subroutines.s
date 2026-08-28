.global _start

.section .text

_start:
    mov x0, #41        // Put the input value in x0.
    bl add_one         // x30 receives the return address.

    // Execution returns here with 42 in x0.
    mov x8, #93
    svc #0

add_one:
    add x0, x0, #1
    ret

