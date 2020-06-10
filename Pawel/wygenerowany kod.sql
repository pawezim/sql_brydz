-- Generated by Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   at:        2020-05-10 21:19:25 CEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE gracze (
    gracz_id  INTEGER NOT NULL,
    imie      VARCHAR2(20) NOT NULL,
    nazwisko  VARCHAR2(20) NOT NULL
);

ALTER TABLE gracze ADD CONSTRAINT gracze_pk PRIMARY KEY ( gracz_id );

CREATE TABLE lewy (
    lewa_id         INTEGER NOT NULL,
    numer_lewy      INTEGER NOT NULL,
    rozpoczynajacy  CHAR(1),
    sklad_lewy      CHAR(8),
    kolor           CHAR(1),
    czy_kompletna   CHAR(1) NOT NULL,
    bioracy_lewe    CHAR(1),
    rozgrywka_id    INTEGER NOT NULL
);

ALTER TABLE lewy ADD CONSTRAINT lewy_pk PRIMARY KEY ( lewa_id );

CREATE TABLE pary (
    para_id                    INTEGER NOT NULL,
    ranking_turnieju           INTEGER,
    suma_punktow_turniejowych  INTEGER NOT NULL,
    ilosc_rozegranych_rozdan   INTEGER NOT NULL,
    gracz_1_id                 INTEGER NOT NULL,
    gracz_2_id                 INTEGER NOT NULL,
    turniej_id                 INTEGER NOT NULL
);

ALTER TABLE pary ADD CONSTRAINT pary_pk PRIMARY KEY ( para_id );

CREATE TABLE rozdania (
    rozdanie_id  INTEGER NOT NULL,
    karty_n      CHAR(26) NOT NULL,
    karty_e      CHAR(26) NOT NULL,
    karty_s      CHAR(26) NOT NULL,
    karty_w      CHAR(26) NOT NULL,
    rozdajacy    CHAR(1) NOT NULL,
    turniej_id   INTEGER NOT NULL
);

ALTER TABLE rozdania ADD CONSTRAINT rozdania_pk PRIMARY KEY ( rozdanie_id );

CREATE TABLE rozgrywki (
    rozgrywka_id              INTEGER NOT NULL,
    numer_stolu               INTEGER,
    numer_rundy               INTEGER,
    przebieg_licytacji        VARCHAR2(60),
    czy_zakonczona_licytacja  CHAR(1) NOT NULL,
    wynik_licytacji           CHAR(2),
    modyfikacja_zapisu        CHAR(2),
    rozgrywajacy              CHAR(1),
    liczba_wzietych_lew       INTEGER,
    czy_zakonczona_rozgrywka  CHAR(1) NOT NULL,
    punkty_dla_ns             INTEGER,
    punkty_turniejowe_dla_ns  INTEGER,
    czas_rozpoczecia          TIMESTAMP(0),
    czas_zakonczenia          TIMESTAMP(0),
    rozdanie_id               INTEGER NOT NULL,
    para_ns_id                INTEGER NOT NULL,
    para_we_id                INTEGER NOT NULL,
    gracz_n_id                INTEGER NOT NULL,
    gracz_e_id                INTEGER NOT NULL,
    gracz_s_id                INTEGER NOT NULL,
    gracz_w_id                INTEGER NOT NULL
);

ALTER TABLE rozgrywki ADD CONSTRAINT rozgrywki_pk PRIMARY KEY ( rozgrywka_id );

CREATE TABLE turnieje (
    turniej_id        INTEGER NOT NULL,
    system_punktacji  CHAR(3),
    czas_rozpoczecia  TIMESTAMP(0),
    czas_zakonczenia  TIMESTAMP(0)
);

ALTER TABLE turnieje ADD CONSTRAINT turnieje_pk PRIMARY KEY ( turniej_id );

ALTER TABLE lewy
    ADD CONSTRAINT lewy_rozgrywki_fk FOREIGN KEY ( rozgrywka_id )
        REFERENCES rozgrywki ( rozgrywka_id );

ALTER TABLE pary
    ADD CONSTRAINT pary_gracze_fk FOREIGN KEY ( gracz_1_id )
        REFERENCES gracze ( gracz_id );

ALTER TABLE pary
    ADD CONSTRAINT pary_gracze_fkv1 FOREIGN KEY ( gracz_2_id )
        REFERENCES gracze ( gracz_id );

ALTER TABLE pary
    ADD CONSTRAINT pary_turnieje_fk FOREIGN KEY ( turniej_id )
        REFERENCES turnieje ( turniej_id );

ALTER TABLE rozdania
    ADD CONSTRAINT rozdania_turnieje_fk FOREIGN KEY ( turniej_id )
        REFERENCES turnieje ( turniej_id );

ALTER TABLE rozgrywki
    ADD CONSTRAINT rozgrywki_gracze_fk FOREIGN KEY ( gracz_n_id )
        REFERENCES gracze ( gracz_id );

ALTER TABLE rozgrywki
    ADD CONSTRAINT rozgrywki_gracze_fkv1 FOREIGN KEY ( gracz_w_id )
        REFERENCES gracze ( gracz_id );

ALTER TABLE rozgrywki
    ADD CONSTRAINT rozgrywki_gracze_fkv3 FOREIGN KEY ( gracz_e_id )
        REFERENCES gracze ( gracz_id );

ALTER TABLE rozgrywki
    ADD CONSTRAINT rozgrywki_gracze_fkv4 FOREIGN KEY ( gracz_s_id )
        REFERENCES gracze ( gracz_id );

ALTER TABLE rozgrywki
    ADD CONSTRAINT rozgrywki_pary_fk FOREIGN KEY ( para_ns_id )
        REFERENCES pary ( para_id );

ALTER TABLE rozgrywki
    ADD CONSTRAINT rozgrywki_pary_fkv1 FOREIGN KEY ( para_we_id )
        REFERENCES pary ( para_id );

ALTER TABLE rozgrywki
    ADD CONSTRAINT rozgrywki_rozdania_fk FOREIGN KEY ( rozdanie_id )
        REFERENCES rozdania ( rozdanie_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             18
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
