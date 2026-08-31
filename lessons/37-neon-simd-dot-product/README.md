# NEON dot product

This example calculates the dot product of two floating-point arrays using
four lanes at a time. A C implementation independently calculates the expected
answer.

The assembly routine demonstrates:

- Advanced SIMD/NEON vector registers;
- post-indexed vector loads with `ld1`;
- four parallel fused multiply-add operations with `fmla`;
- horizontal reduction with `faddp`; and
- a scalar cleanup loop for lengths that are not divisible by four.

The test uses nine elements deliberately, so both the vector loop and scalar
tail execute.

Build and run:

```sh
make
make run
```

Expected result:

```text
NEON result:  165.0
Scalar check: 165.0
```

