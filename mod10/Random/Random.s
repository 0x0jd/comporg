.global main

main:
    sub sp, sp, #4
    # Save return to os on stack
    str lr, [sp, #0] @ Prompt For An Input
    ldr r0, =prompt1
    bl  printf

    #Scanf
    ldr r0, =input1
    sub sp, sp, #4
    mov r1, sp
    bl  scanf
    ldr r0, [sp, #0]
    add sp, sp, #4


# Get and print random number
    mov r1, #100
    bl Random
    mov r1, r0 
    ldr r0, =format1
    bl printf

# Get and print random number
    mov r0, #0
    mov r1, #100
    bl Random
    mov r1, r0 
    ldr r0, =format1
    bl printf

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    prompt1: .asciz "Enter the seed: \n"
    format1:  .asciz "\nThe random number is %d\n"
    input1: .asciz "%d"
    num1: .word 0
#end main


