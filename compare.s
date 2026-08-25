.global _start

.section .text

_start:
    mov x0, #12

    cmp x0, #12
    b.eq values_are_equal

    // Not-equal path
    mov x0, #1
    b exit_program

values_are_equal:
    // Equal path
    mov x0, #0

exit_program:
    mov x8, #93
    svc #0
