# Bitwise Logic and Masks

This example supports Lesson 34. It demonstrates the core ARM64 bitwise
instructions before they are applied to CRC-32:

- `and` selects or clears bits;
- `orr` sets bits;
- `eor` toggles bits;
- `mvn` inverts bits;
- `lsr` moves a field toward bit zero;
- `tst` tests a mask by setting flags without storing a result; and
- `and` plus `cbz` and `tst` plus `b.eq` can express the same low-bit decision.

Build and run:

```sh
make
make run
```

The program returns a nonzero status if any assembly result is incorrect.

