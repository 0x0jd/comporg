#Simple Addition and Subtraction
.text
.global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

# Prompt and read integer input
    ldr r0, =prompt1
    bl  printf
    ldr r0, =readInt
    ldr r1, =num1
    bl  scanf 
    
# Get the two values and add them
    ldr r1,=num2
    ldr r1,[r1, #0]
    add r3, r1, #2
	sub r4, r1, #2
    
# Printing The Message
    ldr r0, =format1
	mov r1, r3
    bl  printf

    ldr r0, =format2
	mov r1, r4
    bl  printf

# End the program by returning to OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
format1: .asciz "The addition +2 yields %d\n"
format2: .asciz "The subtraction -2 yields %d\n"
prompt1:
    .asciz "Enter A value for x: \n"
prompt2:
    .asciz "Enter A value for y: \n"

input: .asciz "%d"
readInt: .asciz "%d"
num1: .word 0
num2: .word 0
