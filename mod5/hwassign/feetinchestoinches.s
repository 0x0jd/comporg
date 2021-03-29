#Scanf READ FT & INCH and PRINT FT
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
    
# Prompt and read integer input
    ldr r0, =prompt2
    bl  printf
    ldr r0, =readInt
    ldr r1, =num2
    bl  scanf 

# Get the two values and add them
# store the result in r1
    ldr r0, =num1
    ldr r0,[r0, #0]
    ldr r1,=num2
    ldr r1,[r1, #0]
    bl __aeabi_idiv
    mov r1, r0

# Printing The Message
    ldr r0, =format1
    bl  printf

# End the program by returning to OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
format1: .asciz "The sum of what was provided in inches is: %d\n"
prompt1:
    .asciz "Enter A value in feet: \n"
prompt2:
    .asciz "Enter A value in inches: \n"

input: .asciz "%d"
readInt: .asciz "%d"
num1: .word 0
num2: .word 0

