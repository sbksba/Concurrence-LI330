with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_Io, Ada.Integer_Text_IO;

procedure Recherche is
   
   type Tableau is array (Natural range <>) of Integer;
   Trouve_Exc_True : exception;
   Trouve_Exc_False : exception;
   
   function Trouve(Tab : Tableau; Element : Integer) return Boolean is
      OK : Boolean;
      I : Natural;
   begin
      OK := False;
      I := Tab'First;
      if Tab(I) = Element then
	 raise Trouve_Exc_True;
      end if;
      if I = Tab'Last then
	 raise Trouve_Exc_False;
      end if;
      OK := Trouve(Tab(Tab'First+1..Tab'Last),Element);
      --
      --while (not OK and then i <= tab'last)
      --loop
      --OK := tab(i) = element;
      --i := i+1;
      --end loop;
      --return OK;
      --
      return OK;
   end Trouve;
   
   Mon_Tab : Tableau(1..10);
begin
   Mon_Tab := (3, -2, 5, 7, -7, 1, -5, 0, 9, 4);
   for Elem in -10 .. 10
   loop
      begin
	 if Trouve(Mon_Tab, Elem) then
	    Put_Line("L'element " & Natural'Image(Elem) & " se trouve dans le tableau");
	 else
	    Put_Line("L'element " & Natural'Image(Elem) & " ne se trouve pas dans le tableau");
	 end if;
      exception
	 when Trouve_Exc_True =>
	    Put_Line("element trouve "&Natural'Image(Elem));
	 when Trouve_Exc_False =>
	    Put_Line("element non trouve "&Natural'Image(Elem));
      end;
   end loop;
end Recherche;
