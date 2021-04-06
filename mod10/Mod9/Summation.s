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
# Note: Summation is NOT a global symbol!
# It is a static function
Summation:
    # push stack.  Save r0 (summation) in r10, 
    # so r10 has to be saved by caller convention
    sub sp, sp, #8
    str lr, [sp, #0]
    str r10, [sp, #4]
    mov r10, r0

    # if r0 is 0, return 0
    mov r4, #0
    cmp r0, r4
    beq return    @ return 0 in r0

    add r0, r0, #-1
    bl Summation  @ return value in r0
    add r0, r10, r0 @ return summation in r0
    b return  @ not really needed

# pop stack and return
    return:
    ldr lr, [sp, #0]
    ldr r10, [sp, #4] 
    add sp, sp, #8
    mov pc, lr
#END Summation
