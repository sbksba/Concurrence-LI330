with graphique, ada.text_io,ppp;
use graphique, ada.text_io,ppp;

procedure triangle is
   task type Trace_Cote is
     entry trace(x1,x2,y1,y2 : natural);
   end Trace_Cote;
   
   task body trace_cote is
      xm : natural;
      ym : natural;
      Mx1,Mx2,My1,My2 : Natural;
   begin
      accept Trace(x1,x2,y1,y2 : natural) do
	 Mx1 := X1;
	 Mx2 := X2;
	 My1 := Y1;
	 My2 := Y2;
      end Trace;
      xm:=(mx1+mx2)/2;
      ym:=(my1+my2)/2;
      delay(0.5);
      pointparpoint(mx1,my1,xm,ym,"red");
      delay(0.5);
      pointparpoint(xm,ym,mx2,my2,"green");
   end Trace_Cote;
   
   XMAX : constant natural := 600;
   YMAX : constant natural := 600;
   xu : natural := XMAX/3;
   yu : natural := 2*(YMAX/3);
   xv : natural := XMAX/2;
   yv : natural := YMAX/3;
   xw : natural := 2*(XMAX/3);
   yw : natural := 2*(YMAX/3);
   
   type tab_trace is array(0..2) of Trace_Cote;
   t_trace : tab_trace;
   
begin
   creer_fenetre(XMAX,YMAX,"fen");
   t_trace(0).trace(xu,xv,yu,yv);
   t_trace(1).trace(xv,xw,yv,yw);
   t_trace(2).trace(xw,xu,yw,yu);
   attendre_fermeture_fenetre;
end triangle;   
