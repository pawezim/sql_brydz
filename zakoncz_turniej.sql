create or replace NONEDITIONABLE procedure zakoncz_turniej (id integer)
AS

BEGIN

update turnieje set
czas_zakonczenia = sysdate
where turniej_id = id;

END;
/