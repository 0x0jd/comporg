# Title: Basic ARM Assembly WEEK 5 Assign
# Purpose: Program 3 - Read int and print out negative value with a two's compliment - flip bits and add 1
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

# Perform MVN to move with negate to flip bits, perform add to add 1 to bits flipped
    mvn r1, r0
    add r1, r0, #1

# Printing The Message
    ldr r1, =format1
    bl  printf

# End the program by returning to OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
format1: .asciz "Your negative integer is: %d\n"
prompt1:
    .asciz "Please enter a positive integer: \n"

input: .asciz "%d"
readInt: .asciz "%d"
num1: .word 0
num2: .word 0

