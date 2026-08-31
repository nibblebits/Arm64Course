.section .text

.global make_three

make_three:
    // x0 contains starting_value; x8 points to the result memory.
    str x0, [x8]

    add x1, x0, #1
    str x1, [x8, #8]

    add x1, x0, #2
    str x1, [x8, #16]
    ret

.section .note.GNU-stack,"",@progbits

