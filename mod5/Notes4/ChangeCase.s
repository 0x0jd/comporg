# Template.s
# A template for assmebly program using gcc
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

# Change upper case to lower case letter
    mov r0, #0x40
    orr r0, r0, #0x20
# examine value in r0, should be 0x60    
    
# Change lower case to upper case letter
    and r0, r0, #0xdf
# examine value in r0, should be 0x40

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data

