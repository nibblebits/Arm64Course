.section .text

.global call_c_function
.extern double_in_c

call_c_function:
    sub sp, sp, #16     // Reserve 16 bytes of stack space.
    str x30, [sp]       // Save the address needed to return to main.

    bl double_in_c

    ldr x30, [sp]
    add sp, sp, #16
    ret

.section .note.GNU-stack,"",@progbits

