CC= gnatmake

all: arbrebinaire

arbrebinaire : arbrebinaire.adb
	$(CC) $<

.PHONY: all proper clean

proper:
	rm -f *~

clean: proper
	rm -f *.o *.ali arbrebinaire
