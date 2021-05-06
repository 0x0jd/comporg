.global main

main:
    sub sp, sp, #4
    # Save return to os on stack
    str lr, [sp, #0] @ Prompt For An Input
    ldr r0, =prompt1
    bl  printf

    ldr r0, =input1
    ldr r1, =maxnum
    bl scanf

    ldr r0, =input2
    ldr r1, =guess


    sub sp, sp, #4
    mov r1, sp
    bl  scanf
    ldr r0, [sp, #0]


# Get and print random number
    mov r1, #100 // mov #100 into r1
    bl Random    // call Random function
    mov r1, r0   // return from Random with random number in r0
    ldr r0, =format1  // load output to provide random number
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
    prompt1: .asciz "RandomNum Gen, Enter Max Value for Random Value: \n"
    prompt2: .asciz "\nRandomNum Gen, Enter your guess!: \n"
    format1:  .asciz "\nThe random number is %d\n"
    input1: .asciz "%d"
    num1: .word 0
#end main


