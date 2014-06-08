with Ada.Text_Io;
use Ada.Text_Io;

procedure Erato is
   
   task type Filtre (NP : Natural) is
      entry A_Filtrer (Num : Natural);
   end Filtre;
   
   type A_Filtre is access Filtre;
   
   function Cree_Nouveau_Filtre (NP : Natural) return A_Filtre is
   begin
      return new Filtre (NP);
   end Cree_Nouveau_Filtre;
   
   task body Filtre is
      Suiv : A_Filtre := null;
   begin
      loop
	 select
	    accept A_Filtrer (Num : Natural) do
	       if Num mod NP /= 0 then
		  if Suiv = null then
		     Put_Line (" "& Natural'Image(Num));
		     Suiv := Cree_Nouveau_Filtre (Num);
		  else
		     Suiv.all.A_Filtrer(Num);
		  end if;
	       end if;
	       return;
	    end A_Filtrer;
	 or 
	    terminate;
	 end select;
      end loop;
   end Filtre;
   
   Prems : Filtre(2);
   
begin
   Put_Line(" "& Natural'Image(2));
   
   for I in 3..100 loop
      Prems.A_Filtrer(I);
   end loop;
end Erato;
