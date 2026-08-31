#include <inttypes.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

extern uint32_t crc32_bytes(const uint8_t *data, size_t length);

int main(void)
{
    static const uint8_t input[] = "123456789";
    const uint32_t expected = UINT32_C(0xcbf43926);
    const uint32_t actual = crc32_bytes(input, sizeof(input) - 1);

    printf("CRC-32: 0x%08" PRIx32 "\n", actual);
    printf("Expected: 0x%08" PRIx32 "\n", expected);

    return actual == expected ? 0 : 1;
}

