CREATE OR REPLACE PROCEDURE koniec_lewy
(lewa_id in integer)
AS

sklad char(8);
i integer;
bioracy char(1);
gracz char(1);
rozgrywka integer;
kolor char(1);
atut char(1);

BEGIN

select rozgrywka_id into rozgrywka from lewy where lewa_id=lewa_id;

select sklad_lewy into sklad from lewy where lewa_id=lewa_id;

select kolor into kolor from lewy where lewa_id=lewa_id;

select substr(2,1,wynik_licytacji) into atut from rozgrywki where rosgrywka_id=rozgrywka;

select rozpoczynajacy into bioracy from lewy where lewa_id=lewa_id;
i:=1;
loop
  i:=i+1;
  exit when i>4;
  if 
    --tutaj trzeba jakos sprawdzac czy karta polozona przez kolejnego gracza jest wyzsza (z uzwglednieniem koloru lewy i koloru atutowego)
  end if;
  gracz:=nastepny_gracz(gracz);
end loop;

update lewy set
  bioracy_lewe=bioracy, czy_kompletna=1
  where lewa_id=lewa_id;

with rozgrywajacy as(
  select rozgrywajacy from rozgrywki where rozgrywka_id=rozgrywka;
)
if bioracy=rozgrywajacy or bioracy=nastepny_gracz(nastepny_gracz(bioracy)) then
  update rozgrywki set
    liczba wzietych_lew=wzietych_lew+1
    where rozgrywka_id=rozgrywka;
end if;

with numer as(
  select numer_lewy from lewy where lewa_id=lewa_id;
)
if numer=13 then
  execute koniec_rozgrywki(rozgrywka);
else
  update lewy set
    rozpoczynajacy=bioracy
    where numer_lewy=numer+1 and rozgrywka_id=rozgrywka;
end if;

END;

/