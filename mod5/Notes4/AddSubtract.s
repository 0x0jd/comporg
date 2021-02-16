# Prompt for two numbers and add them.  Do
# not worry about the syntax for accessing
# memory, just copy it for now.
.text
.global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

# Prompt and read integer input
# Note that the printf command stores
# the input in memory for variable num1
    ldr r0, =prompt1
    bl  printf
    ldr r0, =readInt
    ldr r1, =num1
    bl  scanf 
    
# Prompt and read integer input
# Note that the printf command stores
# the input in memory for variable num2
    ldr r0, =prompt2
    bl  printf
    ldr r0, =readInt
    ldr r1, =num2
    bl  scanf 

# Get the two values and add them
# Note that they were read from memory
    ldr r1,=num1
    ldr r1,[r1, #0]
    ldr r2, =num2
    ldr r2,[r2, #0]

    add r3, r1, r2
    sub r4, r1, r2
    add r5, r1, #2
    sub r6, r1, #2
    
# Printing the result.  Note the 
# result is in r1 already
    ldr r0, =format1
    mov r1, r3
    bl  printf

    ldr r0, =format2
    mov r1, r4
    bl  printf

    ldr r0, =format3
    mov r1, r5
    bl  printf

    ldr r0, =format4
    mov r1, r6
    bl  printf

#  End the program by returning to OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
format1: .asciz "num1 + num2 = %d\n"
format2: .asciz "num1 - num2 = %d\n"
format3: .asciz "num1 +2 = %d\n"
format4: .asciz "num1 -2 = %d\n"
prompt1:
    .asciz "Enter A value for x: \n"
prompt2:
    .asciz "Enter A value for y: \n"

input: .asciz "%d"
readInt: .asciz "%d"
num1: .word 0
num2: .word 0
