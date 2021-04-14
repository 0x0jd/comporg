/* Preamble
# Title: ARM Assembly Template
# Purpose:
1 - Write a function with the following prototype that returns the sum of the digits of an integer.
int sumOfDigits(int x);
If x is 234, the function should return 2 + 3 + 4, that is, 9.
If x is 12, the function should return 1 + 2, which is 3.
If x is 39, the function should return 12.
Use recursion.
Hints:
    The base case is when the argument x is 0.
    For the recursive call, consider how computing the values x/10 and x%10 might be useful.  The Remainder function is in the file Math.s, and you already know how to divide.
    Start with the summation program if you need help. 
# Author: Justin E
# Edit Date: DDMMYYYY
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.text
.global main
main:
    # push
    sub sp, sp, #4
    str lr, [sp]

    ldr r0, =inputprompt
    bl printf

    ldr r0, =input
    ldr r1, =num1
    bl scanf
    ldr r0, =num1
    ldr r0, [r0, #0]

    bl Summation
    mov r1, r0
    ldr r0, =output
    bl printf

    # pop
    ldr lr, [sp]
    add sp, sp, #4
    mov pc, lr

.data
    num1: .word 0
    inputprompt: .asciz "Please enter a valid integer to calc the sum of its digits: \n"
    output: .asciz "Your summation is %d\n"
    input: .asciz "%d"
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

