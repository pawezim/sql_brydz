-- POMOCNICZE TABELE

create table karty (id_karty integer, symbol char(2));

delete from karty;

insert into karty values (1, '2s');
insert into karty values (2, '2d');
insert into karty values (3, '2h');
insert into karty values (4, '2c');
insert into karty values (5, '3s');
insert into karty values (6, '3d');
insert into karty values (7, '3h');
insert into karty values (8, '3c');
insert into karty values (9, '4s');
insert into karty values (10, '4d');
insert into karty values (11, '4h');
insert into karty values (12, '4c');
insert into karty values (13, '5s');
insert into karty values (14, '5d');
insert into karty values (15, '5h');
insert into karty values (16, '5c');
insert into karty values (17, '6s');
insert into karty values (18, '6d');
insert into karty values (19, '6h');
insert into karty values (20, '6c');
insert into karty values (21, '7s');
insert into karty values (22, '7d');
insert into karty values (23, '7h');
insert into karty values (24, '7c');
insert into karty values (25, '8s');
insert into karty values (26, '8d');
insert into karty values (27, '8h');
insert into karty values (28, '8c');
insert into karty values (29, '9s');
insert into karty values (30, '9d');
insert into karty values (31, '9h');
insert into karty values (32, '9c');
insert into karty values (33, '0s');
insert into karty values (34, '0d');
insert into karty values (35, '0h');
insert into karty values (36, '0c');
insert into karty values (37, 'Js');
insert into karty values (38, 'Jd');
insert into karty values (39, 'Jh');
insert into karty values (40, 'Jc');
insert into karty values (41, 'Qs');
insert into karty values (42, 'Qd');
insert into karty values (43, 'Qh');
insert into karty values (44, 'Qc');
insert into karty values (45, 'Ks');
insert into karty values (46, 'Kd');
insert into karty values (47, 'Kh');
insert into karty values (48, 'Kc');
insert into karty values (49, 'As');
insert into karty values (50, 'Ad');
insert into karty values (51, 'Ah');
insert into karty values (52, 'Ac');


create table losowania (x varchar(255) );

create table hierarchia_odzywek (
id integer,
odzywka varchar(2)
);


-- POMOCNICZE PROCEDURY                                                 

create or replace procedure dodaj_gracza(imie varchar, nazwisko varchar)
AS

BEGIN

insert into gracze values(
gracze_seq.nextval,
imie,
nazwisko
);

END;
/

create or replace procedure dodaj_pare(id_1 integer, id_2 integer, id_turnieju integer)
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
/

create or replace procedure dodaj_turniej (punktacja varchar)
AS

BEGIN

insert into turnieje values(
turnieje_seq.nextval,
punktacja,
sysdate,
null
);

END;
/

create or replace procedure zakoncz_turniej (id0 integer)
AS

BEGIN

update turnieje set
czas_zakonczenia = sysdate
where turniej_id = id0;

END;
/

create or replace procedure dodaj_turniej (punktacja varchar)
AS

BEGIN

insert into turnieje values(
turnieje_seq.nextval,
punktacja,
sysdate,
null
);

END;
/

create or replace procedure dodaj_rozgrywke (
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
turnieje_seq.nextval,
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
/

CREATE OR REPLACE FUNCTION nastepny_gracz (gracz varchar)
RETURN varchar
AS

BEGIN

if gracz='n' then
  return 'e';
elsif gracz='e' then
  return 's';
elsif gracz='s' then
  return 'w';
elsif gracz='w' then
  return 'n';
end if;

END;
/
