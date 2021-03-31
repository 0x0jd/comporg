/* Preamble
# Title: ARM Assembly Template
# Purpose:
# Author: Justin E
# Edit Date: DDMMYYYY
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.text
#.global F2C
#.global Ft2Inches
.global k2m
.global mph
#.global kph
.global InchesToFt
.global CToF

# Could alpha sort and use commas
#.global CToF, InchesToFt, k2m, kph, mph

/*
# Example from Notes
F2C:
# Push stack
    sub sp, sp, #4
    str lr, [sp, #0]

# F comes in as r0
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
*/

/*
# MOD8 Assign Prog 1:
    a. The first is k2m, which will convert kilometers to miles by multiplying by 10 and dividing by 16.
    b, The second function  is mph(int miles, int hours), which will calculate miles per hour by dividing miles (in r0), by hours (in r1), and returning the value in r0.   
    c. The third function is kph, and MUST be calculated by converting the kilometers to miles, and calling mph().  You must call the mph function, do not calculate the kph in this method.
*/

k2m:
# Convert by multiplying by 10 and dividing by 16
    #function prologue
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #function conversion
    MOV r3, #10
    MUL r0, r0, r3
    MOV r1, #16
    bl __aeabi_idiv
    #answer is returned in r0

    #function epilogue
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

mph:
# Calc miles by dividing miles (r0) by hours (r1) and return in r0
    # function prologue
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #function conversion
    MOV r1, r1
    MOV r0, r0
    bl __aeabi_idiv
    #answer is returned in r0

    #function epilogue
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
/*
kph:
# Same as k2m excep calls mph. You must call the mph function, do not calculate the kph in this method.
    # function prologue
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #function
    MOV r1, r1
    MOV r0, r0
    bl k2m

    # function epilogue
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
*/


/*
# MOD8 Assign Prog 2:
Write the functions CToF and InchesToFt and add it to the conversions.s file. Write a main program to call it and test it.  (40 points)  For the InchesToFt, you can earn an extra 10 points by using implied decimals to print out the InchesToFt.
*/

#inches to feet, added by justin
InchesToFt:
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

#Celsius to Fahrenheit  added by justin
CToF:
    #function prologue
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #function conversion c2f, pass passed r0 value to r3
    mov r3, r0
    mov r4, #9
    mov r5, #5
    bl __aeabi_idiv
    #answer is returned in r0
    mul r0, r0, r3
    add r0, #32

    #function epilogue
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr


.data
#    output1: .asciz "After call to div\n"
