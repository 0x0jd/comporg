# Title: Basic ARM Assembly Makefile template
# Purpose: Default Makefile template
# Author: Justin E
# Edit Date: DDMMMYYYY
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization

all: XX 
 
XX: XX.o lib.o
	gcc -o $@ $+
 
XX.o : XX.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf XX *.o

