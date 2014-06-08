with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure anneau_double is

   NBSITES : constant positive := 5;

   type tache;
   type acc_tache is access tache;

   -- type des taches de l'anneau
   -- l'identite (id) de la tache est unique
   -- l'entier qui lui est associe (Valeur) est choisi aleatoirement
   task type tache(id : Natural; Valeur : natural) is
      -- permet de recuperer les pointeurs sur les taches suivante et precedente
      entry init (succ : in acc_tache ; pred : in acc_tache);
      entry modif_pred(ptr : in acc_tache);
      entry modif_succs(ptr : in acc_tache);
   end tache;

   task Creer_Anneau;

   -- la tache Creer_Anneau doit posseder un acces a la premiere tache creee
   task body Creer_Anneau is
      package Random_Natural is new Ada.Numerics.Discrete_Random (Natural);
      use Random_Natural;

      G : Generator;
      tab : array (0..NBSITES-1) of acc_tache;
      faute : integer := -1;
      value : integer;
   begin
      Reset (G);
      value := random(g) mod 100;
      if (random(g) mod 2) = 0 then
	 faute := (random(g) mod NBSITES);
	 put_line("faute sur tache : "&Integer'Image(Faute));
      end if;
      for i in 0..NBSITES-1 loop
	 if i = faute
	 then
	    tab(i):=new tache(i,Value*2); -- On multiplie par deux value pour etre sur que la valeur de la faute est differente de value
	 else
	    tab(i):=new tache(i,value);
	 end if;
      end loop;

      for i in 0..NBSITES-1 loop
	 tab(i).init(tab((i+1) mod NBSITES),tab((i-1) mod NBSITES));
      end loop;
   end Creer_Anneau;

   task body tache is               
      succs : acc_tache;
      preds : acc_tache;
   begin
      accept init(succ : in acc_tache; pred : in acc_tache) do
	 succs := succ;
	 preds := pred;
      end init;
      Put_line("Tache : "&natural'image(id)&" (val:  "&natural'image(valeur)&") ---- Succ : "&natural'image(succs.all.id)&" (val:  "&natural'image(succs.all.valeur)&") ---- Pred : "&natural'image(preds.all.id)&" (val:  "&natural'image(preds.all.valeur)&")");
      if succs.all.valeur /= valeur and preds.all.valeur /= valeur then
	 put_line(Natural'Image(Id)&" est fautive");
	 succs.modif_pred(preds);
	 preds.modif_succs(succs);
      else
	 if succs.all.valeur /= valeur then
	    accept modif_succs(ptr : in acc_tache) do
	       succs:=ptr;
	       put("Modif: ");
	       put("Tache : "&natural'image(id)&" (val:  "&natural'image(valeur)&") ----");
	       put("succ : "&natural'image(succs.all.id)&" (val:  "&natural'image(succs.all.valeur)&") ----");
	       put_line("pred : "&natural'image(preds.all.id)&" (val:  "&natural'image(preds.all.valeur)&")");
	    end modif_succs;
	 end if;
	 if preds.all.valeur /= valeur then
	    accept modif_pred(ptr : in acc_tache) do
	       preds := ptr;
	       put("modif: ");
	       put("tache : "&natural'image(id)&" (val:  "&natural'image(valeur)&") ----");
	       put("succ : "&natural'image(succs.all.id)&" (val:  "&natural'image(succs.all.valeur)&") ----");
	       put_line("pred : "&natural'image(preds.all.id)&" (val:  "&natural'image(preds.all.valeur)&")");
	    end modif_pred;
	 end if;
      end if;
   end tache;

begin
   null;
end anneau_double;
