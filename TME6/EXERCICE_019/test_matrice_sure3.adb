-- 3061422
-- On peut gerer l'affection 
with Ada.Text_IO, Matrice;
use Ada.Text_IO, Matrice;

procedure Test_Matrice_Sure3 is
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
begin
    C := A + B;
    Afficher_Une_Matrice(C);
        exception
                when Taille_Non_Compatible_a =>
                        put_line("la taille des matrice ne permet pas l'operation souhaitee addition"); 
                when Taille_Non_Compatible_m =>
                        put_line("la taille des matrice ne permet pas l'operation souhaitee multiplication");  
end;
    Put_line("Multiplication");
begin
    C := A*D;
    Afficher_Une_Matrice(C);
        exception
                when Taille_Non_Compatible_a =>
                        put_line("la taille des matrice ne permet pas l'operation souhaitee addition"); 
                when Taille_Non_Compatible_m =>
                        put_line("la taille des matrice ne permet pas l'operation souhaitee multiplication");  
end;
  else 
    Put_line("Multiplication");
begin
    C := A*D;
    Afficher_Une_Matrice(C);
        exception
                when Taille_Non_Compatible_a =>
                        put_line("la taille des matrice ne permet pas l'operation souhaitee addition"); 
                when Taille_Non_Compatible_m =>
                        put_line("la taille des matrice ne permet pas l'operation souhaitee multiplication");  
end;
	Put_line("Addition");
begin
    C := A + B;
    Afficher_Une_Matrice(C);
        exception
                when Taille_Non_Compatible_a =>
                        put_line("la taille des matrice ne permet pas l'operation souhaitee addition"); 
                when Taille_Non_Compatible_m =>
                        put_line("la taille des matrice ne permet pas l'operation souhaitee multiplication");  
end;
  end if;
end Test_Matrice_Sure3;
