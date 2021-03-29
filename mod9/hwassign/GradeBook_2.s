# Pseudo Code
#    push lr
#
#    -- Loop for each student until numStudents--
#    for eachStudent:
#       prompt for and read student name
#       
#       --Get average of grades--
#       --Get total of grades --
#       initialize total, numGrades = 0
#       --Loop grades
#       prompt for and read grade   --initialization
#       for eachGrade until -1 is entered --predicate check
#           if grade is valid
#               total = total + grade
#               numGrade = numGrade + 1
#           else
#               print Invalid grade
#           prompt for and read grade --- next
#       end eachGrade
#       average = total / numGrade
#       print Student name and average
#
#    end eachStudent
#
#    pop lr and return
#
#    Step 1 - Create a dictionary of registers based on 
#             variables needed.  r0-r3 use as temps
#
#	studentName - String: stored in .data section
#       studentIdx  - r4
#       numStudents - r5
#       total       - r6
#       numGrades   - r7
#       grade       - r8
#       average     - r9
#
#   On this pass, fill in the eachStudent block

    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

# For eachStudent    
    mov r5, #5
    mov r4, #0 @ #initialize eachStudent loop
startEachStudent:
    #check predicat
    cmp r4, r5
    bge endEachStudent

        # prompt and read name
        ldr r0, =promptName
        bl printf
        ldr r0, =inputString
        ldr r1, =studentName
        bl scanf
 
        # for eachGrade
        ldr r0, =promptGrade
        bl printf
        ldr r0, =inputNumber
        ldr r1, =num1
        bl scanf
        ldr r1, =num1
        ldr r8, [r1, #0]

        startGrade:
            # check predicate
            mov r0, #-1
            cmp r0, r8
            beq endGrade
  
            # eachGrade Block

            ldr r0, =promptGrade
            bl printf
            ldr r0, =inputNumber
            ldr r1, =num1
            bl scanf
            ldr r1, =num1
            ldr r8, [r1, #0]
            b startGrade
        endGrade:

        add r4, r4, #1
        b startEachStudent
    endEachStudent: 

#  calculate and print Average

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    studentName:  .space 40
    promptName:   .asciz "\nEnter the student name: "
    promptGrade:  .asciz "\Enter grade, -1 to end: "
    inputString : .asciz "%s"
    inputNumber : .asciz "%d"
    num1: .word 0
