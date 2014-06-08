with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure anneau_min is

   NBSITE : constant positive := 4;

   type tache;
   type acc_tache is access tache;

   task type tache(Valeur : natural) is	
      -- Recupere le pointeur sur la tache suivante
      entry init (succ : in acc_tache);

      -- reception du minimum identifie par la tache precedente
      -- Si la tache qui recoit est celle qui a debute le calcul, elle affiche le 
      -- minimum sinon elle met a jour son minimum local et transmet l'information
      --  a la suivante
      entry recevoir(mes : natural);

      -- entree appelee par la tache Creer_Anneau pour demarrer un calcul de minimum.
      -- La tache qui debute le calcul est aussi celle qui affiche le resultat
      entry calcul_Min;
   end tache;                

   task Creer_Anneau is 
      -- entree grace a laquelle la tache Creer_Anneau est avertie de la fin d'un
      -- calcul 
      entry fin_calcul;
   end Creer_Anneau;

   task body Creer_Anneau is
      package Random_Natural is new Ada.Numerics.Discrete_Random (Natural);
      use Random_Natural;
      G : generator;
      tab : array (1..NBSITE) of acc_tache;
   begin
      reset(g);
      tab(1):=new tache(random(G) mod 100);
      for i in 2..NBSITE loop
	 tab(i):=new tache(random(G) mod 100);
	 tab(i-1).init(tab(i));
      end loop;
      tab(NBSITE).init(tab(1));
      
      for i in 1..2 loop
	 Put_Line("");
	 put_line("lancement n°"&natural'image(i));
	 tab((random(G) mod NBSITE)+1).calcul_min;	
	 accept fin_calcul;
      end loop;
   end Creer_Anneau;

   task body tache is                  
      initiateur : boolean := false;
      min_loc : natural := valeur;
      succs : acc_tache;
   begin 
      accept init(succ : in acc_tache) do
	 succs := succ;
      end init;
      loop
	 select
	    accept calcul_min;
	    put_line("initiateur");
	    initiateur := true;
	    succs.all.recevoir(valeur);
	 or
	    accept recevoir(mes : natural) do
	       put(natural'image(mes)&" "&natural'image(min_loc)&" : ");
	       if mes < min_loc then
		  min_loc := mes;
	       end if;
	    end recevoir;
	    if initiateur then
	       put_line(natural'image(min_loc));
	       initiateur := false;
	       creer_anneau.fin_calcul;
	       Put_Line("Le minimum est : "&Natural'Image(min_loc));
	    else
	       put_line(natural'image(min_loc));
	       succs.all.recevoir(min_loc);
	    end if;
	    min_loc := valeur;
	 end select;
      end loop;
   end tache;                       

begin
   null;
end anneau_min;    
