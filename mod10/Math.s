.global Random
.global Remainder

#  Calcualte a random number
#  arguments: 	r0 - seed  (if seed is 0, get next random value)
#  		r1 - range (from 1 to r1).  If r1 is 0 or negative, range is all ints)
#
Random:
    sub sp, sp, #8
    # Save return to os on stack
    str lr, [sp, #0] @ Prompt For An Input
    str r4, [sp, #4]

#
    mov r3, #0
    cmp r0, r3
    bne Reset
        ldr r0, =seed    	@ get the seed
        ldr r0, [r0, #0]
    Reset:

    add r0, r0, #137   	@ get the next seed
    eor r0, r0, r0, ror #13
    lsr r0, r0, #1	@ make sure it is positive
    mov r4, r0		@ save the value to r4

# Get the remainder
    mov r3, #0
    cmp r1, r3
    ble NoRange
        bl __aeabi_idiv
        mul r1, r0, r1
        sub r4, r4, r1
    NoRange:

# Save the see to memory
    ldr r0,=seed
    str r4,[r0, #0]

# Return to the OS
    mov r0, r4
    ldr lr, [sp, #0]
    ldr r4, [sp, #4]
    add sp, sp, #8
    mov pc, lr

.data
    seed:     .word 25
#end Random

#  Calcualte the remainder
#  returns: 	r0 - remainder
#  arguments: 	r0 - quotient
#  		r1 - divisor
#
Remainder:
    sub sp, sp, #8
    # Save return to os on stack
    str lr, [sp, #0] @ Prompt For An Input
    str r4, [sp, #4]

        mov r4, r0
        bl __aeabi_idiv
        mul r1, r0, r1
        sub r4, r4, r1

# Return to the OS
    mov r0, r4
    ldr lr, [sp, #0]
    ldr r4, [sp, #4]
    add sp, sp, #8
    mov pc, lr

#end Remainder

