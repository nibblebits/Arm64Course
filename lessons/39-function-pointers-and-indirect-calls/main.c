#include <inttypes.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

extern void map_i64(int64_t *values, size_t count,
                    int64_t (*transform)(int64_t));

static int64_t square_plus_one(int64_t value)
{
    return value * value + 1;
}

int main(void)
{
    int64_t values[] = {-3, -1, 0, 2, 5};
    static const int64_t expected[] = {10, 2, 1, 5, 26};
    const size_t count = sizeof(values) / sizeof(values[0]);

    map_i64(values, count, square_plus_one);

    for (size_t index = 0; index < count; ++index) {
        printf("values[%zu] = %" PRId64 "\n", index, values[index]);
        if (values[index] != expected[index]) {
            return 1;
        }
    }

    return 0;
}

