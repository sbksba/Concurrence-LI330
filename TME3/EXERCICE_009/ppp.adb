with graphique, ada.text_io;
use graphique, ada.text_io;

package body ppp is

procedure pointparpoint(x0,y0,x1,y1 : natural;color : string) is
        x : natural := x0; 
        y : natural :=y0;
        dx : natural := abs(x1-x0);
        dy : natural := abs(y1-y0); -- abs(YMAX/2+1  - YMAX/2)
        dpr : natural := dy*2;
        dpru : integer := dpr-(dx*2);
        p : integer := dpr -dx;
        xincr : integer;
        yincr : integer;

begin
	
		
        if x0 > x1 then
                xincr:=-1;
        else
                xincr:=1;
        end if;
	if y0 > y1 then
		yincr := -1;
	else
		yincr := 1;
	end if;
	if dx>dy then
		dpr := dy*2;
		dpru := dpr-(dx*2);
		p := dpr-dx;
	        for i in reverse 0..dx loop
			delay 0.1;
	                afficher_point(x,y,color);
	                if p>0 then
	                        x:=x+xincr;
	                        y:=y+yincr;
	                        p:=p+dpru;
	                else
	                        x:=x+xincr;
	                        p:=p+dpr;
	                end if;
        	end loop;
	else
		dpr := dx*2;
		dpru := dpr-(dy*2);
		p := dpr-dy;
	        for i in reverse 0..dy loop
			delay 0.1;
	                afficher_point(x,y,color);
	                if p>0 then
	                        x:=x+xincr;
	                        y:=y+yincr;
	                        p:=p+dpru;
	                else
	                        y:=y+yincr;
	                        p:=p+dpr;
	                end if;
        	end loop;
	end if;
end pointparpoint;

end ppp;
