/* Preamble
# Title: ARM Assembly Template
# Purpose: MOD9 Program 1, Prime Number Functions
# Author: Justin E
# Edit Date: 05APR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.global main
.text

main:
    #Main Prologue
    sub sp, sp, #4
    str lr, [sp, #0]

    #User Input prompt1 for up to n'th prime
    ldr r0, =prompt1
    bl printf

    #Read User Input N into primen
    ldr r0, =input    //load into r0
    ldr r1, =num1    //load into r1
    bl scanf

    mov r0, =num1
    cmp r0, #1 //compare with #1
    beq IsPrime
    
    cmp r0, #2 //compare with #2
    beq IsPrime
    
    cmp r0, #3 //compare with #3
    beq IsPrime
    
    bl division //otherwise, branch to division function
    
    cmp r8, #00
    
    
division:
    mov r8, r0
    mov r9, r2
    
    loop:
    sub r8, r8, r9
    add r10, r10, #01
    cmp r8, r9
    bpl loop
    b Return
    
IsPrime:
    #process prime number statement
    ldr r0, =primeout
    bl printf

NotPrime:
    #process not a prime number statement
    ldr r0, =nonprimeout
    bl printf
    
Return:
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
    prompt1: .asciz "Please enter a number to see all Prime numbers up to that number: \n"
    input: .asciz "%d"
    primen: .word 0
    output: .asciz "Your prime numbers are: %d \n"
    primeout: .asciz "Number %d is prime. \n"
    nonprimeout: .asciz "Number %d is not prime. \n"


/*
1 - Write a program to find prime numbers from 3 to n in a loop by dividing the number n by all numbers from 2..n/2 in an inner loop. Using the remainder (rem) operation, determine if n is divisible by any number. If n is divisible, leave the inner loop. If the limit of n/2 is reached and the inner loop has not been exited, the number is prime and you should output the number. So if the user were to enter 25, your program would print out "2, 3, 5, 7, 11, 13, 17, 19, 23".

2 - Write a program to prompt the user for a number, and determine if that number is prime. Your program should print out "Number n is prime" if the number is prime, and "Number n is not prime if the number is not prime. The user should be able to enter a "-1" to end the problem. It should print an error if 0, 1, 2 or any negative number other than -1 are entered.

*/
