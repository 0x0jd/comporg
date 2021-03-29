# Title: Basic ARM Assembly WEEK 5 Assign
# Purpose: Program 6 - Obtain and INT and perform a left logical shifts and add to multiple the int by 10, print result
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
# Note that the printf command stores
# will store input in memory as variable num1
    ldr r0, =prompt1
    bl  printf
    ldr r0, =readInt
    ldr r1, =num1
    bl  scanf 
    
# perform multiplication of int by 10
# Note that they were read from memory
    ldr r1,=num1
    ldr r1,[r1, #0]

    #perform multiplication of 10
    mov r3, #10
    mul r2, r1, r3

    
# Printing the result.  Note the 
# result is in r1 already
    ldr r0, =format1
    mov r1, r2
    bl  printf
 
#  End the program by returning to OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr
    
.data
format1: .asciz "\nYour integer times 10 is = %d\n"
prompt1: .asciz "\nPlease enter an integer (positive or negative): "
readInt: .asciz "%d"
num1: .word 0
