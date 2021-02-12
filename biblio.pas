unit biblio;
Interface

function CleanMS(message : String):String;
function Antispace(message : String):String;
function calcV2(cleanedMessage: String;var mots : array of String):Integer;
implementation {Liste des fonctions et procédure}

function Antispace(message : String):String;
var
	i : LongInt;
	c, cprec: char;
begin
	cprec := 'a';
	AntiSpace := '';
	for i := 1 to  length(message) do
	begin
		c := message[i];
		if (c <> ' ') or (c <> cprec) then
		begin
			Antispace := Antispace + c;
		end;
		cprec := c;
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

function calcV2(cleanedMessage: String;var mots : array of String):Integer;
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
			mots[indice] := mot;
			mot := '';
			indice := indice +1;
			CalcV2 := calcV2 + 1;
		end;
	end; 
end;
end.
