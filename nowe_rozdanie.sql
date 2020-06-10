create or replace NONEDITIONABLE PROCEDURE nowe_rozdanie(turniej_id integer, rozdajacy VARCHAR)  AS

   rozd1 varchar(255);
   rozd2 varchar(255);
   rozd3 varchar(255);
   rozd4 varchar(255);
   

    BEGIN

    
   delete from losowania;
   insert into losowania select symbol from karty order by dbms_random.value;
    

    select listagg(x) within group (order by (select null from dual)) into rozd1 from losowania where rownum<=13;
    delete from losowania where rownum <=13;
    select listagg(x) within group (order by (select null from dual)) into rozd2 from losowania where rownum<=13;
    delete from losowania where rownum <=13;
    select listagg(x) within group (order by (select null from dual)) into rozd3 from losowania where rownum<=13;
    delete from losowania where rownum <=13;
    select listagg(x) within group (order by (select null from dual)) into rozd4 from losowania where rownum<=13;
    delete from losowania where rownum <=13;

    insert into rozdania values
    (
    ROZDANIA_SEQ.nextval,
    rozd1,
    rozd2,
    rozd3,
    rozd4,
    rozdajacy,
    turniej_id
    );
    END nowe_rozdanie;