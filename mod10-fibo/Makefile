# Title: Basic ARM Assembly Makefile template
# Purpose: Default Makefile template
# Author: Justin E
# Edit Date: DDMMMYYYY
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization

all: mod10-fibo 
 
mod10-fibo: mod10-fibo.o lib.o
	gcc -o $@ $+
 
mod10-fibo.o : mod10-fibo.s 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf mod10-fibo *.o

