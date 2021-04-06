.text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

    mov r0, #4
    mov r1, #5
    bl Multiply
    mov r1, r0
    ldr r0, =output
    bl printf


# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    output: .asciz "Multiplication result is %d\n"
	
.text
Multiply:
    # push stack.  Save r1 (multiplicand) is it has to be 
    # used later.  So r1 has to be saved by callee convention
    sub sp, sp, #8
    str lr, [sp, #0]
    str r1, [sp, #4]

    # if r0 is 0, return 0
    mov r4, #0
    cmp r0, r4
    beq return    @ return 0 in r0

    add r0, r0, #-1
    bl Multiply  @ return value in r0
    ldr r1, [sp, #4]  @ restore r1 in case it was changed
    add r0, r1, r0 @ return product in r0
    b return  @ not really needed

# pop stack and return
    return:
    ldr lr, [sp, #0]
    add sp, sp, #8
    mov pc, lr
#END Multiply
