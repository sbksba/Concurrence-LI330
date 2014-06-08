CC= gnatmake

all: anneau_min

anneau_min: anneau_min.adb
	$(CC) $<

.PHONY: all proper clean

proper:
	rm -f *~
clean: proper
	rm -f *.o *.ali anneau_min
