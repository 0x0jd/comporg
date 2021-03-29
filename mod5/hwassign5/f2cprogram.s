# Title: Basic ARM Assembly WEEK 5 Assign
# Purpose: Program 2 - F 2 C Temperature Program
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
# the input of F Temp in memory for variable num1
    ldr r0, =prompt1
    bl  printf
    ldr r0, =readInt
    ldr r1, =num1
    bl  scanf 
    
# perform conversion
# Note that they were read from memory
    ldr r1,=num1
    ldr r1,[r1, #0]
    
    #perform subtraction of userinput and store in reg
    mov r1, #-32
    add r0, r0, r1
    mul r0, r0, r1
    mov r1, #9
    # perform 9/5 division
    bl __aeabi_idiv

    #perform multiplication of output to 5/9 
    mul r0, r1, r0

    
# Printing the result.  Note the 
# result is in r0 already
    ldr r0, =format1
    mov r1, r1
    bl  printf
 
#  End the program by returning to OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr
    
.data
format1: .asciz "\nYour temperature in Celsius '(F-32)*5/9' is = %d\n"
prompt1: .asciz "\nEnter a temperature in Fahrenheit: "
readInt: .asciz "%d"
num1: .word 0

