#include <stdio.h>

extern long add_in_assembly(long first, long second);

int main(void)
{
    long answer = add_in_assembly(20, 22);

    printf("The answer is %ld\n", answer);

    return 0;
}

