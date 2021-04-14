# Title: Basic ARM Assembly Makefile template
# Purpose: Default Makefile template
# Author: Justin E
# Edit Date: DDMMMYYYY
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization

all: mod10-sumOfDigits 
 
mod10-sumOfDigits: mod10-sumOfDigits.o lib.o
	gcc -o $@ $+
 
mod10-sumOfDigits.o : mod10-sumOfDigits.s 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf mod10-sumOfDigits *.o

