# Title: Basic ARM Assembly WEEK 5 Assign
# Purpose: Program 1 - C 2 F Temperature Program
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
# the input of Celsius Temp in memory for variable num1
    ldr r0, =prompt1
    bl  printf
    ldr r0, =readInt
    ldr r1, =num1
    bl  scanf 
    
# perform conversion
# Note that they were read from memory
    ldr r1,=num1
    ldr r1,[r1, #0]
    
    # perform 9/5 division, should store in r4
    mov r4, #9
    mov r5, #5
    bl __aeabi_idiv

    #perform multiplication of variable num1 to 9/5 
    mul r0, r1, r4
    #perform addition of 32 to equation for final celcius
    add r2, r0, #32
    
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
format1: .asciz "\nYour temperature in Fahrenheit (C*9/5)+32 is = %d\n"
prompt1:
    .asciz "\nEnter a temperature in Celsius: "
readInt: .asciz "%d"
num1: .word 0

