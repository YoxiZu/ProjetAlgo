program main;
uses biblio ,crt;
type
	motsTab = array[1..255] of String;
var
	test,test2 : String;
	a : motsTab;
	i, nbmots: integer;
begin
	readln(test);
	test2 := CleanMS(test);
	nbmots := calcV2(test2, a);
	for i:= 1 to nbmots do
	begin
		writeln(a[i]);
	end;
	writeln('-------------------');
	antirepeat(nbmots, a);
	for i:= 1 to nbmots do
	begin
		writeln(a[i]);
	end;
	
end.
