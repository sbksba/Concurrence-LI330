with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure philo is
   -- ============================
   -- Gestion de durees aleatoires
   -- ============================
   package Alea_Int is new Ada.Numerics.Discrete_Random (Natural);
   use Alea_Int;
   
   Graine : Generator;
   
   -- ====================================
   -- Fonction donnant une duree d'attente
   -- ====================================
   function Duree_Attente return Duration is
   begin
      return 0.1 * Duration (Random (Graine) mod 10);
   end Duree_Attente;
   ----------------------------------------------------
   
   -- ==================
   -- Variables Globales
   -- ==================
   
   -- nombre de philosophes
   nb_philos : constant Natural := 6;
   -- nombre de repas
   nb_repas : constant Natural := 4;
   
   -- ===============
   -- TASK philosophe
   -- ===============
   task type philosophe is
      entry init(id : Natural);
   end philosophe;
   
   -- ===============
   -- TYPE fourchette
   -- ===============
   protected type fourchette is
      entry prendre(id_philo : natural; id_fourchette : natural);
      procedure rendre(id_philo : natural; id_fourchette : natural);
   private
      disponible : boolean := true;
   end fourchette;

   prendref : natural:=1;
   
   -- ================================================
   -- TYPE sem -> utilisation identique aux semaphores
   -- ================================================
   protected type sem is
      entry p;
      procedure v;
   private
      semt : natural:=0;
   end sem;
   
   -- ====
   -- BODY
   -- ====
   protected body sem is
      entry p when semt=0 is
      begin
	 semt:=1;
      end p;
      procedure v is
      begin
	 semt:=0;
      end v;
   end sem;

   sema : sem;
   tab_philo : array (1..nb_philos) of philosophe;
   tab_fourchette : array(0..nb_philos-1) of fourchette;

   task body philosophe is
      identifiant : natural;
   begin
      accept init(id : natural) do
	 identifiant := id;
      end init;
      sema.p;	
      tab_fourchette(identifiant-1).prendre(identifiant,identifiant-1);
      tab_fourchette(identifiant mod nb_philos).prendre(identifiant,identifiant mod nb_philos);
      sema.v;
      delay 0.5;
      tab_fourchette(identifiant-1).rendre(identifiant,identifiant-1);
      delay 0.5;
      tab_fourchette(identifiant mod nb_philos).rendre(identifiant,identifiant mod nb_philos);
   end philosophe;

   protected body fourchette is
      entry prendre(id_philo : natural; id_fourchette : natural) when disponible is
      begin
	 put_line("Le philosophe : "&natural'image(id_philo)&" prend la fourchette : "&natural'image(id_fourchette));
	 disponible := false;
      end prendre;
      procedure rendre(id_philo : natural; id_fourchette : natural) is
      begin
	 put_line("Le philosophe : "&natural'image(id_philo)&" rend la fourchette : "&natural'image(id_fourchette));
	 if (Id_Philo = id_fourchette) then
	    Put_Line("----------------------------------------------------------------------------------------------");
	 end if;
	 disponible := true;
      end rendre;
   end fourchette;
   
begin
   for i in 1..nb_philos loop
      tab_philo(i).init(i);
   end loop;
end philo;
