program main;
uses biblio ,crt;
const
	M = 256;
	Nmax  = 24;
type
	
	mots = record 
		freq : integer;
		lemot : String;
		end;
	motsTab = array[1..128] of mots;
	general = array[1..M] of mots;
var
	tweets : array[0..Nmax] of String;
	words : biblio.motsTab;
	test : String;
	i, nbmots: Integer;
begin
	TextRead('Input',tweets);
	nbmots := calcV2(CleanMS(tweets[1]), words);
	antirepeat(nbmots, words);
	for i := 0 to nbmots do
	begin
		writeln(words[i].lemot,'  >  ',words[i].freq);
	end;
end.
