.text
.global F2C 
.global Ft2Inches

F2C:
# Push stack
    sub sp, sp, #4
    str lr, [sp, #0]

    mov r1, #-32
    add r0, r0, r1
    mov r1, #5 
    mul r0, r0, r1
    mov r1, #9
    bl __aeabi_idiv
    add r5, r5, r6

# Pop stack
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

Ft2Inches:
# Push stack
    sub sp, sp, #4
    str lr, [sp, #0]
    mov r1, #12
    mul r0, r0, r1

# Pop stack
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    output1: .asciz "After call to div\n"
