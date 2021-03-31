# Title: Basic ARM Assembly Makefile template
# Purpose: Default Makefile template
# Author: Justin E
# Edit Date: 30MAR2021
# JHU - COMP ORG - EN.605.204.8VL.SP21 Computer Organization

all: k2m kph mph part2main

MYLIBS=Conversions.o
CC=gcc

k2m: k2m.o $(MYLIBS)
	$(CC) $@.o $(MYLIBS) -g -o $@
	./$@

kph: kph.o $(MYLIBS)
	$(CC) $@.o $(MYLIBS) -g -o $@
	./$@

mph: mph.o $(MYLIBS)
	$(CC) $@.o $(MYLIBS) -g -o $@
	./$@

part2main: part2main.o $(MYLIBS)
	$(CC) $@.o $(MYLIBS) -g -o $@
	./$@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@

clean:
	rm *.o k2m kph mph part2main

