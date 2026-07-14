.syntax unified
.cpu cortex-m33
.thumb

// ------------------------------------------------------------
// void mem_clear(void *dst, uint32_t count);
// Clears 'count' bytes at 'dst' to zero.
// ------------------------------------------------------------
.global mem_clear
.thumb_func
mem_clear:
    movs    r2, #0              // zero value
    lsrs    r1, r1, #2          // convert bytes to words
    beq     mem_clear_done

1:  str     r2, [r0], #4        // store zero, increment pointer
    subs    r1, r1, #1
    bne     1b

mem_clear_done:
    bx      lr

// ------------------------------------------------------------
// void mem_copy(void *dst, const void *src, uint32_t count);
// Copies 'count' bytes from 'src' to 'dst'.
// ------------------------------------------------------------
.global mem_copy
.thumb_func
mem_copy:
    lsrs    r2, r2, #2          // convert bytes to words
    beq     mem_copy_done

1:  ldr     r3, [r1], #4
    str     r3, [r0], #4
    subs    r2, r2, #1
    bne     1b

mem_copy_done:
    bx      lr

// ------------------------------------------------------------
// void *bump_alloc(uint32_t size);
// Very simple allocator: returns pointer to next free RAM.
// No free() — just grows upward.
// ------------------------------------------------------------
.global bump_alloc
.thumb_func
bump_alloc:
    ldr     r1, =_heap_ptr      // load heap pointer address
    ldr     r2, [r1]            // current heap pointer
    mov     r3, r2              // return value

    // Align size to 4 bytes
    adds    r0, r0, #3
    bic     r0, r0, #3

    adds    r2, r2, r0          // advance heap pointer
    str     r2, [r1]            // store new heap pointer

    mov     r0, r3              // return old pointer
    bx      lr

// ------------------------------------------------------------
// Heap pointer storage (initialized in C startup code)
// ------------------------------------------------------------
.section .bss
.align 4
_heap_ptr:
    .word 0
