create or replace NONEDITIONABLE procedure dodaj_rozgrywke (
id_turnieju integer, id_rozdania integer,
id_pary_ns integer, id_pary_we integer,
numer_stolu integer, numer_rundy integer)

AS

gracz_n integer;
gracz_e integer;
gracz_s integer;
gracz_w integer;

BEGIN

select gracz_1_id into gracz_n from pary where para_id=id_pary_ns;
select gracz_2_id into gracz_s from pary where para_id=id_pary_ns;

select gracz_1_id into gracz_w from pary where para_id=id_pary_we;
select gracz_2_id into gracz_e from pary where para_id=id_pary_we;

insert into rozgrywki values(
rozgrywki_seq.nextval,
numer_stolu,
numer_rundy,
null,
0,
null,
null,
null,
0,
0,
null,
null,
sysdate,
null,
id_rozdania,
id_pary_ns,
id_pary_we,
gracz_n,
gracz_e,
gracz_s,
gracz_w
);

END;
