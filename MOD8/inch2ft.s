/* Preamble
# Title: ARM Assembly Template
# Purpose: Main, prompt for inches, convert to feet, print after calling in2ft function
# Author: Justin E
# Edit Date: 29MAR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

    .text
    .global main

main:
# Save return to os on stack
    MOV sp, sp, #4
    STR lr, [sp, #0]

# Prompt For An Input in inches
    LDR r0, =prompt1
    BL  printf

# Read inches
    LDR r0, =input1
    SUB sp, sp, #4
    MOV r1, sp
    BL  scanf
    LDR r0, [sp, #0]
    ADD sp, sp, #4

# Convert
    BL inches2Ft
    MOV r4, r0

# Printing The Message
    LDR r0, =format1
    BL  printf
    MOV r0, r4
    MOV r1, #10
    BL printScaledInt
    LDR r0, =newline
    BL printf

# Return to the OS
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter the length in inches you want in feet: \n"
    format1: .asciz "\nThe length in feet is "
    input1:  .asciz "%d"
    newline: .asciz "\n"
    num1: .word 0

