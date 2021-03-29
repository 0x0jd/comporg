# Ft2Inches.s
# An assembly program to calculate Feet to Inches
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

# Prompt For An Input in feet
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
    bl Ft2Inches
    mov r1, r0 

# Print inches
    ldr r0, =format1
    bl printf

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    prompt1: .asciz "Enter the length in feet you want in inches: \n"
    format1:  .asciz "\nThe length in inches is  %d\n"
    input1: .asciz "%d"
    num1: .word 0

