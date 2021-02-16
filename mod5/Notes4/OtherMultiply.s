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

# Prompt and read integer input
# Note that the printf command stores
# the input in memory for variable num2
    ldr r0, =prompt2
    bl  printf
    ldr r0, =readInt
    ldr r1, =acc
    bl  scanf 

# Get the two values and add them
# Note that they were read from memory
    ldr r1,=num1
    ldr r1,[r1, #0]
    ldr r2, =num2
    ldr r2,[r2, #0]
    ldr r3, =acc
    ldr r3,[r3, #0]

    mla r5, r1, r2, r3
    smull r6, r7, r1, r2
    
# Printing the result.  Note the 
# result is in r1 already
    ldr r0, =format2
    mov r1, r5
    bl  printf

    ldr r0, =format3
    mov r1, r6
    bl  printf

#  End the program by returning to OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
format2: .asciz "num1 * num2 + accumlator = %d\n"
format3: .asciz "num1 * num2  = %d when using the smull\n"
prompt1:
    .asciz "/nEnter A value for x: "
prompt2:
    .asciz "/nEnter A value for y: "
prompt3:
    .asciz "/nEnter A value for the accumulator: "

readInt: .asciz "%d"
num1: .word 0
num2: .word 0
acc:  .word 0
