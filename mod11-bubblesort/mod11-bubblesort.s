/* Preamble
# Title: ARM Assembly Template
# Purpose: Bubble sort program, array week hw, mod 11
# Author: Justin E
# Edit Date: 29APR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.text
.global main

/*Main program */
main:
	# Push
	SUB sp, sp, #4
	STR lr, [sp, #0]

    # Print the unsorted array
    LDR r0, =unsorted_array
    BL printf
    LDR r0, =array
    LDR r1, =array_size
    LDR r1, [r1, #0]
    BL PrintArray
    LDR r0, =newline
    BL printf

    # Call bubble sort
    LDR r0, =array
    LDR r1, =array_size
    LDR r1, [r1, #0]
    BL bubbleSort

    # Print the sorted array
    LDR r0, =sorted_ar
    BL printf
    LDR r0, =array
    LDR r1, =array_size
    LDR r1, [r1, #0]
    BL PrintArray
    LDR r0, =newline
    BL printf

	# Pop
	MOV r0, #0
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.text
bubbleSort:
	/*
	Push stack, preserve/save registers
	*/
    SUB sp, sp, #32
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]
    STR r7, [sp, #16]
    STR r8, [sp, #20]
    STR r9, [sp, #24]
    STR r10, [sp, #28]

    # Save r0 in r4, r1 in r5
    MOV r4, r0 @ base of the array
    MOV r5, r1 @ size of the array

    # For loop to print array
    MOV r6, #0 @ initalize outer loop counter
    MOV r7, #0 @ init inner loop counter

    # Loop limits. Inner loop limit calculated inside the loop
    SUB r8, r5, #1 @ outer loop limit = array.length - 1

    start_outer_loop:
        # Check outer loop end condition
        CMP r6, r8
        BGE end_outer_loop

        # We execute the inner loop
        MOV r7, #0 @ reset inner loop index
        SUB r9, r5, r6
        SUB r9, r9, #1 @ set inner loop limit

        start_inner_loop:
            # Check inner loop end condition
            CMP r7, r9
            BGE end_inner_loop

            # Execute inner loop
            # Check if array(j) > array(j + 1)
            ADD r0, r4, r7, LSL #2 @ j
            ADD r10, r7, #1 @ temporarily use r10 for r7 + 1, or j + 1
            ADD r1, r4, r10, LSL #2 @ j + 1
            LDR r0, [r0, #0]
            LDR r1, [r1, #0]
            CMP r0, r1
            BLE less

            ADD r0, r4, r7, LSL #2 @ j
            ADD r10, r7, #1 @ temporarily use r10 for r7 + 1, or j + 1
            ADD r1, r4, r10, LSL #2 @ j + 1            
            BL swapref

            # Continue if array(j) <= array(j + 1)
            less: 
            # Next inner loop iteration
            ADD r7, r7, #1
            B start_inner_loop
        end_inner_loop:

        # Next outer loop iteration
        ADD r6, r6, #1
        B start_outer_loop
    end_outer_loop:

    # Pop stack and return
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    LDR r6, [sp, #12]
    LDR r7, [sp, #16]
    LDR r8, [sp, #20]
    LDR r9, [sp, #24]
    LDR r10, [sp, #28]
    ADD sp, sp, #32
    MOV pc, lr

#END bubbleSort

.text
PrintArray:
	/*
	Push stack, preserve/save registers
	*/
    SUB sp, sp, #16
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]

    #save r0 in r4, r1 in r5
    MOV r4, r0
    MOV r5, r1

    #for loop to print array, initialize
    MOV r6, #0
 
    startPrintLoop:
        # Check end of loop
        CMP r5, r6
        BEQ endPrintLoop
 
        # print the value
        LDR r0, =printValue
        ADD r1, r4, r6, lsl #2 
        LDR r1, [r1,#0]
        BL printf

        # next iteration
        ADD r6, r6, #1
        B startPrintLoop
    endPrintLoop:

# pop full stack and return
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    LDR r6, [sp, #12]
    ADD sp, sp, #16
    MOV pc, lr

.data
    printValue: .asciz "%d, "
#END PrintArray

.text
swapref:
    # Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    LDR r2, [r0, #0]
    LDR r3, [r1, #0]
    STR r2, [r1, #0]
    STR r3, [r0, #0]

    # pop stack and return
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    # The unsorted array is
    unsorted_array: .asciz "The unsorted array is : "
    # The sorted array is
    sorted_ar: .asciz "The sorted array is : "
    # Newline
    newline: .asciz "\n"
    # Array size
    array_size: .word 5
    # our array
    array: .word 14
        .word -1
        .word 9
        .word 0
        .word 10
