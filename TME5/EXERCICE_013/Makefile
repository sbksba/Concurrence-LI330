CC= gnatmake

all: gest_tunnel gest_tunnel_protect

gest_tunnel:gest_tunnel.adb
	$(CC) gest_tunnel.adb

gest_tunnel_protect:gest_tunnel_protect.adb
	$(CC) gest_tunnel_protect.adb

clean:
	rm -f *.ali *.o *~ gest_tunnel gest_tunnel_protect
