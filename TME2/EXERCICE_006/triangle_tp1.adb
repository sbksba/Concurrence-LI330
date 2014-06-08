with graphique, ada.text_io,ppp;
use graphique, ada.text_io,ppp;

procedure triangle_tp1 is
	task type trace_cote(x1,x2,y1,y2 : natural);
	task body trace_cote is
	xm : natural;
	ym : natural;
	begin
		xm:=(x1+x2)/2;
		ym:=(y1+y2)/2;
		delay(0.2);
		pointparpoint(x1,y1,xm,ym,"red");
		delay(0.2);
		pointparpoint(xm,ym,x2,y2,"purple");
	end trace_cote;
	XMAX : constant natural := 600;
	YMAX : constant natural := 600;
	xu : natural := XMAX/3;
	yu : natural := 2*(YMAX/3);
	xv : natural := XMAX/2;
	yv : natural := YMAX/3;
	xw : natural := 2*(XMAX/3);
	yw : natural := 2*(YMAX/3);
begin
	creer_fenetre(XMAX,YMAX,"fen");
	declare
		t1 : trace_cote(xu,xv,yu,yv);
		t2 : trace_cote(xv,xw,yv,yw);
		t3 : trace_cote(xw,xu,yw,yu);
	begin
		null;
	end;
	attendre_fermeture_fenetre;
end triangle_tp1;   
