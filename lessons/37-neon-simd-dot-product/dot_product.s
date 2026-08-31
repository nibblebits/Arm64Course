.section .text

.global dot_product_f32
.type dot_product_f32, %function

// float dot_product_f32(const float *left, const float *right, size_t count)
dot_product_f32:
    movi v0.4s, #0

.Lvector_loop:
    cmp x2, #4
    b.lo .Lreduce_vector

    ld1 {v1.4s}, [x0], #16
    ld1 {v2.4s}, [x1], #16
    fmla v0.4s, v1.4s, v2.4s

    sub x2, x2, #4
    b .Lvector_loop

.Lreduce_vector:
    // Add the four accumulator lanes into scalar s0.
    faddp v0.4s, v0.4s, v0.4s
    faddp s0, v0.2s

    cbz x2, .Ldot_done

.Lscalar_loop:
    ldr s1, [x0], #4
    ldr s2, [x1], #4
    fmadd s0, s1, s2, s0

    subs x2, x2, #1
    b.ne .Lscalar_loop

.Ldot_done:
    ret

.size dot_product_f32, . - dot_product_f32

.section .note.GNU-stack,"",@progbits

