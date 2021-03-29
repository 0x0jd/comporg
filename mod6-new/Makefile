# Title: Basic ARM Assembly Makefile template
# Purpose: Default Makefile template
# Author: Justin E
# Edit Date: DDMMMYYYY
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization

all: mod6-new 
 
mod6-new: mod6-new.o lib.o
	gcc -o $@ $+
 
mod6-new.o : mod6-new.s 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf mod6-new *.o

