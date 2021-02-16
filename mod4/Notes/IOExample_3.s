# IOExample_3.s
# Shows using scanf for an int using data memory
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
    ldr r1, =num1
    bl scanf

# Printing The Message
    ldr r0, =format1
    ldr r1, =num1
    ldr r1, [r1, #0]
    bl  printf

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data

num1: .word 0
prompt1: .asciz "Enter A Number\n"
input1: .asciz "%d"
format1: .asciz "Your Number Is %d \n"
