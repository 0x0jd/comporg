# IOExample_3.s
# Shows using scanf for an int using data memory
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

# Prompt For An Input
    ldr r0, =prompt1
    bl  printf

#Scanf
    ldr r0, =input1
    ldr r1, =num1
    bl scanf

# Printing The Message
    ldr r0, =format1
    ldr r1, =num1
    ldr r1, [r1, #0]
    bl  printf

#Floating Point Fun
# Prompt For A Float Input
    ldr r0, =prompt2
    bl  printf

#Scanf
    ldr r0, =input2
    ldr r1, =num2
    bl scanf
    ldr r1, =num2
    vldr s14, [r1,#0]
    vcvt.F64.F32 D5, S14

# Printing the floating Message
    ldr r0, =format2
    vmov r1, r2, D5
    bl printf

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data

num2: .word 0
num1: .word 0
format1: .asciz "Friend, you provided your age to be\t%d\t!\n%d isn't \"so bad\" now, is it\?\n"
prompt1: .asciz "Greetings friend, please enter your age: "
input1: .asciz "%d"
format2: .asciz "Friend, your floating point number = %f \n"
prompt2: .ascii "Friend, please enter a floating point number: "
input2: .asciz "%f"
