# Title: Basic ARM Assembly Makefile template
# Purpose: Default Makefile template, week7
# Author: Justin E
# Edit Date: 15MAR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization

all: mod7 
 
mod7: mod7.o lib.o
	gcc -o $@ $+
 
mod7.o : mod7.s 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf mod7 *.o

