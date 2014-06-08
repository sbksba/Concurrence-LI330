with Ada.Text_IO, Ada.Integer_Text_IO; 
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Premier_Prog is
		
function factorielle(n : Integer) return Positive is
  fact : Positive;
  i : Positive;
begin
  fact := 1;
  for i in 2..N loop
    fact := fact*i;
  end loop;
  return fact;
end factorielle;

nombre : Integer;
res : Integer;

function Fact_Rec(N : Integer) return Positive is
begin
   if N >1 then
      return (N * Fact_Rec (N-1));
   else
      return 1;
   end if;
end Fact_Rec;

begin
  Put("Saisissez un entier : ");
  Get(nombre);
  
  while Nombre >= 0 loop
     Res := Fact_Rec(Nombre);
     Put("La factorielle de ");
     Put(Nombre,Width => 2);
     Put(" est ");
     Put(Res,Width => 9);
     New_Line;
     Get(Nombre);
  end loop;
  
  --Si nombre est négatif alors on affiche un message d'erreur et on quitte le programme
  if Nombre < 0 then
     Put("Sortie => Nombre négatif.");
  end if;
end Premier_Prog;
