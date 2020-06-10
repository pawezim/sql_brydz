CREATE OR REPLACE PROCEDURE zglos_odzywke
(rozgrywka_id in integer, odzywka in char(2))
AS

BEGIN

select przebieg_licytacji into przebieg from rozgrywki where rozgrywka_id = rozgrywka_id;

przebieg: = przebieg || odzywka;

update rozgrywki set
  przebieg_licytacji = przebieg
  where rozgrywka_id = rozgrywka_id;

if przebieg='papapa' then
  execute koniec_licytacji(rozgrywka_id);
end if;

END;

/
