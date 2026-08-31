.global _start

.section .text
_start:
    // write(1, message, 14)
    mov x0, #1        // stdout
    adr x1, message   // address of message
    mov x2, #14       // length of the string
    mov x8, #64       // syscall: write
    svc #0            // invoke the kernel

    // exit(0)
    mov x0, #0        // exit status code
    mov x8, #93       // syscall: exit
    svc #0            // invokes the kernel

.section .rodata
message:
    .ascii "Hello, world!\n"
