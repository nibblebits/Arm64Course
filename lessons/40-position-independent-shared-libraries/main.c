#include <stddef.h>
#include <stdio.h>

extern void set_bias(long new_bias);
extern long sum_with_bias(const long *values, size_t count);

int main(void)
{
    static const long values[] = {1, 2, 3, 4};
    const size_t count = sizeof(values) / sizeof(values[0]);

    const long first = sum_with_bias(values, count);
    set_bias(100);
    const long second = sum_with_bias(values, count);

    printf("Initial shared-library result: %ld\n", first);
    printf("Updated shared-library result: %ld\n", second);

    return first == 17 && second == 110 ? 0 : 1;
}

