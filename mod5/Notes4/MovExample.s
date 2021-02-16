# Template.s
# A template for assmebly program using gcc
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

    mov r0, #0x12
    mov r1, r0

# Loading 32 bit immediate values
# into a register.
    # This could be done with movw and movt, but they
    # are not implemented on my Pi
    # movw r0, #0x1234
    # movt r0, #0x5678
    mov r0,#0x12000000
    orr r0,r0,#0x00340000
    orr r0,r0,#0x00005600
    orr r0,r0,#0x00000078

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data

