with Ada.Text_Io;
use Ada.Text_Io;

package body Polynomes is

   procedure Affiche_PP(P : in T_PP) is
      First : Boolean := TRUE;
   begin
      for I in P'Range loop
	 if P(I) /= 0 then
	    if First then
	       Put (Natural'Image(P(I)) & " X^" & Natural'Image(I - P'first));
	       First := FALSE;
	    else
	       Put (" + " & Natural'Image(P(I)) & " X^" & Natural'Image(I - P'first));
	    end if;
	 end if;
      end loop;
      New_Line;
   end Affiche_PP;
   
   function Somme_PP(PP1,PP2 : T_PP) return T_PP is 
      Somme : T_PP (0 .. PP1'Length+PP2'Length);
   begin
      if PP2'Length > PP1'Length then 
	 Somme := Somme_Aux(PP1, PP2);
      else 
	 Somme := Somme_Aux(PP2, PP1);
      end if; 
      
      return Somme;
   end Somme_PP;
   
   function Somme_Aux(PP1,PP2 : T_PP) return T_PP is
      Somme: T_PP (0 .. PP2'Length-1);    
   begin 
      for I in 0 .. PP1'Length-1 loop
	 Somme (I) := PP1(PP1'First +I)+PP2(PP2'First +I);
      end loop; 
      for I in PP1'Length .. PP2'Length-1 loop
	 Somme (I) := PP2(PP2'First+I); 
      end loop;
      return Somme;
   end Somme_Aux;  
   
   
   function Derive_PP(PP : T_PP) return T_PP is 
     Derive : T_PP (PP'First +1 .. PP'Last) ;
   begin
      for I in Derive'Range loop
	 Derive (I) := PP(I)*(I - PP'First);
      end loop; 
      return Derive;
   end Derive_PP;
   
   function Evalue_PP(PP : T_PP; X : Integer) return Integer is 
      Res : Integer := 0;
   begin
      for I in PP'Range loop
	 Res := Res + PP(I)*(X**(I - PP'First)); 
      end loop; 
      return Res;
   end Evalue_PP;
   
end Polynomes;
