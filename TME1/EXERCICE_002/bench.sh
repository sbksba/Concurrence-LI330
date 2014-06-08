#!/bin/bash

echo "*********************"
echo "Test Saisie Affichage"
echo "*********************"
echo ""
./test_saisie_affichage < donnees_test_saisie_affichage
echo ""
echo "*************************"
echo "Test Saisie Affichage Dim"
echo "*************************"
echo ""
./test_saisie_affichage_dim < donnees_test_saisie_affichage_dim
echo ""
echo "*************"
echo "Test Addition"
echo "*************"
echo ""
./test_addition < donnees_test_addition
echo ""
echo "*****************"
echo "Test Addition Dim"
echo "*****************"
echo ""
./test_addition_dim < donnees_test_addition_dim
echo ""
echo "*******************"
echo "Test Multiplication"
echo "*******************"
echo ""
./test_multiplication < donnees_test_multiplication
echo ""
echo "***********************"
echo "Test Multiplication Dim"
echo "***********************"
echo ""
./test_multiplication_dim < donnees_test_multiplication_dim
echo ""
echo "*************"
echo "Test Scalaire"
echo "*************"
echo ""
./test_scalaire < donnees_test_scalaire
echo ""
echo "*****************"
echo "Test Scalaire Dim"
echo "*****************"
echo ""
./test_scalaire_dim < donnees_test_scalaire_dim
