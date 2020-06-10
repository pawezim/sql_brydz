create or replace NONEDITIONABLE procedure dodaj_gracza(imie varchar, nazwisko varchar)
AS

BEGIN

insert into gracze values(
gracze_seq.nextval,
imie,
nazwisko
);

END;