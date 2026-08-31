# Position-independent shared library

This example builds ARM64 assembly as a real ELF shared object. A C executable
calls two exported functions: one updates a shared global and the other sums an
array before adding that global value.

The assembly routine demonstrates:

- building a `.so` instead of a standalone executable;
- accessing an interposable global through the Global Offset Table;
- `:got:` and `:got_lo12:` relocations;
- position-independent code that can be relocated by the dynamic loader; and
- linking and locating a shared library with an `$ORIGIN` runtime path.

Build, inspect, and run:

```sh
make
make inspect
make run
```

Expected result:

```text
Initial shared-library result: 17
Updated shared-library result: 110
```

