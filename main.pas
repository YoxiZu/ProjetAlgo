program main;
uses biblio ,crt;
type
	motsTab = array[1..255] of String;
var
	test,test2 : String;
	a : motsTab;
	i, nbmots: LongInt;
begin
	readln(test);
	test2 := CleanMS(test);
	nbmots := calcV2(test2, a);
	writeln('LE nombre de mots est : ', nbmots);
	for i:= 1 to nbmots do
	begin
		writeln(a[i]);
	end;
end.
