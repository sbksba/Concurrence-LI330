#ici l'emplacement des fichiers graphique.ad* :
GRAPH_LOC = /Infos/lmd/2012/licence/ue/li330-2012oct/Lib_Graphique

LIB = $(GRAPH_LOC)/lib

#     -aO : pour localiser graphique.ali et graphique.o (qui doivent avoir ete crees)
#      -i : pour ne pas recreer dans le repertoire local graphique.ali et graphique.o
#  -cargs : pour les switches transmis à gcc
#  -largs : pour les switches transmis au linker

triangle_tp1:*.adb
	gnatmake triangle_tp1.adb -aO$(GRAPH_LOC) -i -cargs -I$(GRAPH_LOC) -largs -L$(LIB) -lcini `sdl-config --cflags --libs` -g

test : 
	gnatmake test.adb -aO$(GRAPH_LOC) -i -cargs -I$(GRAPH_LOC) -largs -L$(LIB) -lcini `sdl-config --cflags --libs` 

clean:
	rm -f *.ali *.o triangle_tp1 test

