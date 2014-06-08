with Ada.Text_Io;
use Ada.Text_Io;

procedure Erato_Statique is
   
   type Nb_Premiers;
   type A_Nb_Premiers is access Nb_Premiers;
   
   type Nb_Premiers is record
      N : Natural;
      Suiv : A_Nb_Premiers;
   end record;
   
   procedure Affichage (L : in A_Nb_Premiers) is 
      P : A_Nb_Premiers := L;
   begin
      while P /= null loop
	 Put(Natural'Image(P.N) &" ");
	 P := P.all.Suiv;
      end loop;
   end Affichage;
   
   function Ajouter_Nb_Premiers (L : in A_Nb_Premiers; N : Natural) return A_Nb_Premiers is
      P : A_Nb_Premiers := L;
   begin
      if P = null then
	 return new Nb_Premiers'(N,null);
      end if;
      
      while (P.all.Suiv /= null) loop
	 P := P.all.Suiv;
      end loop;
      
      P.all.Suiv := new Nb_Premiers'(N,null);
      return L;
   end Ajouter_Nb_Premiers;
   
   procedure Filtrer (N : in Natural; L : in out A_Nb_Premiers) is
      P : A_Nb_Premiers := L;
   begin
      while P /= null loop
	 if N mod P.all.N /= 0 then
	    P := P.all.Suiv;
	 else
	    return;
	 end if;
      end loop;
      
      L := Ajouter_Nb_Premiers(L,N);
   end Filtrer;
   
   Liste_Nb_Premiers : A_Nb_Premiers;
   
begin
   Liste_Nb_Premiers := new Nb_Premiers'(2,null);
   
   for I in 3..100 loop
      Filtrer (I,Liste_Nb_Premiers);
   end loop;
   
   Affichage (Liste_Nb_Premiers);
end Erato_Statique;
