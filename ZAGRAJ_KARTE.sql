create or replace NONEDITIONABLE PROCEDURE zagraj_karte (lewa int, karta varchar)
AS

sklad varchar2(8);

BEGIN

select trim(sklad_lewy) into sklad from lewy where lewa_id=lewa;
DBMS_OUTPUT.put_line(length(sklad));

if sklad=null then
  update lewy set kolor=substr(2,1,karta) where rozgrywka_id=(select rozgrywka_id from lewy where lewa_id=lewa);
end if;

sklad := sklad || karta;
update lewy set sklad_lewy=sklad where lewa_id=lewa;

if length(sklad)=8 then
  koniec_lewy(lewa);
end if;

END;