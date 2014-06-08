with Ada.text_io;
use Ada.text_io;

procedure Gest_tunnel is

   NB_TRAINS : constant natural := 15;
   NB_MAX : constant natural := 5;

   type t_sens is (sA,sB);

   task type train(s : t_sens) is
      entry monid(id : natural);
   end train;

   task tunnel is
      entry entrea(id : natural; s : t_sens);
      entry entreb(id : natural; s : t_sens);
      entry sort(id : natural; s : t_sens);
   end tunnel;
   

   task body train is
      mid : natural;
   begin
      accept monid(id : natural) do
	 mid := id;
      end monid;
      if s = sA then
	 tunnel.entrea(mid,s);
      else
	 tunnel.entreb(mid,s);
      end if;
      tunnel.sort(mid,s);
   end train;


   task body tunnel is
      nb_trainin : natural := 0;
      nb_trainout : natural := 0;
      sens_circ : t_sens := sA;
   begin
      loop	
	 select
	    when sens_circ = sA and nb_trainin < NB_MAX =>
	       accept entrea(id : natural;s : t_sens) do
		  nb_trainin:= nb_trainin+1;
		  put_line("train :"&natural'image(id)&" sens : "&t_sens'image(s));
	       end entrea;
	 or
	    when sens_circ = sB and nb_trainin < NB_MAX =>
	       accept entreb(id : natural;s : t_sens) do
		  nb_trainin:= nb_trainin+1;
		  put_line("train :"&natural'image(id)&" sens : "&t_sens'image(s));
	       end entreb;
	 or
	    accept sort(id : natural; s : t_sens) do
	       nb_trainout:= nb_trainout+1;
	       if nb_trainin = NB_MAX and nb_trainin = nb_trainout then
		  if sens_circ = sA then
		     sens_circ := sB;
		  else
		     sens_circ := sA;
		  end if;
		  nb_trainin := 0;
		  nb_trainout := 0;
	       end if;
	    end sort;
	 or 
	    terminate;
	 end select;
      end loop;
   end tunnel;

   type tab_train_a is array (1..NB_TRAINS) of train(sA);
   type tab_train_b is array (1..NB_TRAINS) of train(sB);

   t_a : tab_train_a;
   t_b : tab_train_b;

begin
   for i in 1..NB_TRAINS loop
      t_a(i).monid(i);
      t_b(i).monid(i);
   end loop;

end Gest_tunnel;
