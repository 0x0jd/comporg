.text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

    mov r0, #28
    mov r1, #5
    bl Remainder
    mov r1, r0
    ldr r0, =output
    bl printf


# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    output: .asciz "Summation is %d\n"


.text
#END Summation

