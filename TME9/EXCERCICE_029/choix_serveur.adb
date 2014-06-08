with Ada.Text_IO, Ada.Numerics.Discrete_Random, Ada.Exceptions;
use Ada.Text_IO;

procedure Choix_Serveur is
   
   -- ==========================
   -- Gestion valeurs aleatoires
   -- ==========================
   package Alea_Int is new Ada.Numerics.Discrete_Random (Natural);
   use Alea_Int;
   
   Graine : Generator;
   
   -- ==========
   -- Constantes
   -- ==========
   NB_CLIENTS : constant Natural := 5;
   NB_SERVEURS : constant Natural := 3;
   
   -- =====================
   -- Description du Client
   -- =====================
   task type Client is
      entry Init (Id : Natural);
   end Client;
   
   -- ======================
   -- Description du Serveur
   -- ======================
   task type Serveur is
      entry Init (Id : Natural);
      entry Service (Id_Client : Natural);
   end Serveur;
   
   -- ================================
   -- Ensemble des Clients et Serveurs
   -- ================================
   Tab_Clients : array (1..NB_CLIENTS) of Client;
   Tab_Serveurs : array (1..NB_SERVEURS) of Serveur;
   
   -- =========================
   -- Body du Client et Serveur
   -- =========================
   task body Client is 
      Identifiant : Natural;
      Serveur_Choisi : Natural;
      I : Natural := 0;
   begin
      accept Init (Id : Natural) do
	 Identifiant := Id;
      end Init;
      loop
	 begin
	    Serveur_Choisi := (Random(Graine) mod NB_SERVEURS)+1;
	    while I /= NB_SERVEURS loop
	       Tab_Serveurs (Serveur_Choisi).Service(Identifiant);
	       I := I + 1;
	    end loop;
	    exit;
	 exception
	    when TASKING_ERROR => Put_Line("ERREUR -> pas de serveur : reroll");
	 end;
      end loop;
   end Client;
   
   task body Serveur is
      Identifiant : Natural;
   begin
      accept Init (Id : Natural) do
	 Identifiant := Id;
      end Init;
      for I in Tab_Clients'Range loop
	 accept Service (Id_Client : Natural) do
	    Put_Line("Serveur : "& Natural'Image(identifiant)&" requete reçu de : "&Natural'Image(Id_Client));
	 end Service;
      end loop;
   end Serveur;
   
   -- ====
   -- MAIN
   -- ====
begin
   Reset(Graine);
   -- ---------------------
   -- creation des serveurs
   -- ---------------------
   for I in Tab_Serveurs'Range loop
      Tab_Serveurs(I).Init(I);
   end loop;
   -- --------------------
   -- creation des clients
   -- --------------------
   for I in Tab_Clients'Range loop
      Tab_Clients(I).Init(I);
   end loop;
end Choix_Serveur;
