#include <stdio.h>

struct ThreeValues {
    long first;
    long second;
    long third;
};

extern struct ThreeValues make_three(long starting_value);

int main(void)
{
    struct ThreeValues result = make_three(40);

    printf("first  = %ld\n", result.first);
    printf("second = %ld\n", result.second);
    printf("third  = %ld\n", result.third);

    return 0;
}

