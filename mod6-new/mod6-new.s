/* Preamble
# Title: ARM Assembly Template
# Purpose: Week/Mod6 HW Assign
# Author: Justin E
# Edit Date: 05MAR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.text
.global main

/*Main program */
main:
/*Program setup, preamble*/
    sub sp, sp, #4
    str lr, [sp, #0]

/*Meat of the program*/
    ldr r0, =message
    bl printf
    
    mov r1, #1
    mov r2, #1
    mov r3, #1
    mov r4, #1
    mov r5, #1
    lsl r1, r2, #3 //
    add r1, r2, r3, lsl r4
    sub r4, r8, r5, asl #2

/*Part two of the homework*/
    mov r7, #198
    mov r8, #260
    mov r9, #9216
    mov r10, #2162688
    mvn r11, #75
//    mvn r12, #265


/*Program teardown,  */
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

/*Data Section of the program */
.data
    message: .asciz "Justin E\n"
