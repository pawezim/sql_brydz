CREATE OR REPLACE PROCEDURE koniec_rozgrywki
(rozgrywka_id in integer)
AS

zakontraktowane integer;
atut char(1);
wziete integer;
punkty integer;
modyf char(2);

BEGIN

select substr(2,1,wynik_licytacji) into atut from rozgrywki where rozgrywka_id = rozgrywka_id;

select to_number(substr(1,1,wynik_licytacji)) into zakontraktowane from rozgrywki where rozgrywka_id = rozgrywka_id;

select liczba_wzietych_lew - 6 into wziete from rozgrywki where rozgrywka_id = rozgrywka_id;

with modyfikacja as(
  select modyfikacja zapisu from rozgrywki where rozgrywka_id = rozgrywka_id;
)
if modyfikacja is not null then
  select * into modyf from modyfikacja;
end if;

if wziete>zakontraktowane then
  if atut='n' then
    punkty:=30*wziete+60;
    if wziete>=3 then
      punkty=punkty+250;
    end if;
  elsif atut='c' or atut='h' then
    punkty:=30*wziete+50;
    if wziete>=4 then
      punkty=punkty+250;
    end if;
  elsif atut='d' or atut='c' then
    punkty:=20*wziete+50;
    if wziete>=5 then
      punkty=punkty+250;
    end if;
  end if;
else
  punkty:=(wziete-zakontraktowane)*50;
end if;

if wziete>5 then
  punkty=punkty+500*(wziete-5)
end if

if modyf='db' then
  punkty=2*punkty;
elsif modyf='rd' then
  punkty=4*punkty;
end if;

update rozgrywki set
  czy_zakonczona_rozgrywka = 1, punkty_dla_ns = punkty
  where rozgrywka_id = rozgrywka_id;

update pary set
  liczba_rozegranych_rozdan = liczba_rozegranych_rozdan+1
  where para_id in select para para_id from pary pa
  join rozgrywki ro where 
  (ro.para_ns=pa.para_id or ro.para_we=pa.para_id)
  and ro.rozgrywka_id=rozgrywka_id;

END;

/