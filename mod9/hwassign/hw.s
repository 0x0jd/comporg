# Pseudo Code
#    push lr
#    if (r0 >= 0x30 && r0 <= 0x39) {
#       #process a a number
#       # make r0 an integer
#       sub r0, #0x30
#    }
#    else {
#        #process not a number
#    }
#
#    pop and return
#
#    NOTE: r1 and r2 will be logical variables
#
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

    mov r0, #0x47

#check if a number

    # Logical r1 = (r0 >= 0x30)
    mov r1, #0
    mov r4, #0x30
    cmp r0, r4
    movge r1, #1
  
    # Logical r2 = (r0 <= 0x39)
    mov r2, #0
    mov r4, #0x39
    cmp r0, r4
    movle r2, #1

    # r1 = r1 AND r2
    and r1, r1, r2
   
    # r0 contains the logical value of (r0 >= 0x30 && r0 <= 0x39)

# If test. If r1 is 1 (true) enter block, otherwise else
    mov r4, #0
    cmp r1, r4
    beq else
    
    # process is a number
    ldr r0, =IsNumber
    bl printf
    b endif

else:
    #process not a number
    ldr r0, =NotNumber
    bl printf

endif:

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    IsNumber:  .asciz "Is a number\n"
    NotNumber: .asciz "Not a number\n"
   
