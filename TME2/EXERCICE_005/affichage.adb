with Ada.Text_Io,Ada.Integer_text_io;
use Ada.Text_Io,Ada.Integer_text_io;

procedure Affichage is 
   Fin : constant Natural := 10;
   
   -- Declaration d un type tache avec un entier natural comme descriminant
   task type Boucle (N: Natural);
   
   -- Corps de la tache qui affiche les "fin" premiers entiers
   -- (en s identifiant a chaque affichage) et qui signale a la fin qu elle a termine
   task body Boucle is
   begin
      Put_Line("t: "&Natural'Image(N));
      for I in 0..Fin-1 loop
	 Put_Line(Natural'Image(I));
      end loop;
      Put_Line("t: "&Natural'Image(N)&" se termine");
   end Boucle;
   
begin
   Put_Line("--Debut tache principale--");
   declare
      T1 : Boucle(1);
      T2 : Boucle(2);
      T3 : Boucle(3);
      T4 : Boucle(4);
      T5 : Boucle(5);
      T6 : Boucle(6);
      
   begin
      null;
   end;
   
   Put_Line("--Fin tache principale--");
end Affichage;
