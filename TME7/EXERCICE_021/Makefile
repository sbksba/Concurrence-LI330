CC=gnatmake
OPTION=


all: test_addition test_ajout_0 test_ajout_1 test_fct_valeur test_multiplication test_saisie test_scalaire

test_addition: test_addition.adb
	$(CC) $<

test_ajout_0: test_ajout_0.adb
	$(CC) $<

test_ajout_1: test_ajout_1.adb
	$(CC) $<

test_fct_valeur: test_fct_valeur.adb
	$(CC) $<

test_multiplication: test_multiplication.adb
	$(CC) $<

test_saisie: test_saisie.adb
	$(CC) $<

test_scalaire: test_scalaire.adb
	$(CC) $<

.PHONY: all proper clean

proper:
	rm -f *~

clean: proper
	rm -f *.ali *.o test_addition test_ajout_0 test_ajout_1 test_fct_valeur test_multiplication test_saisie test_scalaire
