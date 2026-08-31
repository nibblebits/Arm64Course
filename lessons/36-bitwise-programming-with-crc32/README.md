# Bitwise CRC-32

This program implements the standard reflected CRC-32 algorithm entirely in
ARM64 assembly and verifies the well-known `123456789` test vector from C.

The assembly routine demonstrates:

- constructing a 32-bit constant with `movz` and `movk`;
- byte-wise pointer traversal with post-indexed `ldrb`;
- masks and bit tests with `tst`;
- logical shifting with `lsr`;
- bitwise combination with `eor` and `mvn`; and
- nested counted loops using flag-setting subtraction.

Build and run:

```sh
make
make run
```

Expected result:

```text
CRC-32: 0xcbf43926
Expected: 0xcbf43926
```

