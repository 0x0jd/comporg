
.text
.global main
main:
    # push
    sub sp, sp, #4
    str lr, [sp]

    mov r0, #234
    bl Summation
    mov r1, r0
    ldr r0, =output
    bl printf

    # pop
    ldr lr, [sp]
    add sp, sp, #4
    mov pc, lr

.data
    output: .asciz "Your summation is %d\n"

#
# Recursive Summation
#
#    Summation(i) {
#        if (i == 0)
#            return 0;
#        else
#            return i + Summation(i-1)
#    }


.text
Summation:

    # push
    sub sp, sp, #12
    str lr, [sp, #0]
    str r4, [sp, #4]
    str r5, [sp, #8]
    mov r4, r0 // pass in main input to r4 for sumofDigits
    // We will save input into r4, and then use another register to store the total r9

    # logic - if test
    mov r0, r4 // move orig or quotient into r0 for division
    mov r1, #10 // move 10 into dividend
    bl __aeabi_idiv // r0 should store quotient, r1 should store remainder
    cmp r0, #0 // if quotient is zero, we're done
    add r9, r9, r3
    bne Else
        mov r0, #0 // return value goes in r0
        b Return

    Else:
        // r0 should contain quotient from earlier division, return this to Summation
        bl Summation
        mov r0, r9
        b Return
    
    EndIf:
    
    Return:
    # pop
    ldr lr, [sp, #0]
    ldr r4, [sp, #4]
    ldr r5, [sp, #8]
    add sp, sp, #12
    mov pc, lr
    
# End Summation
