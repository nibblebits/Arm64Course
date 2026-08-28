#include <stdio.h>

extern long sum_ten(
    long first,
    long second,
    long third,
    long fourth,
    long fifth,
    long sixth,
    long seventh,
    long eighth,
    long ninth,
    long tenth
);

int main(void)
{
    long answer = sum_ten(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

    printf("The answer is %ld\n", answer);

    return 0;
}

