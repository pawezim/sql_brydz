CREATE OR REPLACE FUNCTION nastepny_gracz
(gracz in char(1))
RETURN char(1)
AS

BEGIN

if gracz='n' then
  return 'e';
elsif gracz='e' then
  return 's';
elsif gracz='s' then
  return 'w';
elsif gracz='w' then
  return 'n';
end if;

END

/