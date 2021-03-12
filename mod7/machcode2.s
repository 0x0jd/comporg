/*

HW1.o:     file format elf32-littlearm
Disassembly of section .text:

00000000 <_start>:
   8:	e3a03007
   c:	e2837005
  10:	e0477003
  14:	e0080793
  18:	e1a00008
  20:	e20210df
  28:	e3e03000
  2c:	e0221003
  38:	e1a03b15
  3c:	e1a031a5

*/

mov r3, #7
add r7, r3, #5
sub r7, r7, r3
mul r8, r3, r7
mov r0, r8
and r1, r2, #223
mvn r3, #0
eor r1, r2, r3
lsl r3, r0, #22
//mov r3, r0, lsl #22
lsr r3, r0
//mov r3, #1
