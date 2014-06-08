with ada.text_io,ada.integer_text_io;
use ada.text_io,ada.integer_text_io;

procedure prot_lecteur_ecrivain is
	
	protected ordonnanceur is
		entry lecture(id_l : natural;value : out natural);
		procedure ecriture(id_e : natural; value : in natural);
	private
		shared_v : natural := 0;
		smttr : natural := 0;
		inwrite : natural :=1;
	end ordonnanceur;
	
	protected body ordonnanceur is
		entry lecture(id_l : natural;value : out natural)
			when inwrite = 0 and smttr = 1 is
		begin
			value := shared_v;
			put_line("lecture "&natural'image(id_l)&" lecture "&natural'image(value));
		end lecture;

		procedure ecriture(id_e : natural; value : in natural) is
		begin
			inwrite := 1;
			shared_v := value;
			smttr := 1;
			inwrite := 0;
			put_line("ecrivain "&natural'image(id_e)&" ecriture : "&natural'image(value));
		end ecriture;
	end ordonnanceur;

	task type lecteur(id_l : natural);
	task type ecrivain(id_e : natural);

	task body lecteur is
		value : natural;
	begin
		for i in 1..id_l loop
			delay 0.5;
			ordonnanceur.lecture(id_l,value);
		end loop;
	end lecteur;

	task body ecrivain is
	begin
		for i in 1..id_e loop
			delay 0.5;
			ordonnanceur.ecriture(id_e,i*id_e);
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
end prot_lecteur_ecrivain;

