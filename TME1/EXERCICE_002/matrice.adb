with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Matrice is
   
   Read : Integer;
  -- procedure d'initialisation d'une matrice par saisie des valeurs au clavier
  -- l'initialisation doit se faire ligne par ligne
  procedure Initialiser_Une_Matrice(Matrice: in out Une_Matrice_Entiere) is
     -- A completer
     begin
     for I in Matrice'Range(1) loop
	for J in Matrice'Range(2) loop
	   Get(Read);
	   Matrice(I,J) := Read;
	end loop;
     end loop;
  end Initialiser_Une_Matrice;

  -- procedure d'affichage d'une matrice 
  procedure Afficher_Une_Matrice(Matrice : in Une_Matrice_Entiere) is
     -- A completer
  begin   
     for I in Matrice'Range(1) loop
	for J in Matrice'Range(2) loop
	   Put(Matrice(I,J));
	   Put(" ");
	end loop;
	New_Line;
     end loop;
  end Afficher_Une_Matrice;
	
  -- fonction d'addition de 2 matrices
  function "+"(Matrice1, Matrice2 : Une_Matrice_Entiere) return Une_Matrice_Entiere is
     -- A completer
     Res : Une_Matrice_Entiere (Matrice1'range(1),Matrice1'Range(2));
     K : Integer := Matrice2'First(1);
     T : Integer := Matrice2'First(2);
  begin   
     for I in Matrice1'Range(1) loop
	for J in Matrice1'Range(2) loop
	   Res(I,J) := Matrice1(I,J) + Matrice2(K,T);
	   T:=T+1;
	end loop;
	T:=Matrice2'First(2);
	K:=K+1;
     end loop;
     return Res;
  end "+";
  
  -- fonction de multiplication d'une matrice par un scalaire
  function "*"(Matrice  : in Une_Matrice_Entiere; Scalaire : Integer) return Une_Matrice_Entiere is
     -- A completer
     Res : Une_Matrice_Entiere (Matrice'range(1),Matrice'range(2));
  begin   
     for I in Matrice'Range(1) loop
	for J in Matrice'Range(2) loop
	   Res(I,J) := Matrice(I,J) * Scalaire;
	end loop;
     end loop;
     return Res;
  end "*";

  -- fonction de multiplication d'un scalaire par une matrice
  function "*"(Scalaire : Integer; Matrice  : in Une_Matrice_Entiere) return Une_Matrice_Entiere is
  begin
     -- A completer
     return "*"(Matrice,Scalaire);
  end "*";

  -- fonction de multiplication d'une matrice par une matrice
  function "*"(Matrice1, Matrice2 : in Une_Matrice_Entiere) return Une_Matrice_Entiere is
     -- A completer
     Mat : Une_Matrice_Entiere( 1 .. Matrice1'Length (1), 1 .. Matrice2'Length (2));
     A : Integer := 0;
     
  begin
     for I in Mat'Range (1) loop
	for J in Mat'Range (2) loop
	   for K in 1 .. Matrice1'Length (2) loop
	      A := A+ (Matrice1 (Matrice1'First (1)-1+I, Matrice1'First (2)-1+K) *Matrice2 (Matrice2'First (1)-1+K, Matrice2'First (2)-1+J));
	   end loop;
	   Mat (I, J) := A; 
	   A := 0; 
	end loop;
     end loop;
     return Mat;
  end "*";

end Matrice;

