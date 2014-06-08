with Ada.Text_IO, Matrice;
use Ada.Text_IO, Matrice;

procedure Test_Matrice_Sure1 is
  A        : Une_Matrice_Entiere(1..10,1..9);
  B        : Une_Matrice_Entiere(1..10,1..10);
  C        : Une_Matrice_Entiere(1..10,1..10);
  D        : Une_Matrice_Entiere(1..10,1..10);
  reponse  : character;
begin

  Initialiser_Une_Matrice(A);
  Initialiser_Une_Matrice(B);
  Initialiser_Une_Matrice(D);

  Put_line("Que voulez-vous effectuer d'abord : l'addition(a) ou la multiplication(m) ?");
  get(reponse);
  if (reponse = 'a') then
	Put_line("Addition");
    C := A + B;
    Afficher_Une_Matrice(C);
    Put_line("Multiplication");
    C := A*D;
    Afficher_Une_Matrice(C);
  else 
    Put_line("Multiplication");
    C := A*D;
    Afficher_Une_Matrice(C);
	Put_line("Addition");
    C := A + B;
    Afficher_Une_Matrice(C);
  end if;
	exception
		when Taille_Non_Compatible_a =>
		   put_line("la taille des matrice ne permet pas l'operation souhaitee");
end Test_Matrice_Sure1;
