--select object_name, object_type from all_objects where owner='PAW';

-- przed wywolaniem tego skryptu demonstracyjnego nalezy wyzerowac sekwencje

truncate table turnieje;
execute dodaj_turniej('sum');
select*from turnieje;
-- id_turnieju 1, zapis sumaryczny

truncate table rozdania;
execute nowe_rozdanie(1,'N');
select*from rozdania;
-- id_rozdania 1, rozdajacy N

execute dodaj_gracza('Stefan','Banach');
execute dodaj_gracza('Stanislaw','Ulam');
execute dodaj_gracza('Waclaw','Sierpinski');
execute dodaj_gracza('Hugo','Steinhaus');
select*from gracze;
-- id graczy: 1,2,3,4

execute dodaj_pare(1,2,1);
execute dodaj_pare(3,4,1);
select*from pary;
-- id par: 1,2

execute dodaj_rozgrywke(1, 1, 1, 2, 1, 1);




