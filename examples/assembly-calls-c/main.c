#include <stdio.h>

extern long call_c_function(long value);

long double_in_c(long value)
{
    return value * 2;
}

int main(void)
{
    long answer = call_c_function(21);

    printf("The answer is %ld\n", answer);

    return 0;
}

