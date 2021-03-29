/* Preamble
# Title: ARM Assembly Template
# Purpose: Week/Mod6 HW Assign
# Author: Justin E
# Edit Date: 05MAR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization
End Preamble */

.text
.global main

/*Main program */
main:
/*Program setup, preamble*/
    sub sp, sp, #4
    str lr, [sp, #0]

/*Meat of the program
    ldr r0, =message
    bl printf
*/ 
    mov r1, #1
    mov r2, #2
    mov r3, #1
    mov r4, #1
    mov r5, #10
    mov r8, #2
/* Part one of HW drawn on diagrams */
    lsl r1, r2, #3 
    add r3, r4, r5, lsl r4
    sub r4, r8, r5, asl #2


/*Part two of the homework*/
    mov r7, #198
    mov r8, #260
    mov r9, #9216
    mov r10, #2162688
    mvn r11, #75
//    mvn r12, #265 // Had to comment out due to compile issue, can't compile, too many 1's
//    mvn r12, #256 //as a POC
//    mov r12, #265 //as a POC

/*Part three of hw assign*/
    mov r1, #0b1, 22
    mov r2, #0b1001, 28
    mov r3, #0b10010001, 30
    mov r4, #0b1001, 16
    mvn r5, #0b100010
    mvn r6, #0b1001, 20

/*Program teardown,  */
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

/*Data Section of the program */
.data
//    message: .asciz "Justin E\n"


/* objdump -s -d $file, provided decimal and binary of mov/mvn shifts
000103d0 <main>:
   103d0:	e24dd004 	sub	sp, sp, #4
   103d4:	e58de000 	str	lr, [sp]
   103d8:	e3a01001 	mov	r1, #1
   103dc:	e3a02001 	mov	r2, #1
   103e0:	e3a03001 	mov	r3, #1
   103e4:	e3a04001 	mov	r4, #1
   103e8:	e3a05001 	mov	r5, #1
   103ec:	e1a01182 	lsl	r1, r2, #3
   103f0:	e0821413 	add	r1, r2, r3, lsl r4
   103f4:	e0484105 	sub	r4, r8, r5, lsl #2
   103f8:	e3a070c6 	mov	r7, #198	; 0xc6 0b11000110
   103fc:	e3a08f41 	mov	r8, #260	; 0x104 0b000100000100 rotated all but 2
   10400:	e3a09b09 	mov	r9, #9216	; 0x2400 0b0010010000000000
   10404:	e3a0a821 	mov	sl, #2162688	; 0x210000 0b001000010000000000000000
   10408:	e3e0b04b 	mvn	fp, #75 	; 0x4b 0b01001011
   1040c:	e3e0cc01 	mvn	ip, #256	; 0x100 0b000100000000
   10410:	e3a01b01 	mov	r1, #1024	; 0x400
   10414:	e3a02e09 	mov	r2, #9, 28	; 0x90
   10418:	e3a03f91 	mov	r3, #580	; 0x244
   1041c:	e3a04809 	mov	r4, #589824	; 0x90000
   10420:	e3e05022 	mvn	r5, #34	; 0x22
   10424:	e3e06a09 	mvn	r6, #36864	; 0x9000
   10428:	e59de000 	ldr	lr, [sp]
   1042c:	e28dd004 	add	sp, sp, #4
   10430:	e1a0f00e 	mov	pc, lr
     0x10400 <main+48>        mov    r1,  #1024 	; 0x400 1024 0b010000000000
→    0x10404 <main+52>        mov    r2,  #9,  28	; 0x90 144 0b10010000
     0x10408 <main+56>        mov    r3,  #580  	; 0x244 580 0b001001000100
     0x1040c <main+60>        mov    r4,  #589824	; 0x90000 589824 0b10010000000000000000
     0x10410 <main+64>        mvn    r5,  #34   	; 0x22 34 0b00100010
     0x10414 <main+68>        mvn    r6,  #36864	; 0x9000 36864 0b1001000000000000
*/
