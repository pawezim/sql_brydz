CREATE OR REPLACE PROCEDURE koniec_lewy
(lewa in integer)
AS

sklad char(8);
i integer;
zaczynajacy char(1);
bioracy char(1);
rozgrywajacy char(1);
rozgrywka integer;
atut char(1);
najlepsza_karta integer;
wartosc integer;
aktualna_wartosc integer;
numer integer;


BEGIN

select rozgrywka_id into rozgrywka from lewy where lewa_id=lewa;

select sklad_lewy into sklad from lewy where lewa_id=lewa;

select substr(wynik_licytacji,2,1) into atut from rozgrywki where rozgrywka_id=rozgrywka;

select rozpoczynajacy into zaczynajacy from lewy where lewa_id=lewa;

bioracy:= zaczynajacy;


if atut = 'n' then 
    atut:=substr(sklad, 2, 1);
end if; 


-- sprawdza czy w lewie sa atuty i wyszukuje najlepsza karte
i:=1;
najlepsza_karta:=0;
wartosc:=0;
loop
  i:=i+1;
  exit when i>4;
  select id_karty into aktualna_wartosc from karty where symbol=substr(sklad,2*i-1,2);
  if substr(sklad, 2*i, 1) = atut then
    aktualna_wartosc:=aktualna_wartosc+100;    
  end if;
  if wartosc<aktualna_wartosc then
    najlepsza_karta:= i;
    wartosc:= aktualna_wartosc;
  end if;
  
end loop;

loop

    exit when najlepsza_karta<=1;
    najlepsza_karta:=najlepsza_karta-1;
    bioracy:=nastepny_gracz(bioracy);
    
end loop;



update lewy set
  bioracy_lewe=bioracy, czy_kompletna=1
  where lewa_id=lewa;

select rozgrywajacy into rozgrywajacy from rozgrywki where rozgrywka_id=rozgrywka;

if bioracy=rozgrywajacy or bioracy=nastepny_gracz(nastepny_gracz(bioracy)) then
  update rozgrywki set
    liczba_wzietych_lew=liczba_wzietych_lew+1
    where rozgrywka_id=rozgrywka;
end if;


select numer_lewy into numer from lewy where lewa_id=lewa;
if numer=13 then
  koniec_rozgrywki(rozgrywka);
else
  update lewy set
    rozpoczynajacy=bioracy
    where numer_lewy=numer+1 and rozgrywka_id=rozgrywka;
end if;

END;
