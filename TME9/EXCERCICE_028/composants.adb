with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure Composants is
   
   -- ==========================
   -- Gestion valeurs aleatoires
   -- ==========================
   package Alea_Int is new Ada.Numerics.Discrete_Random (Natural);
   use Alea_Int;
   
   Graine : Generator;
   
   -- ==========
   -- Constantes
   -- ==========
   Nb_Composants : constant Natural := 10;
   Nb_Capteurs : constant Natural := 3;
   
   -- ======================
   -- Description du Capteur
   -- ======================
   task type Capteur is
      entry Verification (Result : out Natural);
      entry Panne (Id : in Natural);
   end Capteur;
   
   -- ========================
   -- Description du Composant
   -- ========================
   task type Composant is
      entry Init (Id : in Natural); -- Permet de recuperer l'identifiant du composant
   end Composant;
   
   -- ===============================
   -- BODY du Capteur et du Composant
   -- ===============================
   task body Capteur is
   begin
      loop
	 select
	    accept Verification (Result : out Natural) do
	       Result := (Random(Graine) mod 2);
	    end Verification;
	 or
	    accept Panne (Id : in Natural) do
	       Put_Line("=== ENVOI PANNE CAPTEUR -> "& Natural'Image(Id)&" ===");
	    end Panne;
	    exit;
	 or
	    terminate;
	 end select;
      end loop;
   end Capteur;
   
   task body Composant is
      -- -------------------------------------------------------------------------------------------
      -- identifiant du composant, permettant de suivre l'evolution du programme grace a l'affichage
      -- -------------------------------------------------------------------------------------------
      Identifiant : Natural;
      Context : Natural := 0;
      Outcap : Natural := 0;
      -- -------------------------------------------
      -- ensemble des capteurs associes au composant
      -- -------------------------------------------
      Tab_Capteurs : array(1..Nb_Capteurs) of Capteur;
   begin
      begin
	 accept Init (Id : Natural) do
	    Identifiant := Id;
	 end Init;
	 
	 if (Random(Graine) mod 2) = 1 then
	    Tab_Capteurs(Random(Graine) mod 2).Panne(Identifiant); -- Envoie d'une panne
	 end if;
	 
	 for I in Tab_Capteurs'Range loop
	    begin
	       Tab_Capteurs(I).Verification(Outcap);
	       Context := Context + 1;
	    exception
	       when TASKING_ERROR => Put_Line("=== DETECTION PANNE -> capteur n°"&Natural'Image(identifiant)&" ===");
	    end;
	 end loop;
      end;
      if (Context = 2) then 
	 -- Put_Line("composant : "&Natural'Image(identifiant)&", context : "&Natural'Image(Context));
	 Put_Line("composant : "&Natural'Image(identifiant)&", context : bonne");
      elsif (Context = 3) then
	 Put_Line("composant : "&Natural'Image(identifiant)&", context : mediocre");
      end if;
   end Composant;
   
   -- =======================
   -- ensemble des composants
   -- =======================
   Tab_Composants : array (1..Nb_Composants) of Composant;
   
begin
   -- -----------------------
   -- creation des composants
   -- -----------------------
   for I in 1..Nb_Composants loop
      Tab_Composants(I).Init(I);
   end loop;
end Composants;
