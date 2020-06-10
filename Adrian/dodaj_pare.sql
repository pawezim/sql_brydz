create or replace NONEDITIONABLE procedure dodaj_pare(id_1 integer, id_2 integer, id_turnieju integer)
AS

BEGIN

insert into pary values(
pary_seq.nextval,
null,
0,
0,
id_1,
id_2,
id_turnieju
);

END;