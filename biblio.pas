unit biblio;
Interface

Const Nmax = 24;
type
	
	mot = record 
		freq : integer;
		lemot : String;
		end;
	motsTab = array[1..128] of mot;

procedure TextRead(name : string; var T : array of String);
procedure TextWrite(name : string; T : array of String);
function CleanMS(message : String):String;
function Antispace(message : String):String;
function calcV2(cleanedMessage: String;var mots : motsTab):Integer;
procedure decalage(debut,fin : Integer; var tableau : motsTab);
function compteur(tableau : motsTab):Integer;
procedure antirepeat(var nbmots : Integer; var tab : motsTab);

implementation {Liste des fonctions et procédure}

procedure TextRead(name : string; var T : array of String);{procedures pour lire un texte a partir d'un fichier}
var i: integer;
Fin : text;
begin

assign(Fin, name);
reset(Fin);

for i:=1 to Nmax do
    begin
        readln(Fin, T[i]);
        writeln('Reading line : ', i, 'from ', name);
    end;

close(Fin);
end;

procedure TextWrite(name : string; T : array of String); {procedures pour écrire un text sur un fichier}
var i: integer;
Fout : text;

begin
assign(Fout, name);
Rewrite(Fout);

for i:=1 to Nmax do
    begin
        writeln(Fout, T[i]);
        writeln('Writing line : ', i, 'from ', name);
    end;

close(Fout);
end;


function Antispace(message : String):String; {fonction pour retirer les espaces en plus}
var
	i : LongInt;
	c, cprec: char;
begin
	cprec := 'a';	//valeur aléatoire uniquement pour le 1er essaye
	AntiSpace := '';
	for i := 1 to  length(message) do //pour parcourir tous la chaine de caractére message
	begin
		c := message[i]; //c recevera un caractére de la chaine de caractére message
		if (c <> ' ') or (c <> cprec) then //concatiner uniquement si l'espace trouvé n'est pas une répétition
		begin
			Antispace := Antispace + c;
		end;
		cprec := c; //cprec resoit c pour la condition suivant
	end;
end;

function CleanMS(message : String):String;
var
	i: Integer;
	c : char;
begin
	cleanMS := ''; //On initialise le message qui sera le résulat du netoyage 
	for i:= 1 to length(message) do //boucle qui parcours tout la chaine de caractére message
	begin
		c := message[i]; //à chaque tour de boucle c reçoit un caractére du message par ordre 
		if (c in ['A'..'Z']) or (c in ['a'..'z']) or ((c = ' ')) then 
		{Le caractere doit etre un caractére alphabétique ou bien un espace tout en vérifiant que le caractére
		suivant n'est pas un autre espace et supprimer plus tard les espaces en plus}
		begin
			CleanMS := CleanMS + c; //création du message nettoyé uniquement on conservant les caractéres demandés
		end;
	end;
	CleanMS := Antispace(CleanMS);
end;

function calcV2(cleanedMessage: String;var mots : motsTab):Integer; {Calculer le nombre de mots et les affecter vers le vecteur}
var
	mot : String;
	i, indice : Integer;
	c : char;
begin
	calcV2 := 0;
	mot := '';
	indice := 0;
	for i := 1 to length(cleanedMessage) do 
	begin
		c := cleanedMessage[i];
		if (c <> ' ')  then mot  := mot + c
		else
		begin
			mots[indice].lemot := mot;
			mots[indice].freq := 1;
			mot := '';
			indice := indice +1;
			CalcV2 := calcV2 + 1;
		end;
	end; 
end;
{fonction et procedures séciale pour les vecteurs }
procedure decalage(debut,fin : Integer; var tableau : motsTab); {Suppression de l'élément d'un vecteur (Par décalage)}
var i : Integer;
begin
	for i:=debut to fin do
	begin
		tableau[i].lemot := tableau[i+1].lemot;
	end;
end;

function compteur(tableau : motsTab):Integer;
var i : integer;
begin
	i := 1;
	while (tableau[i].lemot <> '') do
	begin
		i := i +1;
	end;
	compteur := i;
end;
{fin des fonction/procedures pour vecteurs }

procedure antirepeat(var nbmots : Integer; var tab : motsTab);{supprimer les mots répetés par décalage}
var i1, j1 : integer;
begin
	for i1 := 0 to nbmots do
	begin
		j1 := i1+1;
		repeat
			if (tab[i1].lemot = tab[j1].lemot) then 
			begin
				decalage(j1, nbmots, tab);
				tab[i1].freq := tab[i1].freq +1;
			end
			else j1 := j1+1;
		until (j1 > nbmots) or (tab[j1].lemot = '');
	end;
	nbmots := compteur(tab);
end;
end.
