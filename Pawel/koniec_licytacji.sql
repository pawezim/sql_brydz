CREATE OR REPLACE PROCEDURE koniec_licytacji
(rozgrywka_id in integer)
AS

przebieg varchar(60);
gracz char(1);
i integer;
wynik char(2);
modyf char(2);
rozgr char(1);

BEGIN

select przebieg_licytacji into przebieg from rozgrywki where rozgrywka_id=rozgrywka_id;
select rozdajacy into gracz from rozgrywki where rozgrywka_id=rozgrywka_id;

wynik := substr(-8,2,przebieg);
if wynik='db' or wynik='rd' then
  i:=0;
  loop
    i:=i+2;
    wynik := substr(-8-i,2,przebieg);
    exit when wynik!='db' and wynik!='rd' and wynik!='pa';
  end loop;
end if;

modyf:='pa';
i:=1;
loop
  exit when i>length(przebieg)-6;
  if substr(i,2,przebieg)='db' then
    modyf:='db';
  elsif substr(i,2,przebieg)='rd' then
    modyf:='rd';
  elsif substr(i,2,przebieg)='pa' then
    modyf:='pa';
  end if;
  i:=i+2;
end loop;

update rozgrywki set
  wynik_licytacji = wynik,
  modyfikacja_zapisu = modyf,
  czy_zakonczona_licytacja = 1;

if wynik!='pa' then
  i:=1;
  loop
    if substr(i+1,1,przebieg)!='rd' then
      exit when substr(i+1,1,przebieg)=substr(2,1,wynik);
    end if;
    i:=i+2;
    gracz := nastepny_gracz(gracz);
  end loop;
  update rozgrywki set
    rozgrywajacy = gracz;
  gracz:=nastepny_gracz(gracz);
  i:=0;
  loop
    i:=i+1;
    exit when i>13
    insert into lewy values (i, null, null, null, 0, null, rozgrywka_id),
  end loop;
  update lewy set rozpoczynajacy=gracz where numer_lewy=1;
end if;

END;

/