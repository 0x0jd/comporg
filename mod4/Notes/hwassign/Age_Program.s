# Age Program - JHU - Comp Org; Week 4 HW - IO in ARM Assembly and GDB
# Ask Age Input and Output to User
# Output a string with tabs '\t' between the number you output and the char's before and after it
# Put quotes '\"' in a formatted string
# Run program in gdb tui and record the addresses of all the labels in hex, print out values of the labels before and after they are used in the functions scanf and printf
# Extra Credit: Input a floating point and print it out of the program. 
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
    ldr r2, [sp, #0]
    add sp, sp, #4

# Printing The Message
    ldr r0, =format1
    mov r1, r2
    bl  printf

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data

num1: .word 0
format1: .asciz "Friend, you provided your age to be\t%d\t!\n%d isn't \"so bad\" now, is it\?\n"
prompt1: .asciz "Greetings friend, please enter your age: "
input1: .asciz "%d"

