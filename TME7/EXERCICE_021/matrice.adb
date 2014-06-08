with  Ada.Text_IO, Ada.Integer_Text_IO, Unchecked_Deallocation;
use  Ada.Text_IO, Ada.Integer_Text_IO;
package body Matrice is

procedure desaloue_el is new Unchecked_Deallocation(Un_Element_de_Liste, Ptr_Element_De_Liste);

function  Valeur(Matrice : Une_Matrice_Entiere; 
                 Ligne   : Positive;
                 Colonne : Positive) return Integer is
	Ptr : Ptr_Element_De_Liste := Matrice.tete(ligne);
begin
	while ptr /= NULL and then ptr.all.colonne/=colonne loop
		ptr := ptr.all.prochain;
	end loop;
	if ptr = NULL then
		return 0;
	end if;
	return ptr.all.donnee;		
end Valeur; 

procedure Valeur(Matrice : in out Une_Matrice_Entiere;
                 Ligne   : in     Positive;
                 Colonne : in     Positive;
                 Valeur  : in     Integer) is
	Ptr : Ptr_Element_De_Liste := Matrice.tete(ligne);
	Pred : Ptr_Element_De_Liste := NULL;
begin
	if valeur /= 0 then
		while ptr /= NULL and then ptr.all.colonne < colonne loop
			pred := ptr;
			ptr := ptr.all.prochain;
		end loop;
		if pred = NULL and ptr =NULL then
				Matrice.tete(ligne) := new Un_Element_de_Liste'(ptr,colonne,valeur);
		elsif pred = NULL and ptr /= NULL then
			if ptr.all.colonne = colonne then
				ptr.all.donnee:=valeur;
			else
				Matrice.tete(ligne) := new Un_Element_de_Liste'(ptr,colonne,valeur);
			end if;
		elsif ptr = NULL and pred /= NULL then
			pred.all.prochain := new Un_Element_de_Liste'(NULL,colonne,valeur);
		else
			if ptr.all.colonne = colonne then
				ptr.all.donnee := valeur;
			else
				pred.all.prochain := new Un_Element_de_Liste'(ptr,colonne,valeur);
			end if;
		end if;
	else
		while ptr /= NULL and then ptr.all.colonne /= colonne loop
			pred := ptr;
			ptr := ptr.all.prochain;
		end loop;
		if ptr /= NULL then
			if pred = NULL then
				Matrice.tete(ligne) := ptr.all.prochain;
				desaloue_el(ptr);	
			else
				pred.all.prochain := ptr.all.prochain;
				desaloue_el(ptr);	
			end if;
		end if;
	end if;
		
	
end Valeur; 


function "+"(Matrice1, Matrice2 : Une_Matrice_Entiere) 
                                            return Une_Matrice_Entiere is 
	M : Une_Matrice_Entiere(Matrice1.lignes,Matrice1.colonnes);
begin
	for I in 1 .. M.Lignes loop
		for J in 1 .. M.Colonnes loop
			Valeur(M,I,J,(Valeur(Matrice1,I,J)+Valeur(Matrice2,I,J)));
		end loop;
	end loop;
	return M;
end "+";

function "*"(Matrice  : Une_Matrice_Entiere;
             Scalaire : Integer) return Une_Matrice_Entiere is
	M : Une_Matrice_Entiere(Matrice.lignes,Matrice.colonnes);
begin
	for I in 1 .. M.Lignes loop
		for J in 1 .. M.Colonnes loop
			Valeur(M,I,J,(Valeur(Matrice,I,J)*scalaire));
		end loop;
	end loop;
	return M;
  -- A completer
end "*";

function "*"(Scalaire : Integer;
             Matrice  : Une_Matrice_Entiere) return Une_Matrice_Entiere is
	M : Une_Matrice_Entiere(Matrice.lignes,Matrice.colonnes);
begin
	for I in 1 .. M.Lignes loop
		for J in 1 .. M.Colonnes loop
			Valeur(M,I,J,(Valeur(Matrice,I,J)*scalaire));
		end loop;
	end loop;
	return M;
end "*";

function "*"(Matrice1, Matrice2 : Une_Matrice_Entiere) 
                                             return Une_Matrice_Entiere is
	M : Une_Matrice_Entiere(Matrice1.lignes,Matrice2.colonnes);
	k : integer;
begin
        for i in 1..M.lignes loop
                for j in 1..M.colonnes loop
			Valeur(M,I,J,0);
			k := 1;
			for l in 1..Matrice2.lignes loop
				Valeur(M,I,J,(Valeur(Matrice1,I,K)*Valeur(Matrice2,l,J)+Valeur(M,I,J)));	
				k:=k+1;
			end loop;
                end loop;
        end loop;
        return M;
end "*";

procedure Initialiser(Matrice: in out Une_Matrice_Entiere) is
val : Integer;
begin
  for I in 1..Matrice.Lignes loop
    for J in 1..Matrice.Colonnes loop
      Put_Line("Saisie de l'element" & Positive'Image(I) & "," & Positive'Image(J));
      Get(val);
      Valeur(Matrice, I, J, val);
    end loop;
  end loop;
end Initialiser;

procedure Afficher_liste(Matrice : in Une_Matrice_Entiere) is
ptr : Ptr_Element_De_Liste;
begin
  for I in 1 .. Matrice.Lignes loop
	ptr := Matrice.Tete(I);
    for J in 1 .. Matrice.Colonnes loop
      if (ptr /= NULL) and then (ptr.all.Colonne = J) then
	    Put(ptr.all.Donnee, Width => 7);
	    ptr := ptr.all.Prochain;
	  else
		Put(0, Width => 7);
	  end if;
    end loop;
    New_Line;
  end loop;
  New_Line;
end Afficher_liste;

procedure Afficher(Matrice : in Une_Matrice_Entiere) is
begin
  for I in 1 .. Matrice.Lignes loop
    for J in 1 .. Matrice.Colonnes loop
	    Put(Valeur(Matrice,I,J), Width => 7);
    end loop;
    New_Line;
  end loop;
  New_Line;
end Afficher;

end Matrice;
