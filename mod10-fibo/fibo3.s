.text
.global main

main:
    # push
    sub sp, sp, #4
    str lr, [sp]


    mov r10, #3       /* counter = 10, Compute fib(10) */
    mov r1, #0         /* fib(0) = 0 */
    mov r2, #1         /* fib(1) = 1 */
    bl fib

Return:
    mov r0, r1
    ldr r0, =output
    bl printf

    # pop
    ldr lr, [sp]
    add sp, sp, #4
    mov pc, lr

.data
    output: .asciz "Nth Fibonacci # is %d\n"

.text
fib:
    add r3, r1, r2    /* fib(n) = fib(n-1) + fib(n-2) */
    mov r1, r2        /* fib(n-1) = fib(n-2) */
    mov r2, r3        /* fib(n-2) = fib(n)   */
    subs r10, r10, #1  /* R10 = R0 - 1. Suffix 's' sets NZCV flags as well. */
    beq Return        /* If 'Z' flag is set, branch to 'Return' */
    bal fib           /* Branch always to 'fib' */
