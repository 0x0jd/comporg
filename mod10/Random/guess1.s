.data

welcome_msg:  .asciz  "Welcome to the Number Guessing Game.\n"
help_msg:     .ASCII  "This game is for two players only,\n"
              .asciz  "each player has two tries, but the second try won't count!\n"
seed_msg:     .asciz  "Enter a seed for the random generator: "

selected_msg: .asciz  "\nPlayer turn: Player %d\n" 

prompt_msg:   .ascii  "What is you guess number?\n"
              .ascii  " Your guess should be between 1 - 100.\n"
              .asciz  " Enter your guess here or type 0 to pass on your turn:\n"

passes_msg:   .asciz  "Player %d has %d passes left.\n"

no_pass_msg:  .asciz  "You can't use pass twice in a row\n"
out_pass_msg: .asciz  "You used up all your passes.\n"

wins_msg:     .ascii  "You win!!\n"
              .asciz  "It took %d tries to get the answer.\n"

lower_msg:    .asciz  "Go lower next time!\n"
higher_msg:   .asciz  "Go higher next time!\n"
again_msg:    .asciz  "One more try\n"

int_fmt:      .asciz  "%d"

seed:         .word 0
guess:        .word 0
rand_num:     .word 0

div_result:   .word 0
              .word 0

re_pass1:     .word 0
re_pass2:     .word 0

passes1:      .word 3
passes2:      .word 3

tries1:       .word 0
tries2:       .word 0

turns1:       .word 2
turns2:       .word 2

.text
.global main

main:
  push {lr}
  
  // Print welcome message
  ldr r0, =welcome_msg   // load address of string to print
  bl printf             // print string with printf
  // Print help message
  ldr r0, =help_msg   // load address of string to print
  bl printf             // print string with printf
  // Print seed message
  ldr r0, =seed_msg   // load address of string to print
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

  // Print player
  ldr r0, =selected_msg  // load address of string to print
  add r1, r4, #1
  bl printf             // print string with printf

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

  ldr r1, =passes1  // load current number of passes for the player
  ldr r0, [r1, r4, LSL #2]
  cmp r0, #0        // see if there are passes left
  beq no_pass       // if not, print no more passes

  ldr r2, =re_pass1    // load repeated pass for current player
  ldr r3, [r2, r4, LSL #2]

  cmp r3, #0        // see if it's a repeated pass
  bne rep_pass      // if repeated, print error

  add r3, r3, #1    // else, set repeated pass
  str r3, [r2, r4, LSL #2]

  sub r0, r0, #1    // decrement number of passes
  str r0, [r1, r4, LSL #2]     // update pass variable for the player

  // Print remaining passes message
  add r1, r4, #1        // set player number
  mov r2, r0          // set number of passes left
  ldr r0, =passes_msg  // load address of string to print
  bl printf             // print string with printf

  bal change          // change player turn
rep_pass:
  // Print repeated pass message
  ldr r0, =no_pass_msg  // load address of string to print
  bl printf             // print string with printf
  bal read_guess         // read guess

no_pass:
  // Print no more passes message
  ldr r0, =out_pass_msg  // load address of string to print
  bl printf             // print string with printf
  bal read_guess       // read guess

start_game:
  ldr r0, =re_pass1    // clear repeated pass for current player
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

  CMP r0, r1      // if numbers are equal, player wins
  beq win

  blt try_lower   // if the number is lower, try lower

  // else, try higher
  ldr r0, =higher_msg     // load address of string to print
  bl printf             // print string with printf
  bal change_turn

try_lower:
  ldr r0, =lower_msg     // load address of string to print
  bl printf             // print string with printf

change_turn:
  ldr r1, =turns1         // get number of turns for player
  ldr r0,[r1, r4, LSL #2]
  sub r0, r0, #1          // decrement turns
  str r0,[r1, r4, LSL #2]
  cmp r0, #0
  ble change            // if zero, change player

  // else, try again
  ldr r0, =again_msg    // load address of string to print
  bl printf             // print string with printf
  bal read_guess
change:

  eor r4, r4, #1        // change player 0 to 1 or 1 to 0
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
