with ada.text_io,ada.integer_text_io;
use ada.text_io,ada.integer_text_io;

procedure lecteur_ecrivain is
   
   task ordonnanceur is
      entry dem_l(id_l : natural);
      entry dem_e(id_e : natural);
      entry lecture(id_l : natural;value : out natural);
      entry ecriture(id_e : natural; value : in natural);
      entry fin_l(id_l : natural);
      entry fin_e(id_e : natural);
   end ordonnanceur;
   
   task body ordonnanceur is
      nb_dem_l : natural := 0;
      nb_dem_e : natural := 0;
      smttr : natural := 0;
      shared_v : natural := 0;
   begin
      while true loop
	 select
	    when smttr = 1 and nb_dem_e = 0 and dem_e'count = 0 =>
	       accept dem_l(id_l : natural) do
		  nb_dem_l:=nb_dem_l+1;
	       end dem_l;
	 or
	    accept lecture(id_l : natural; value : out natural) do
	       value := shared_v;
	    end lecture;
	 or
	    accept fin_l(id_l : natural) do
	       nb_dem_l:=nb_dem_l-1;
	    end fin_l;
	 or
	    when nb_dem_l = 0 and nb_dem_e = 0 =>
	       accept dem_e(id_e : natural) do
		  nb_dem_e := nb_dem_e+1;
	       end dem_e;
	 or
	    accept ecriture(id_e : natural; value : in natural) do
	       shared_v := value;
	       smttr := 1;
	    end ecriture;
	 or	
	    accept fin_e(id_e : natural) do
	       nb_dem_e := nb_dem_e-1;
	    end fin_e;
	 or
	    terminate;
	 end select;
      end loop;
   end ordonnanceur;

   task type lecteur(id_l : natural);
   task type ecrivain(id_e : natural);

   task body lecteur is
      value : natural;
   begin
      for i in 1..id_l loop
	 ordonnanceur.dem_l(id_l);
	 put_line("lecture "&natural'image(id_l)&" demande acces "&natural'image(i)&" lecture");
	 ordonnanceur.lecture(id_l,value);
	 put_line("lecture "&natural'image(id_l)&" lecture "&natural'image(value));
	 ordonnanceur.fin_l(id_l);
	 put_line("lecture "&natural'image(id_l)&" fin acces "&natural'image(i)&" lecture");
      end loop;
   end lecteur;

   task body ecrivain is
   begin
      for i in 1..id_e loop
	 ordonnanceur.dem_e(id_e);
	 put_line("ecrivian "&natural'image(id_e)&" demande acces "&natural'image(i)&" ecriture");
	 ordonnanceur.ecriture(id_e,i*id_e);
	 put_line("ecrivain "&natural'image(id_e)&" ecriture : "&natural'image(i*id_e));
	 ordonnanceur.fin_e(id_e);
	 put_line("ecrivain "&natural'image(id_e)&" fin acces "&natural'image(i)&" ecriture");
      end loop;
   end ecrivain;
   l1 : lecteur(1);
   l2 : lecteur(2);
   l3 : lecteur(3);
   l4 : lecteur(4);
   l5 : lecteur(5);
   e1 : ecrivain(1);
   e2 : ecrivain(2);
   e3 : ecrivain(3);
begin
   null;
end lecteur_ecrivain;

