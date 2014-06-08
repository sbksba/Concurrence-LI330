CC=gnatmake

all: composants

composants: composants.adb
	$(CC) $<

.PHONY: all proper clean

proper:
	rm -f *~

clean : proper
	rm -f *.o *.ali composants
