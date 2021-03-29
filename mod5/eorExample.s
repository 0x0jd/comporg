# Template.s
# A template for assmebly program using gcc
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

    mov r0, #0x47
    mov r1, #0xf4
    EOR r2, r0, r1
# r2 now contains both r0 and r1!
# to show this retrieve r1 into r0
    eor r0, r2, r0

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data

