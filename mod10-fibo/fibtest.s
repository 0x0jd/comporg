/* Preamble
# Title: ARM Assembly Template
# Purpose: Implement a program recursively calculate a Fibonacci number.
# Author: Justin E
# Edit Date: 08APR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.text
.global main
main:
    # push
    sub sp, sp, #4
    str lr, [sp]


    ldr r0, =inputprompt
    bl printf

    ldr r0, =input
    ldr r1, =num1
    bl scanf
    ldr r0, =num1
    ldr r0, [r0, #0]

    mov r10, r0 // counter fib(10) test
    mov r1, #0
    mov r2, #1

    bl fibo
    mov r1, r0
    ldr r0, =output
    bl printf

Return:

    mov r1, r3
    ldr r0, =output
    bl printf

    # pop
    ldr lr, [sp]
    add sp, sp, #4
    mov pc, lr

.data
    num1: .word 0
    inputprompt: .asciz "Please provide the Fibonacci sequence number you'd like: \n"
    output: .asciz "That Fibonacci number is %d\n"
    input: .asciz "%d"

.text
fibo:

    add r3, r1, r2
    mov r1, r2
    mov r2, r3
    subs r10, r10, #1
    beq Return
    bal fibo

# End fibo
