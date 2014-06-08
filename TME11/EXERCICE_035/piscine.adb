with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure piscine is
   -- ============================
   -- Gestion de durees aleatoires
   -- ============================
   package Alea_Int is new Ada.Numerics.Discrete_Random (Natural);
   use Alea_Int;
   
   Graine : Generator;
   
   -- ===================================
   -- Fonction donnant la duree d attente 
   -- ===================================
   function Duree_Attente return Duration is
   begin
      return 0.1 * Duration (Random (Graine) mod 10);
   end Duree_Attente;
   ----------------------------------------------------
   
   -- ==================
   -- Variables Globales
   -- ==================
   
   -- nombre de baigneurs
   nb_baigneurs : constant Natural := 15; -- 15
   -- nombre de cabines  ############################# REPONSE : il faudrait plus de cabine que de baigneurs #############################
   nb_cabines : constant Natural := 5; -- 5
   -- nombre de paniers
   nb_paniers : constant Natural := 8; -- 8
   
   -- =============
   -- TASK BAIGNEUR
   -- =============
   task type baigneur is
      entry init(id : Natural);
   end baigneur;
   
   -- ===============
   -- TYPE RESSOURCES
   -- ===============
   protected type ressources is
      entry Cabine_Take(Id: Natural);
      entry panier_take(Id: Natural);
      procedure cabine_release(Id: Natural);
      procedure panier_release(Id: Natural);
   private
      nb_cabine_disp :natural := nb_cabines;
      nb_paniers_disp :natural := nb_paniers;
   end ressources;

   prot : ressources;
   -- declaration des cabines et des paniers

   -- ====
   -- BODY
   -- ====
   task body baigneur is
      identifiant : Natural;
   begin
      accept init(id : natural) do
	 identifiant := id;
      end init;
      delay Duree_Attente;
      prot.panier_take(identifiant);    -- prend un panier   INVERSION de la prise de panier et de cabine.
      delay Duree_Attente;	
      prot.Cabine_Take(identifiant);    -- rentre dans la cabine
      delay Duree_Attente;
      prot.cabine_release(identifiant); -- lache la cabine
      delay Duree_Attente;              -- piscine, on nage
      Put_Line("-------------------------------------------------------------");
      Put_Line("BAIGNADE : "&Natural'Image(Identifiant)&"          ¸.·´¯`·.´¯`·.¸¸.·´¯`·.¸><(((º> ");
      Put_Line("-------------------------------------------------------------");
      prot.cabine_take(identifiant);    -- prend une cabine
      delay Duree_Attente;
      prot.panier_release(identifiant); -- lache un panier
      delay Duree_Attente;
      prot.cabine_release(identifiant); -- lache la cabine(quitte la piscine)
   end baigneur;

   protected body ressources is
      entry Cabine_Take(Id : Natural) when nb_cabine_disp > 0 is
      begin
	 put_line(Natural'Image(Id)&" take_cabine");
	 nb_cabine_disp:=nb_cabine_disp-1;
      end cabine_take;
      
      entry panier_take(Id : Natural) when nb_paniers_disp > 0 is
      begin
	 put_line(Natural'Image(Id)&" take_panier");
	 nb_paniers_disp:=nb_paniers_disp-1;
      end panier_take;
      
      procedure cabine_release(Id : Natural) is
      begin
	 put_line(Natural'Image(Id)&" release_cabine");
	 nb_cabine_disp:=nb_cabine_disp+1;
      end cabine_release;
      
      procedure panier_release(Id : Natural) is
      begin
	 put_line(Natural'Image(Id)&" release_panier");
	 nb_paniers_disp:=nb_paniers_disp+1;
      end panier_release;
   end ressources;
   
   tab_baigneurs : array (1..nb_baigneurs) of baigneur;

begin
   for i in 1..nb_baigneurs loop
      tab_baigneurs(i).init(i);
   end loop;
end piscine;
