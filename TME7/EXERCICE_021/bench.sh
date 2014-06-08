#!/bin/bash
#bench.sh

echo "#############"
echo " TEST SAISIE "
echo "#############"
echo ""
./test_saisie < donnees_test_saisie
echo ""
echo "#################"
echo " TEST FCT VALEUR "
echo "#################"
echo ""
./test_fct_valeur < donnees_test_fct_valeur
echo ""
echo "##############"
echo " TEST AJOUT 0 "
echo "##############"
echo ""
./test_ajout_0 < donnees_test_ajout_0
echo ""
echo "##############"
echo " TEST AJOUT 1 "
echo "##############"
echo ""
./test_ajout_1 < donnees_test_ajout_1
echo ""
echo "###############"
echo " TEST ADDITION "
echo "###############"
echo ""
./test_addition < donnees_test_addition
echo ""
echo "###############"
echo " TEST SCALAIRE "
echo "###############"
echo ""
./test_scalaire < donnees_test_scalaire
echo ""
echo ""
echo "#####################"
echo " TEST MULTIPLICATION "
echo "#####################"
echo ""
./test_multiplication < donnees_test_multiplication
echo ""