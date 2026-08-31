# Atomic counter with exclusive instructions

Four POSIX threads call one ARM64 assembly function to increment the same
counter. The final value proves that concurrent updates were not lost.

The assembly routine demonstrates:

- `ldaxr`, an acquire exclusive load;
- `stlxr`, a release exclusive store;
- retrying when another processor changes the exclusive location;
- why a normal load/add/store sequence is not atomic; and
- calling assembly safely from multiple C threads.

This uses the baseline load-exclusive/store-exclusive mechanism rather than
requiring the optional Large System Extensions atomic instructions.

Build and run:

```sh
make
make run
```

Expected result:

```text
Atomic counter: 400000
Expected:       400000
```

