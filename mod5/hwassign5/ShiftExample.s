# Template.s
# A template for assmebly program using gcc
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

# Loading 32 0x12345678 into r0`
# into a register.
    mov r0,#0x87000000
    orr r0,r0,#0x00650000
    orr r0,r0,#0x00004300
    orr r0,r0,#0x00000021

# logical shift left
# shifts into r1, 8 bits left with zero
    lsl r1, r0, #8
# r1 contains 0x654321

# logical shift right
# shifts into r1, 8 bits right with zero
    lsr r1, r0, #8
# r1 contains 0x00876543

# rotate right
# rotates bits 8 bits right
    ror r1, r0, #8
# r1 contains 0x12786543

# arithmetic shift right
# shifts into r1, 8 bits right with sign bit(1)
    asr r1, r0, #8
# r1 contains 0xff876543

# arithmetic shift right
# change the sign bit to 0 in r0
# first set f2 to 11ffffff, then use the or to turn off
# the top byte of the word.
    and r2, #0x00000000   @ clear r2
    orr r2, #0x11000000
    orr r2, #0x00ff0000
    orr r2, #0x0000ff00
    orr r2, #0x000000ff
    and r0, r0, r2
    asr r1, r0, #8
# r1 contains 0xff876543

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data

