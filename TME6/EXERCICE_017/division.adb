with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_Io, Ada.Integer_Text_IO;

procedure Division is
   DIV_ZERO : exception;
   function Division(Dividende : Integer; Diviseur : Integer) return Integer is
   begin
      return Dividende/Diviseur;
   exception
      when Constraint_Error =>
	 raise DIV_ZERO;
   end Division;
   
   procedure Calcul1 is
      A,B : Integer ;
   begin 
      Put_Line("Calcul1");
      Put_Line("Saisie du dividende");
      Get(A);
      Put_Line("Saisie du diviseur");
      Get(B);
      Put_Line(Integer'Image(A)&"/"&Integer'Image(B)&"="&Integer'Image(Division(A,B)));
      New_Line;
   exception
      when DIV_ZERO =>
	 Put_Line("PB : division par zero");
   end Calcul1;
   
   procedure Calcul2 is
      A,B,C : Integer ;
   begin
      loop 
	 begin
	    Put_Line("Calcul2");
	    Put_Line("Saisie du dividende 1");
	    Get(A);
	    Put_Line("Saisie du dividende 2");
	    Get(B);
	    Put_Line("Saisie du diviseur 2");
	    Get(C);
	    Put_Line(Integer'Image(A) & "/(" & Integer'Image(B) & "/" & Integer'Image(C)
		       & ") =" & Integer'Image(Division(A,Division(B,C))));
	    New_Line;
	    exit;
	 exception
	    when DIV_ZERO =>
	       Put_Line("PB : division par zero");
	 end;
      end loop;
   end Calcul2;
   
begin
   Calcul1;
   New_Line;
   Calcul2;
end Division ;
