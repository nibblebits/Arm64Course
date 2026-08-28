.section .text

.global add_in_assembly

add_in_assembly:
    add x0, x0, x1     // x0 = first argument + second argument.
    ret

.section .note.GNU-stack,"",@progbits

