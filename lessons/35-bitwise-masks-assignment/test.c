#include <inttypes.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

extern uint32_t update_permissions(uint32_t current, uint32_t grant_mask,
                                   uint32_t revoke_mask,
                                   uint32_t toggle_mask);
extern uint32_t extract_owner_field(uint32_t permissions);
extern uint32_t has_any_permission(uint32_t permissions, uint32_t mask);

struct update_case {
    uint32_t current;
    uint32_t grant_mask;
    uint32_t revoke_mask;
    uint32_t toggle_mask;
    uint32_t expected;
};

struct unary_case {
    uint32_t input;
    uint32_t expected;
};

struct test_case {
    uint32_t value;
    uint32_t mask;
    uint32_t expected;
};

static int test_update_permissions(void)
{
    static const struct update_case cases[] = {
        {UINT32_C(0x00000000), UINT32_C(0x00000000),
         UINT32_C(0x00000000), UINT32_C(0x00000000),
         UINT32_C(0x00000000)},
        {UINT32_C(0x00000000), UINT32_C(0x0000000f),
         UINT32_C(0x00000000), UINT32_C(0x00000000),
         UINT32_C(0x0000000f)},
        {UINT32_C(0xffffffff), UINT32_C(0x00000000),
         UINT32_C(0xffffffff), UINT32_C(0x00000000),
         UINT32_C(0x00000000)},
        {UINT32_C(0x0f0f0f0f), UINT32_C(0x000000f0),
         UINT32_C(0x00000f00), UINT32_C(0x0000000f),
         UINT32_C(0x0f0f00f0)},
        {UINT32_C(0x00000000), UINT32_C(0x00000001),
         UINT32_C(0x00000001), UINT32_C(0x00000001),
         UINT32_C(0x00000001)},
        {UINT32_C(0xaaaaaaaa), UINT32_C(0x55555555),
         UINT32_C(0x0f0f0f0f), UINT32_C(0x00ff00ff),
         UINT32_C(0xf00ff00f)},
    };
    int failed = 0;

    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); ++i) {
        const uint32_t actual =
            update_permissions(cases[i].current, cases[i].grant_mask,
                               cases[i].revoke_mask, cases[i].toggle_mask);
        if (actual != cases[i].expected) {
            printf("update_permissions case %zu: got 0x%08" PRIx32
                   ", expected 0x%08" PRIx32 "\n",
                   i, actual, cases[i].expected);
            failed = 1;
        }
    }

    return failed;
}

static int test_extract_owner_field(void)
{
    static const struct unary_case cases[] = {
        {UINT32_C(0x00000000), UINT32_C(0x00)},
        {UINT32_C(0x0000ff00), UINT32_C(0xff)},
        {UINT32_C(0x1234abcd), UINT32_C(0xab)},
        {UINT32_C(0xffffffff), UINT32_C(0xff)},
        {UINT32_C(0x00000100), UINT32_C(0x01)},
    };
    int failed = 0;

    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); ++i) {
        const uint32_t actual = extract_owner_field(cases[i].input);
        if (actual != cases[i].expected) {
            printf("extract_owner_field case %zu: got 0x%02" PRIx32
                   ", expected 0x%02" PRIx32 "\n",
                   i, actual, cases[i].expected);
            failed = 1;
        }
    }

    return failed;
}

static int test_has_any_permission(void)
{
    static const struct test_case cases[] = {
        {UINT32_C(0x00000000), UINT32_C(0x00000001), UINT32_C(0)},
        {UINT32_C(0x00000001), UINT32_C(0x00000001), UINT32_C(1)},
        {UINT32_C(0x00000080), UINT32_C(0x00000081), UINT32_C(1)},
        {UINT32_C(0x00000080), UINT32_C(0x00000001), UINT32_C(0)},
        {UINT32_C(0xffffffff), UINT32_C(0x00000000), UINT32_C(0)},
        {UINT32_C(0x80000000), UINT32_C(0x80000000), UINT32_C(1)},
    };
    int failed = 0;

    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); ++i) {
        const uint32_t actual =
            has_any_permission(cases[i].value, cases[i].mask);
        if (actual != cases[i].expected) {
            printf("has_any_permission case %zu: got %" PRIu32
                   ", expected %" PRIu32 "\n",
                   i, actual, cases[i].expected);
            failed = 1;
        }
    }

    return failed;
}

int main(void)
{
    int failed = 0;

    failed |= test_update_permissions();
    failed |= test_extract_owner_field();
    failed |= test_has_any_permission();

    if (failed) {
        puts("Bitwise assignment tests: FAILED");
        return 1;
    }

    puts("Bitwise assignment tests: PASSED");
    return 0;
}

