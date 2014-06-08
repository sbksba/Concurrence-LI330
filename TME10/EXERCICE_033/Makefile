CC= gnatmake

all: anneau_double

anneau_double: anneau_double.adb
	$(CC) $<

.PHONY: all proper clean

proper:
	rm -f *~
clean: proper
	rm -f *.o *.ali anneau_double
