with Ada.Text_Io,Ada.Integer_Text_Io;
use Ada.Text_Io,Ada.Integer_Text_Io;

procedure Prod is 
   Dimension : constant Positive := 5;
   type Tab_Buffer is array (Positive range <>) of Natural;
   type T_Stock (Taille : Positive) is record
      Nb_Elements : Natural := 0;
      Tab_Stock : Tab_Buffer (1..Taille);
      Tab_Id : Tab_Buffer (1..Taille);   
   end record;
   
   Synchro : Natural := 0; -- Si Synchro := 1 alors utilisé
   Stock : T_Stock (Dimension);
   
   task type Product (Id, Value : Natural);
   task type Conso;
   
   task body Product is
      Nb_Product : Positive := Dimension;
   begin
      for I in 1..Nb_Product loop
	 while Synchro /= 0 or Stock.Nb_Elements = Dimension loop
	    null;
	 end loop;
	 delay (0.1);
	 synchro := 1; --
	 Stock.Nb_Elements := Stock.Nb_Elements +1;
	 Stock.Tab_Stock(Stock.Nb_Elements) := Value;
	 Stock.Tab_Id(Stock.Nb_Elements) := Id;
	 Put_Line("p : "&Natural'image(Id)&" value : "&Natural'Image(Value));
	 synchro := 0; --
      end loop;
   end Product;
   
   task body Conso is
      Nb_Conso : Positive := Dimension;
      Id_Elem : Natural;
      Id_Prod : Natural;
   begin
      for I in 1..Nb_Conso loop
	 while Synchro /= 0 or Stock.Nb_Elements = 0 loop
	    null;
	 end loop;
	 delay(0.1);
	 synchro := 1; --
	 Id_Elem := Stock.Tab_Stock(Stock.Nb_Elements);
	 Id_Prod := Stock.Tab_Id(Stock.Nb_Elements);
	 Stock.Nb_Elements := Stock.Nb_Elements -1;
	 Put_Line("c get "&Natural'image(Id_Elem)&" of : "&Natural'image(Id_Prod));
	 synchro := 0; --
      end loop;
   end Conso;
   
   Nb_Consom : Natural := 2;
   Nb_Product : Natural := 2;
   type T_Conso is array (0..Nb_Consom) of Conso;
   T_C : T_Conso;
   T1_P : Product(0, 10);
   T2_P : Product(1, 11);
   
begin
   null;
end Prod;
