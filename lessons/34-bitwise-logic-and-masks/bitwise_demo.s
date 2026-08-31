.section .text

.global apply_masks
.type apply_masks, %function

// uint32_t apply_masks(uint32_t value, uint32_t set_mask,
//                      uint32_t clear_mask, uint32_t toggle_mask)
apply_masks:
    orr w0, w0, w1
    mvn w4, w2
    and w0, w0, w4
    eor w0, w0, w3
    ret

.size apply_masks, . - apply_masks

.global low_bit_and_cbz
.type low_bit_and_cbz, %function

// uint32_t low_bit_and_cbz(uint32_t value)
low_bit_and_cbz:
    and w1, w0, #1
    cbz w1, .Land_zero
    mov w0, #1
    ret

.Land_zero:
    mov w0, #0
    ret

.size low_bit_and_cbz, . - low_bit_and_cbz

.global low_bit_tst
.type low_bit_tst, %function

// uint32_t low_bit_tst(uint32_t value)
low_bit_tst:
    tst w0, #1
    b.eq .Ltst_zero
    mov w0, #1
    ret

.Ltst_zero:
    mov w0, #0
    ret

.size low_bit_tst, . - low_bit_tst

.global extract_second_byte
.type extract_second_byte, %function

// uint32_t extract_second_byte(uint32_t value)
extract_second_byte:
    lsr w0, w0, #8
    and w0, w0, #0xff
    ret

.size extract_second_byte, . - extract_second_byte

.section .note.GNU-stack,"",@progbits

