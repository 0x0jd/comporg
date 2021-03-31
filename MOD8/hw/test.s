/* Preamble
# Title: ARM Assembly Template
# Purpose: MOD8 HW Assign Part 2: Write the functions CToF and InchesToFt and add it to the conversions.s file. Write a main program to call it and test it.  (40 points)  For the InchesToFt, you can earn an extra 10 points by using implied decimals to print out the InchesToFt.
# Author: Justin E
# Edit Date: 30MAR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

# CToF and InchesToFt
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

    #User Input prompt1 (Celcius value)
    ldr r0, =prompt1
    bl printf

    #Read User Input C into num1
    ldr r0, =input
    ldr r1, =num1
    bl scanf

    # load miles into r0 and hours into r1
    ldr r0, =num1
    ldr r0, [r0, #0]
    #branch and link to CToF conversion, return F in r0 and print F
    bl CToF

    mov r1, r0
    ldr r0, =output
    bl printf

    #User Input prompt2 (Inches value)
    ldr r0, =prompt2
    bl printf

    #Read User Input in into num2
    ldr r0, =input
    ldr r1, =num2
    bl scanf

    ldr r1, =num2
    ldr r1, [r1, #0]
    #branch and link to InchesToFt conversion, return Ft in r0
    bl InchesToFt

    mov r1, r0
    ldr r0, =output2
    bl printf

    #Main Epilogue
    mov r0, #0
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    prompt1: .asciz "Please enter an integer for Celcius: \n"
    prompt2: .asciz "Please enter an integer for Inches: \n"
    input: .asciz "%d"
    num1: .word 0
    num2: .word 0
    output: .asciz "Your Fahrenheit is: %d\n"
    output2: .asciz "Your foot/feet is/are: %d\n"
