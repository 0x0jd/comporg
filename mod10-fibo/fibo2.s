/* Preamble
# Title: ARM Assembly Template
# Purpose: Implement a program recursively calculate a Fibonacci number.
# Author: Justin E
# Edit Date: 08APR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.text
.global main

/*Main program */
main:
    //Main Prologue
    sub sp, sp, #4
    str lr, [sp, #0]

/*
    //
    ldr r0, =prompt1
    bl printf
    // Read User Input, store
    ldr r0, =input1
    ldr r1, =fibonum

    //
*/
    mov r0, #0
    mov r1, #9 // n == 9
    mov r2, #0 // first fibo value 
    mov r3, #1 // second fibo value
    mov r4, #0 // initialization

loop:
    add r4, r4, #1
    cmp r1, r4
    ble Return
    mov r5, r0
    add r0, r2, r3
    mov r2, r0
    mov r3, r5
    bal loop

Return:
    ldr r0, =message
    bl printf

    //Main Epilogue
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr


/*Data Section of the program */
.data
    prompt1: .asciz "Please enter a number for the Fibonacci sequence: \n"
    message: .asciz "Your Fibonacci sequence: \n"
/*
Fibo:
    cmp r0, #1
    bne Recursion
    mov r1, #0
    mov r2, #1
    b Return


Recursion:
    sub r0, r0, #1
    bl Fibo
    add r3, r1, r2
    mov r1, r2
    mov r2, r3

Return:
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

*/
