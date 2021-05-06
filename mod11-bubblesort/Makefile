# Title: Basic ARM Assembly Makefile template
# Purpose: Default Makefile template
# Author: Justin E
# Edit Date: DDMMMYYYY
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization

all: mod11-bubblesort 
 
mod11-bubblesort: mod11-bubblesort.o lib.o
	gcc -o $@ $+
 
mod11-bubblesort.o : mod11-bubblesort.s 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf mod11-bubblesort *.o

