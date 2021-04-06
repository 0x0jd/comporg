.text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

    mov r0, #10
    bl Summation
    mov r1, r0
    ldr r0, =output
    bl printf


# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    output: .asciz "Summation is %d\n"


.text
Summation:
    # push stack.  Save r0 (summation) on stack.
    # since  r0 will be used later, save it by callee convention
    # r0 is not a preserved register.
    sub sp, sp, #8
    str lr, [sp, #0]
    str r0, [sp, #4]

    # if r0 is 0, return 0
    mov r1, #0  @ use r1 since it is not a preserved register
    cmp r0, r1
    beq return    @ return 0 in r0

    add r0, r0, #-1
    bl Summation  @ return value in r0
    ldr r4, [sp, #4] @ get the original value of r0 from r4
    add r0, r4, r0 @ return summation in r0
    b return  @ not really needed

# pop stack and return
    return:
    ldr lr, [sp, #0]
    ldr r10, [sp, #4] 
    add sp, sp, #8
    mov pc, lr
#END Summation
