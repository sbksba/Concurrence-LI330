CC= gnatmake

all: erato erato_statique

erato : erato.adb
	$(CC) $<

erato_statique : erato_statique.adb
	$(CC) $<

.PHONY: all proper clean

proper:
	rm -f *~

clean: proper
	rm -f *.o *.ali erato erato_statique
