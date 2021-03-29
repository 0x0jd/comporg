# Pseudo Code
#    if (grade >=0 and grade <=10) {
#        print("valid grade")
#    }
#    else {
#        print("invalid grade")
#    }
#
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

    mov r9, #101

#check if a number

    # Logical r1 = (r9 >= 0)
    mov r1, #0
    mov r4, #0
    cmp r9, r4
    movge r1, #1
  
    # Logical r2 = (r9 <= 100)
    mov r2, #0
    mov r4, #100
    cmp r9, r4
    movle r2, #1

    # r1 = r1 AND r2
    and r1, r1, r2
   
    # check if r9 is a valid grade
    mov r4, #0
    cmp r1, r4
    beq InvalidGrade
    
    # process is a number
        mov r4, #90
        cmp r9, r4
        blt GradeB

        ldr r0, =PrintA
        bl printf
        b EndPrintGrade

    GradeB:
        mov r4, #80
        cmp r9, r4
        blt GradeC

        ldr r0, =PrintB
        bl printf
        b EndPrintGrade

    GradeC:
        mov r4, #70
        cmp r9, r4
        blt GradeF

        ldr r0, =PrintC
        bl printf
        b EndPrintGrade

    GradeF:
        ldr r0, =PrintF
        bl printf
    
    EndPrintGrade:

    b EndGradeCheck

InvalidGrade:
    #process not a number
    ldr r0, =Invalid
    bl printf

EndGradeCheck:

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    PrintA: .asciz "Grade is A\n"
    PrintB: .asciz "Grade is B\n"
    PrintC: .asciz "Grade is C\n"
    PrintF: .asciz "Grade is F\n"
    Invalid: .asciz "Grade must be 0 <= grade <= 100\n"
   
