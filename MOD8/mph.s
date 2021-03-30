/* Preamble
# Title: ARM Assembly Template
# Purpose: The second function is mph(int miles, int hours), which will calculate miles per hour by dividing miles (in r0), by hours (in r1), and returning the value in r0. 
# Author: Justin E
# Edit Date: 29MAR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

# mph.s
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

