#include <inttypes.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

extern uint32_t apply_masks(uint32_t value, uint32_t set_mask,
                            uint32_t clear_mask, uint32_t toggle_mask);
extern uint32_t low_bit_and_cbz(uint32_t value);
extern uint32_t low_bit_tst(uint32_t value);
extern uint32_t extract_second_byte(uint32_t value);

int main(void)
{
    const uint32_t value = UINT32_C(0x12345678);
    const uint32_t set_mask = UINT32_C(0x00000081);
    const uint32_t clear_mask = UINT32_C(0x00000070);
    const uint32_t toggle_mask = UINT32_C(0x0000000f);
    const uint32_t expected =
        ((value | set_mask) & ~clear_mask) ^ toggle_mask;
    const uint32_t actual =
        apply_masks(value, set_mask, clear_mask, toggle_mask);
    static const uint32_t low_bit_inputs[] = {
        UINT32_C(0x00000000),
        UINT32_C(0x00000001),
        UINT32_C(0x00000002),
        UINT32_C(0xffffffff),
    };
    int failed = 0;

    printf("Mask result: 0x%08" PRIx32 "\n", actual);
    printf("Expected:    0x%08" PRIx32 "\n", expected);
    failed |= actual != expected;

    for (size_t i = 0; i < sizeof(low_bit_inputs) / sizeof(low_bit_inputs[0]);
         ++i) {
        const uint32_t input = low_bit_inputs[i];
        const uint32_t expected_low_bit = input & UINT32_C(1);
        const uint32_t via_and = low_bit_and_cbz(input);
        const uint32_t via_tst = low_bit_tst(input);

        printf("Low bit of 0x%08" PRIx32 ": and/cbz=%" PRIu32
               ", tst/b.eq=%" PRIu32 "\n",
               input, via_and, via_tst);
        failed |= via_and != expected_low_bit;
        failed |= via_tst != expected_low_bit;
        failed |= via_and != via_tst;
    }

    const uint32_t extracted = extract_second_byte(UINT32_C(0x1234abcd));
    printf("Second byte: 0x%02" PRIx32 " (expected 0xab)\n", extracted);
    failed |= extracted != UINT32_C(0xab);

    return failed ? 1 : 0;
}

