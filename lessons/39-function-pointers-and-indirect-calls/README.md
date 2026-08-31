# Mapping an array through a function pointer

The assembly function walks through an array and invokes a C callback for each
element. It is similar to a small, type-specific version of a higher-order
function such as `map`.

The assembly routine demonstrates:

- receiving a C function pointer in a register;
- making an indirect call with `blr`;
- building and releasing a 16-byte-aligned stack frame;
- preserving `x19` through `x21` according to AAPCS64; and
- keeping loop state safe while arbitrary callback code runs.

Build and run:

```sh
make
make run
```

The program returns zero only if all five transformed elements match the
independently supplied expected values.

