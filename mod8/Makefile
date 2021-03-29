all: F2C Ft2Inches

MYLIBS = Conversions.o
CC = gcc

F2C: F2C.o $(MYLIBS)
	$(CC) $@.o $(MYLIBS) -g -o $@ 

Ft2Inches: Ft2Inches.o $(MYLIBS)
	$(CC) $@.o $(MYLIBS) -g -o $@ 

.s.o: 
	$(CC) $(@:.o=.s) -g -c -o $@

clean:
	rm *.o



