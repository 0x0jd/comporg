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

    mov r0, #92

#check if a number

    # Logical r1 = (r0 >= 0)
    mov r1, #0
    mov r4, #0
    cmp r0, r4
    movge r1, #1
  
    # Logical r2 = (r0 <= 100)
    mov r2, #0
    mov r4, #100
    cmp r0, r4
    movle r2, #1

    # r1 = r1 AND r2
    and r1, r1, r2
   
    # check if r0 is a valid grade
    mov r4, #0
    cmp r1, r4
    beq InvalidGrade
    
    # process is a number
    ldr r0, =IsValid
    bl printf
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
    IsValid: .asciz "Grade is Valid\n"
    Invalid: .asciz "Grade must be 0 <= grade <= 100\n"
   
