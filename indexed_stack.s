.global _start

.section .text

_start:
    mov x0, #20
    bl add_then_double

    // x0 now contains 42. Use it as the exit status.
    mov x8, #93
    svc #0

add_then_double:
    // Reserve 16 bytes and save the return address before the store.
    str x30, [sp, #-16]!

    bl add_one
    bl double_value

    // Restore the return address, then release the 16-byte stack block.
    ldr x30, [sp], #16
    ret

add_one:
    add x0, x0, #1
    ret

double_value:
    add x0, x0, x0
    ret

.section .note.GNU-stack,"",@progbits

