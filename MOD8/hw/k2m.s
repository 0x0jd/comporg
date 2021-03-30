/* Preamble
# Title: ARM Assembly Template
# Purpose: MOD8 Program 1, Function 1 convert kilometers to miles
# Author: Justin E
# Edit Date: 29MAR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.global main
.text

main:
    #Main Prologue
    sub sp, sp, #4
    str lr, [sp, #0]

    #User Input prompt1 (km value)
    ldr r0, =prompt1
    bl printf

    #Read User Input m into num1
    ldr r0, =input
    ldr r1, =num1
    bl scanf

    # load km into r0 and hours into r1
    ldr r0, =num1
    ldr r0, [r0, #0]
    #branch and link to function
    bl k2m

    mov r1, r0
    ldr r0, =output
    bl printf

    #Main Epilogue
    mov r0, #0
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    prompt1: .asciz "Please enter an integer for kilometers: \n"
    input: .asciz "%d"
    num1: .word 0
    num2: .word 0
    output: .asciz "Your kilometers in miles are: %d m\n"
