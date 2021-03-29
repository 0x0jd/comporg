# Template.s
# A template for assmebly program using gcc
    .text
    .global main

main:
# Save return to OPS
    sub sp, sp, #4
    str lr, [sp, #0]

    mov r0, #0x32
 
# Check if r0 is a number.  If it is a number (0x30 <= num <= 0x39)
# make it an integer by subtracting 0x30 (int 48) from 
# the character, and then run the process a number section
# (Note process a number is not specified, it is just a label
# and a comment).  If # not a number, process not a number
# (Note same rule as for process a number)..

    mov r4, #0x30
    cmp r0, r4
    blt NotANumber
    
    mov r4, #39
    cmp r0, r4
    blt ConvertToInteger
    b NotANumber

IsANumber:
    #Process for is a number

# Return to the OS
    mov pc, lr

NotANumber:
    #Process for not a number

# Pop stack and return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

# Convert to an integer
ConvertToInteger:
    sub r0, #0x30
    b IsANumber

.data

