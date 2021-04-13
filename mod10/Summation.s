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
    add sp, sp, #8
    str lr, [sp, #0]
    str r4, [sp, #4]
    
    # logic - if test
    mov r0, #0
    cmp r4, r0
    bne Else
        mov r0, #0
        b Return
    
    
    Else:
        sub r0, r1, #1
        bl Summation
        add r0, r0, r4
        b Return
    
    EndIf:
    
    Return:
    # pop
    ldr lr, [sp, #0]
    ldr r4, [sp, #4]
    add sp, sp, #8
    mov pc, lr
    
# End Summation
