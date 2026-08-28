.section .text

.global sum_ten

sum_ten:
    // Add the eight arguments that arrived in x0 through x7.
    add x0, x0, x1
    add x0, x0, x2
    add x0, x0, x3
    add x0, x0, x4
    add x0, x0, x5
    add x0, x0, x6
    add x0, x0, x7

    // Arguments 9 and 10 were placed on the stack by the C caller.
    ldr x9, [sp]
    ldr x10, [sp, #8]

    add x0, x0, x9
    add x0, x0, x10
    ret

.section .note.GNU-stack,"",@progbits

