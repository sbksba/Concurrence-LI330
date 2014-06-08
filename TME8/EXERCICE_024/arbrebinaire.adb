with Ada.Text_Io, Ada.Numerics.Discrete_Random;
use Ada.Text_Io;

procedure ArbreBinaire is
   
   package Alea_Int is new Ada.Numerics.Discrete_Random (Natural);
   use Alea_Int;
   
   Graine : Generator;
   Nb_Valeurs : constant Positive := 20;
   
   task type Noeud (Valeur : Natural) is
      entry Recoit (Val : in Natural);
      entry Affiche;
   end Noeud;
   
   type Acc_Noeud is access Noeud;
   
   function Nouveau_Noeud (Val : in Natural) return Acc_Noeud is
   begin
      return new Noeud (Val);
   end Nouveau_Noeud;
   
   task body Noeud is
      Fils_Gauche, Fils_Droit : Acc_Noeud := null;
      Cpt : Integer := 0;
   begin
      loop
	 select
	    accept Recoit (Val : in Natural) do
	       if Val = Valeur then
		  Cpt := Cpt + 1;
	       elsif Val < Valeur then
		  if Fils_Gauche = null then
		     Fils_Gauche := Nouveau_Noeud(Val);
		  else
		     Fils_Gauche.all.Recoit(Val);
		  end if;
	       else
		  if Fils_Droit = null then
		     Fils_Droit := Nouveau_Noeud(Val);
		  else
		     Fils_Droit.all.Recoit(Val);
		  end if;
	       end if;
	    end Recoit;
	 or
	    accept Affiche do
	       if Fils_Gauche /= null then
		  Fils_Gauche.all.Affiche;
	       end if;
	       
	       Put_Line("Discriminant : "& Natural'Image(Valeur) &" ,compteur : "& Natural'Image(Cpt));
	       
	       if Fils_Droit /= null then
		  Fils_Droit.all.Affiche;
	       end if;
	    end Affiche;
	 or
	    terminate;
	 end select;
      end loop;
   end Noeud;
   
   Racine : Acc_Noeud;
   Ra : Integer;
   I : Integer := 0;
   
begin
   Alea_Int.Reset(Graine);
   Ra := Random(Graine) mod (Nb_Valeurs-1);
   Racine := Nouveau_Noeud(Ra);
   
   while I /= 10
   loop
      Ra := Random(Graine) mod (Nb_Valeurs-1);
      Racine.all.Recoit(Ra);
      I := I + 1;
   end loop;
   
   Racine.Affiche;
end ArbreBinaire;
