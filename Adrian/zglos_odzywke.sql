create or replace NONEDITIONABLE PROCEDURE ZGLOS_ODZYWKE
(rozgrywka_id in integer, aktualna_odzywka in varchar)
AS

niepoprawna_odzywka exception;
niepoprawna_odzywka_null exception;
przebieg varchar(50);
ostatnia_odzywka varchar(2);
id_ostatniej integer;
id_odzywki integer;
dlugosc_przebiegu integer;

ostatnie_trzy varchar(6);

BEGIN

select przebieg_licytacji into przebieg from rozgrywki where rozgrywka_id = rozgrywka_id;

if aktualna_odzywka not in ('pa', 'db', 'rd') then

    -- jeśli odzywka jest niepoprawna (nie znajduje się w tabeli) otrzymamy wyjatek no_data_found
    select id into id_odzywki from hierarchia_odzywek where hierarchia_odzywek.odzywka=aktualna_odzywka;

    if przebieg is not null then
        select substr(przebieg, -2,2) into ostatnia_odzywka from dual;    
        select id into id_ostatniej from hierarchia_odzywek where hierarchia_odzywek.odzywka=ostatnia_odzywka;
        
        -- sprawdzanie czy odzywka jest wyższa od ostatniej
        if id_odzywki <= id_ostatniej then
            raise niepoprawna_odzywka;
        end if;
    end if;
end if;


przebieg:= przebieg || aktualna_odzywka;

update rozgrywki set
  przebieg_licytacji = przebieg
  where rozgrywka_id = rozgrywka_id;

select length(przebieg) into dlugosc_przebiegu from dual;  
  
if dlugosc_przebiegu >= 8 then
    select substr(przebieg, -6,6) into ostatnie_trzy from dual;
    if ostatnie_trzy='papapa' then
        begin
            koniec_licytacji(rozgrywka_id);
        end;
    end if;
end if;

EXCEPTION
    WHEN niepoprawna_odzywka THEN
        dbms_output.put_line('Odzywka niepoprawna- ' || aktualna_odzywka || ' -powinna byc wyzsza od poprzedniej- ' || ostatnia_odzywka ); 
    WHEN no_data_found THEN
        dbms_output.put_line('Niepoprawny format odzywki, wpisz jeszcze raz');
END ZGLOS_ODZYWKE;