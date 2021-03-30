/* Preamble
# Title: ARM Assembly Template
# Purpose: Program 2, CToF
# Author: Justin E
# Edit Date: 30MAR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

# CToF.s
# An assembly program to calculate temperature from C to F
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

# Prompt For An Input
    ldr r0, =prompt1
    bl  printf

#Scanf
    ldr r0, =input1
    sub sp, sp, #4
    mov r1, sp
    bl  scanf
    ldr r0, [sp, #0]
    add sp, sp, #4

#Convert
    bl F2C
    mov r1, r0 

# Printing The Message
    ldr r0, =format1
    bl printf

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    prompt1: .asciz "Enter the Temp in F you want in C: \n"
    format1:  .asciz "\nThe temp in C is %d\n"
    input1: .asciz "%d"
    num1: .word 0

