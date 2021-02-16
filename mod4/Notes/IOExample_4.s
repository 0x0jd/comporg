# IOExample_4
# Shows using scanf for an int using stack memory
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
format1: .asciz "Your Number Is %d \n"
prompt1: .asciz "Enter A Number\n"
input1: .asciz "%d"

