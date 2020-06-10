create or replace NONEDITIONABLE procedure dodaj_turniej (punktacja varchar)
AS

BEGIN

insert into turnieje values(
turnieje_seq.nextval,
punktacja,
sysdate,
null
);

END;