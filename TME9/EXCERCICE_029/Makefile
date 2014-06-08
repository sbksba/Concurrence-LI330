CC=gnatmake

all: choix_serveur

choix_serveur: choix_serveur.adb
	$(CC) $<

.PHONY: all proper clean

proper:
	rm -f *~

clean : proper
	rm -f *.o *.ali choix_serveur
