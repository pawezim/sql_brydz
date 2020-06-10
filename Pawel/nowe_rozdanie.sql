CREATE OR REPLACE PROCEDURE nowe_rozdanie
(turniej_id in integer, rozdajacy in char(1))
AS

BEGIN

with losowe_karty as(
 select symbol from karty order by dbms_random.value
)
insert into rozdania values
(
select listagg(symbol,'') from losowe_karty where rownum <= 13,
select listagg(symbol,'') from losowe_karty where rownum >13 and rownum <= 26,
select listagg(symbol,'') losowe_karty where rownum >26 and rownum <= 39,
select listagg(symbol,'') losowe_karty where rownum >39 and rownum <= 52,
rozdajacy,
turniej_id
)

END;

/