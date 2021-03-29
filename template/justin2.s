/* Preamble
# Title: ARM Assembly Template
# Purpose: 
# Author: Justin E
# Edit Date: DDMMYYYY
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.text
.global main

/*Main program */
main:
    sub sp, sp, #4
    str lr, [sp]

    ldr r0, =message
    bl printf

    ldr lr, [sp]
    add sp, sp, #4
    mov pc, lr

/*Data Section of the program */
.data
    message: .asciz "Justin E\n"
