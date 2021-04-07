# Title: Basic ARM Assembly Makefile template
# Purpose: Default Makefile template
# Author: Justin E
# Edit Date: 05APR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization

all: mod9-guessing 
 
mod9-guessing: mod9-guessing.o lib.o
	gcc -o $@ $+
 
mod9-guessing.o : mod9-guessing.s 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf mod9-guessing *.o

