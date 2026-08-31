.section .text

.global map_i64
.type map_i64, %function

// void map_i64(int64_t *values, size_t count,
//              int64_t (*transform)(int64_t))
map_i64:
    // This is a non-leaf function. Preserve the frame/link registers and the
    // callee-saved registers that keep state alive across each callback.
    stp x29, x30, [sp, #-48]!
    mov x29, sp
    stp x19, x20, [sp, #16]
    str x21, [sp, #32]

    mov x19, x0
    mov x20, x1
    mov x21, x2

    cbz x20, .Lmap_done

.Lmap_loop:
    ldr x0, [x19]
    blr x21
    str x0, [x19], #8

    subs x20, x20, #1
    b.ne .Lmap_loop

.Lmap_done:
    ldr x21, [sp, #32]
    ldp x19, x20, [sp, #16]
    ldp x29, x30, [sp], #48
    ret

.size map_i64, . - map_i64

.section .note.GNU-stack,"",@progbits

