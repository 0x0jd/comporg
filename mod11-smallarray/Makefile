# Title: Basic ARM Assembly Makefile template
# Purpose: Default Makefile template
# Author: Justin E
# Edit Date: 17APR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization

all: mod11-smallarray 
 
mod11-smallarray: mod11-smallarray.o lib.o
	gcc -o $@ $+
 
mod11-smallarray.o : mod11-smallarray.s 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf mod11-smallarray *.o

