#include <math.h>
#include <stddef.h>
#include <stdio.h>

extern float dot_product_f32(const float *left, const float *right, size_t count);

static float scalar_dot_product(const float *left, const float *right, size_t count)
{
    float result = 0.0f;

    for (size_t index = 0; index < count; ++index) {
        result += left[index] * right[index];
    }

    return result;
}

int main(void)
{
    static const float left[] = {1.0f, 2.0f, 3.0f, 4.0f, 5.0f,
                                 6.0f, 7.0f, 8.0f, 9.0f};
    static const float right[] = {9.0f, 8.0f, 7.0f, 6.0f, 5.0f,
                                  4.0f, 3.0f, 2.0f, 1.0f};
    const size_t count = sizeof(left) / sizeof(left[0]);
    const float expected = scalar_dot_product(left, right, count);
    const float actual = dot_product_f32(left, right, count);

    printf("NEON result:  %.1f\n", actual);
    printf("Scalar check: %.1f\n", expected);

    return fabsf(actual - expected) < 0.0001f ? 0 : 1;
}

