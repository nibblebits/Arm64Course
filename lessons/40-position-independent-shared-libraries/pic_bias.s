.section .data
.balign 8

.global bias
.type bias, %object
.size bias, 8
bias:
    .xword 7

.section .text

.global set_bias
.type set_bias, %function

// void set_bias(long new_bias)
set_bias:
    adrp x1, :got:bias
    ldr  x1, [x1, :got_lo12:bias]
    str  x0, [x1]
    ret

.size set_bias, . - set_bias

.global sum_with_bias
.type sum_with_bias, %function

// long sum_with_bias(const long *values, size_t count)
sum_with_bias:
    // Resolve the interposable global through the Global Offset Table. The
    // loader can place this shared object at a different address each run.
    adrp x2, :got:bias
    ldr  x2, [x2, :got_lo12:bias]
    ldr  x2, [x2]

    mov x3, xzr
    cbz x1, .Lsum_done

.Lsum_loop:
    ldr x4, [x0], #8
    add x3, x3, x4
    subs x1, x1, #1
    b.ne .Lsum_loop

.Lsum_done:
    add x0, x3, x2
    ret

.size sum_with_bias, . - sum_with_bias

.section .note.GNU-stack,"",@progbits

