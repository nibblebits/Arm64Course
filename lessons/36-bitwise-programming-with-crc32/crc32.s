.section .text

.global crc32_bytes
.type crc32_bytes, %function

// uint32_t crc32_bytes(const uint8_t *data, size_t length)
crc32_bytes:
    // Start with 0xffffffff. movz/movk construct a constant that a single
    // ordinary mov-immediate instruction cannot encode directly.
    movz w2, #0xffff
    movk w2, #0xffff, lsl #16

    // Reversed CRC-32 polynomial: 0xedb88320.
    movz w5, #0x8320
    movk w5, #0xedb8, lsl #16

    cbz x1, .Lcrc_done

.Lbyte_loop:
    ldrb w3, [x0], #1
    eor  w2, w2, w3
    mov  w4, #8

.Lbit_loop:
    lsr  w6, w2, #1
    tst  w2, #1
    b.eq .Lno_polynomial
    eor  w2, w6, w5
    b    .Lnext_bit

.Lno_polynomial:
    mov w2, w6

.Lnext_bit:
    subs w4, w4, #1
    b.ne .Lbit_loop

    subs x1, x1, #1
    b.ne .Lbyte_loop

.Lcrc_done:
    mvn  w0, w2
    ret

.size crc32_bytes, . - crc32_bytes

.section .note.GNU-stack,"",@progbits

