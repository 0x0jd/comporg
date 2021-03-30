# Title: Basic ARM Assembly Makefile template
# Purpose: Default Makefile template
# Author: Justin E
# Edit Date: DDMMMYYYY
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization

all:  

MYLIBS = Conversions.o
CC = gcc

: MOD8.o lib.o
	gcc -o $@ $+
 
MOD8.o : MOD8.s 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf MOD8 *.o

