# IOExample_1.s
# Shows using printf to print a string
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

# Printing The Message
    ldr r0, =HelloWorld
    bl  printf

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data

HelloWorld:
    .asciz "Hello World\n"
    

