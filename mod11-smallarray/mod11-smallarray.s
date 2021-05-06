/* Preamble
# Title: ARM Assembly Template
# Purpose: A function to find the smallest value in an array
# Author: Justin E
# Edit Date: 17APR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.text
.global main

main:
	# Push
	SUB sp, sp, #4
	STR lr, [sp, #0]

    # Find the smallest element
    LDR r0, =array
    LDR r1, =array_size
    LDR r1, [r1, #0]
    BL Smallest

    # Print the smallest element in r1
    LDR r0, =output
    BL printf

	# Pop
	MOV r0, #0
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
    output: .asciz "\nThe smallest element is %d. \n"
    array_size: .word 5
    array: .word 15
        .word 1
        .word 27
        .word -9
        .word 16

.text
Smallest:
	/* Push stack, save/preserve registers*/
    SUB sp, sp, #20
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]
    STR r7, [sp, #16]

    # Save r0 in r4, r1 in r5
    MOV r4, r0
    MOV r5, r1

    # For loop to print array
    MOV r6, #0 @ initalize loop counter

    # Initialize smallest in r7 as the first element in the array
    ADD r7, r4, r6, LSL #2
    LDR r7, [r7, #0]
 
    start_loop:
        # Check end of loop
        CMP r5, r6
        BEQ end_loop
 
        # Calculate the address of the reference 
        # Check if smallest
        ADD r1, r4, r6, lsl #2
        LDR r1, [r1, #0] @ ar(r1)
        CMP r1, r7
        BGE not_larger @ branch to not_larger if the current array element is not smaller than r7

        # Replace r7 if the current array element is smaller than r7
        MOV r7, r1

        not_larger:
            # next iteration
            ADD r6, r6, #1
            B start_loop
    end_loop:

    # Return smallest in r1
    MOV r1, r7

    # Pop stack and return
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    LDR r6, [sp, #12]
    LDR r7, [sp, #16]
    ADD sp, sp, #20
    MOV pc, lr
