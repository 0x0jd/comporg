/* Preamble
# Title: ARM Assembly Template
# Purpose: 
# Author: Justin E
# Edit Date: DDMMYYYY
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.text
.global F2C 
.global Ft2Inches


F2C:
# Push stack
    sub sp, sp, #4
    str lr, [sp, #0]

    mov r1, #-32
    add r0, r0, r1
    mov r1, #5 
    mul r0, r0, r1
    mov r1, #9
    bl __aeabi_idiv
    add r5, r5, r6

# Pop stack
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

Ft2Inches:
# Push stack
    sub sp, sp, #4
    str lr, [sp, #0]
    mov r1, #12
    mul r0, r0, r1

# Pop stack
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

#inches to feet, added by justin
in2ft:
    #function prologue
    SUB sp, sp, #4
    STR lr, [sp, #0]
     
    #function conversion inches to ft
    MOV r3, #10
    MUL r0, r0,r3
    MOV r1, #12
    bl __aeabi_idiv
    #answer is returned in r0

    #function epilogue
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

#celcius to f, added by justin
c2f:

.data
    output1: .asciz "After call to div\n"
