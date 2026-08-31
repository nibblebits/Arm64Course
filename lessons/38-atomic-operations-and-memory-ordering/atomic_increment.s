.section .text

.global atomic_increment
.type atomic_increment, %function

// void atomic_increment(_Atomic uint64_t *counter, uint64_t iterations)
atomic_increment:
    cbz x1, .Latomic_done

.Lexclusive_retry:
    ldaxr x2, [x0]
    add   x2, x2, #1
    stlxr w3, x2, [x0]
    cbnz  w3, .Lexclusive_retry

    subs x1, x1, #1
    b.ne .Lexclusive_retry

.Latomic_done:
    ret

.size atomic_increment, . - atomic_increment

.section .note.GNU-stack,"",@progbits

