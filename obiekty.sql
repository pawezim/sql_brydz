create table karty (id_karty integer, symbol char(2));

insert into karty values (1, '2s');
insert into karty values (2, '3s');
insert into karty values (3, '4s');
insert into karty values (4, '5s');
insert into karty values (5, '6s');
insert into karty values (6, '7s');
insert into karty values (7, '8s');
insert into karty values (8, '9s');
insert into karty values (9, '0s');
insert into karty values (10,'Js');
insert into karty values (11,'Qs');
insert into karty values (12, 'Ks');
insert into karty values (13, 'As');
insert into karty values (14, '2d');
insert into karty values (15, '3d');
insert into karty values (16, '4d');
insert into karty values (17, '5d');
insert into karty values (18, '6d');
insert into karty values (19, '7d');
insert into karty values (20, '8d');
insert into karty values (21, '9d');
insert into karty values (22, '0d');
insert into karty values (23,'Jd');
insert into karty values (24,'Qd');
insert into karty values (25, 'Kd');
insert into karty values (26, 'Ad');
insert into karty values (27, '2h');
insert into karty values (28, '3h');
insert into karty values (29, '4h');
insert into karty values (30, '5h');
insert into karty values (31, '6h');
insert into karty values (32, '7h');
insert into karty values (33, '8h');
insert into karty values (34, '9h');
insert into karty values (35, '0h');
insert into karty values (36,'Jh');
insert into karty values (37,'Qh');
insert into karty values (38, 'Kh');
insert into karty values (39, 'Ah');
insert into karty values (40, '2c');
insert into karty values (41, '3c');
insert into karty values (42, '4c');
insert into karty values (43, '5c');
insert into karty values (44, '6c');
insert into karty values (45, '7c');
insert into karty values (46, '8c');
insert into karty values (47, '9c');
insert into karty values (48, '0c');
insert into karty values (49,'Jc');
insert into karty values (50,'Qc');
insert into karty values (51, 'Kc');
insert into karty values (52, 'Ac');

CREATE SEQUENCE rozdania_seq START WITH 1;

create table losowania (x varchar(255) );


create sequence gracze_seq start with 1;
create sequence pary_seq start with 1;
create sequence turnieje_seq start with 1;
create sequence rozgrywki_seq start with 2;

create sequence lewy_seq start with 1;

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

create or replace procedure zakoncz_turniej (id integer)
AS

BEGIN

update turnieje set
czas_zakonczenia = sysdate
where turniej_id = id;

END;
/


create table hierarchia_odzywek (
id integer,
odzywka varchar(2)
);


