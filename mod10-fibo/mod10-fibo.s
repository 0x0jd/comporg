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

    //
    ldr r0, =prompt1
    bl printf
    // Read User Input, store
    ldr r0, =input1
    ldr r1, =fibonum

    //
    //Main Epilogue
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

/*Data Section of the program */
.data
    prompt1: .asciz "Please enter a number for the Fibonacci sequence: \n"
    message: .asciz "Your Fibonacci sequence: \n"
