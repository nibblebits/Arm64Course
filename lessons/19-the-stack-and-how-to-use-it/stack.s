.global _start

.section .text

_start:
    mov x0, #10
    mov x1, #20

    // Reserve one 16-byte block
    sub sp, sp, #16

    // Save both values in that block
    str x0, [sp]
    str x1, [sp, #8]

    // Destroy the register copies to prove that we restore them
    mov x0, #0
    mov x1, #0

    // Load the saved values
    ldr x0, [sp]
    ldr x1, [sp, #8]

    // We have finished using the block
    add sp, sp, #16

    // x0 becomes 10 + 20 = 30
    add x0, x0, x1

    // Exit the program using x0 as the exit status
    mov x8, #93
    svc #0
