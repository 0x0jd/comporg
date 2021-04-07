/* Preamble
# Title: ARM Assembly Template
# Purpose: MOD9 Program 2, Guessing game, not going to lie - had to get some help on this one and still having some issues, but a great start and will continue to code
# Author: Justin E
# Edit Date: 05APR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */


.text
.global main

main:
    #Main Prologue
    sub sp, sp, #4
    str lr, [sp, #0]

    // Print welcome message
    ldr r0, =prompt1   // load address of string to print
    bl printf                 // print string with printf

    // Print seed message
    ldr r0, =prompt2   // load address of string to print
    bl printf             // print string with printf

    // read seed
    ldr r0,=int_fmt   // load int format for scanf
    ldr r1, =seed     // place to save read int
    bl scanf          // read integer

    ldr r0, =seed   // load seed input
    ldr r0, [r0]
    bl srand        // initialize random generator

    bl rand         // generate random number for player
    and r4, r0, #1  // set to 0 or 1

    bl rand         // generate random number for game
    mov r1, r0      // divide random number
    mov r2, #100    // divide by 100
    ldr r0, =div_result // save result in variable
    bl div

    ldr r0, =div_result // load division remainder
    ldr r0, [r0, #4]
    add r0, r0, #1    // increment to get a number between 1 and 100

    ldr r1, =rand_num // save random number in variable
    str r0, [r1]

game_loop:

    ldr r1, =turns1         // set number of turns for player to 2
    mov r0, #2
    str r0,[r1, r4, LSL #2]

read_guess:

    // Print guess prompt message
    ldr r0, =prompt_msg   // load address of string to print
    bl printf             // print string with printf

    // read guess
    ldr r0,=int_fmt   // load int format for scanf
    ldr r1, =guess    // place to save read int
    bl scanf          // read integer

    ldr r0, =guess     // load guess input
    ldr r0, [r0]

    cmp r0, #0        // see if the user wants to pass
    bne start_game    // if not, start game

    add r3, r3, #1    // else, set repeated pass
    str r3, [r2, r4, LSL #2]

    sub r0, r0, #1    // decrement number of passes
    str r0, [r1, r4, LSL #2]     // update pass variable for the player

    bal change          // change player turn


start_game:
    mov r1, #0
    str r1, [r0, r4, LSL #2]

    ldr r0, =turns1         // get number of turns for player
    ldr r1,[r0, r4, LSL #2]
    cmp r1, #2    
    blt no_count            // if second turn, don't count as try

    ldr r0, =tries1         // load tries
    ldr r1, [r0, r4, LSL #2]  
    add r1, r1, #1        // increment number of tries
    str r1, [r0, r4, LSL #2]  // update variable

no_count:
    ldr r0, =rand_num   // load random number
    ldr r0, [r0]
    ldr r1, =guess   // load guess
    ldr r1, [r1]
    cmp r0, r1      // if numbers are equal, player wins
    beq win
    blt try_lower   // if the number is lower, try lower
    // else, try higher
    ldr r0, =higher_msg     // load address of string to print
    bl printf             // print string with printf

try_lower:
    ldr r0, =lower_msg     // load address of string to print
    bl printf             // print string with printf
    bal read_guess

change:
    bal game_loop         // restart game

win:
    // Print winning message
    ldr r1, =tries1         // load tries
    ldr r1, [r1, r4, LSL #2]  
    ldr r0, =wins_msg     // load address of string to print
    bl printf             // print string with printf

    mov r0,#0             // return 0
    pop {lr}
    bx lr

.data
prompt1:  .asciz  "Welcome to the Number Guessing Game.\n"
prompt2:     .asciz  "Enter a seed for the random generator: "

prompt_msg:   .ascii  "What is you guess number?\n"
              .ascii  " Your guess should be between 1 - 100.\n"

wins_msg:     .ascii  "You win!!\n"
              .asciz  "It took %d tries to get the answer.\n"

lower_msg:    .asciz  "Go lower next time!\n"
higher_msg:   .asciz  "Go higher next time!\n"
int_fmt:      .asciz  "%d"
seed:         .word 0
guess:        .word 0
rand_num:     .word 0
div_result:   .word 0
tries1:       .word 0
turns1:       .word 2

