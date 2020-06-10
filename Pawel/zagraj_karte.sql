CREATE OR REPLACE PROCEDURE zagraj_karte
(lewa_id in integer, karta in char(2))
AS

sklad varchar(8);

BEGIN

select sklad_lewy into sklad from lewy where lewa_id=lewa_id;

if sklad=null then
  update lewy set kolor=substr(2,1,karta);
end if;

sklad := sklad || karta;
update lewy set sklad_lewy=sklad;

if length(sklad)=8 then
  execute koniec_lewy(lewa_id);
end if;

END;

/