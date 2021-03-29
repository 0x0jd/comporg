# Title: Basic ARM Assembly WEEK 5 Assign
# Purpose: Program 5 - Read only inches, convert inches to both ft and inches with divide and a remainder
# Author: Justin E
# Edit Date: 01MAR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization

.text
.global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

# Prompt and read integer input
    ldr r0, =prompt1
    bl  printf
    ldr r0, =readInt
    ldr r1, =num1
    bl  scanf 
    
# Prompt and read integer input
    ldr r0, =prompt2
    bl  printf
    ldr r0, =readInt
    ldr r1, =num2
    bl  scanf 

# Get the two values and add them
# store the result in r1
    ldr r0, =num1
    ldr r0,[r0, #0]
    ldr r1,=num2
    ldr r1,[r1, #0]
    bl __aeabi_idiv
    mov r1, r0

# Printing The Message
    ldr r0, =format1
    bl  printf

# End the program by returning to OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
format1: .asciz "The number is %d\n"
prompt1:
    .asciz "Enter A value for x: \n"
prompt2:
    .asciz "Enter A value for y: \n"

input: .asciz "%d"
readInt: .asciz "%d"
num1: .word 0
num2: .word 0
