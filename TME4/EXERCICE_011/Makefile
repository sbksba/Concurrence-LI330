CC= gnatmake

all: lecteur_ecrivain prot_lecteur_ecrivain

lecteur_ecrivain:lecteur_ecrivain.adb
	$(CC) lecteur_ecrivain.adb

prot_lecteur_ecrivain:prot_lecteur_ecrivain.adb
	$(CC) prot_lecteur_ecrivain.adb

clean:
	rm -f *.ali *.o *~ lecteur_ecrivain prot_lecteur_ecrivain
