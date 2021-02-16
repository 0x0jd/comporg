# IOExample_2: 
# Shows using scanf for a string
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
    ldr r1, =name1
    bl scanf

# Printing The Message
    ldr r0, =format1
    ldr r1, =name1
    bl  printf

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data

prompt1: .asciz "Enter your name: "
input1:  .asciz "%s"
format1: .asciz "Hello %s, how are you today? \n"
name1:    .space 40

