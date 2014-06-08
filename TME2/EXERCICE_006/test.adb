with graphique, ada.text_io;
use graphique, ada.text_io;

procedure test is
	XMAX : natural := 600;
	YMAX : natural := 600;
	x0 : natural := 1;
	y0 : natural := YMAX/2;
	x1 : natural := 599;
	y1 : natural := YMAX/2+1;
	x : natural := x0;
	y : natural :=y0;
	dx : natural := abs(x1-x0);
	dy : natural := abs(y1-y0); -- abs(YMAX/2+1  - YMAX/2)
	dpr : natural := dy*2;
	dpru : integer := dpr-(dx*2);
	p : integer := dpr -dx;

begin
	creer_fenetre(XMAX,YMAX,"fen");
	for i in reverse 0..dx loop
		afficher_point(x,y,"green");
		if p>0 then
			x:=x+1;
			y:=y+1;
			p:=p+dpru;
		else
			x:=x+1;
			p:=p+dpr;
		end if;
	end loop;
	attendre_fermeture_fenetre;
end test;
