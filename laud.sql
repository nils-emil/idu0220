--DROP FOREIGN TABLE IF EXISTS Riik_jsonb CASCADE;
--DROP FOREIGN TABLE IF EXISTS Isik_jsonb CASCADE;
--DROP USER MAPPING FOR t164416 SERVER
--minu_testandmete_server_apex;
--DROP SERVER IF EXISTS minu_testandmete_server_apex CASCADE;
--DROP EXTENSION IF EXISTS postgres_fdw CASCADE;

CREATE EXTENSION IF NOT EXISTS postgres_fdw;
CREATE SERVER IF NOT EXISTS minu_testandmete_server_apex FOREIGN DATA WRAPPER
postgres_fdw OPTIONS (host 'apex.ttu.ee', dbname 'testandmed',
port '5432');
CREATE USER MAPPING IF NOT EXISTS FOR t164416 SERVER
minu_testandmete_server_apex OPTIONS (user 't164416', password
'laintrusa');
CREATE FOREIGN TABLE IF NOT EXISTS Riik_jsonb (
riik JSONB )
SERVER minu_testandmete_server_apex;
SELECT * FROM Riik_jsonb;


DROP TABLE IF EXISTS Riik CASCADE
;

CREATE TABLE Riik
(
  riik_kood varchar(3)	 NOT NULL,
  nimetus varchar(60)	 NOT NULL,
  CONSTRAINT PK_Riik_Riik_kood PRIMARY KEY (riik_kood),
  CONSTRAINT AK_Riik_Nimetus UNIQUE (nimetus),
  CONSTRAINT riik_riik_kood_check_on_kolm_suurtahte CHECK (riik_kood~'^[A-Z]{3}$'),
  CONSTRAINT riik_nimetus_check_ei_koosne_tyhikutest CHECK (nimetus!~'^[[:space:]]*$'),
  CONSTRAINT riik_nimetus_check_ei_ole_tyhi_string CHECK (nimetus<>'')
)
;

SELECT * FROM Riik;

CREATE FOREIGN TABLE IF NOT EXISTS Isik_jsonb (
isik JSONB )
SERVER minu_testandmete_server_apex;
SELECT * FROM Isik_jsonb;
DROP TABLE IF EXISTS Amet CASCADE;
DROP TABLE IF EXISTS Tootaja_seisundi_liik CASCADE;
DROP TABLE IF EXISTS Isiku_seisundi_liik CASCADE;
DROP TABLE IF EXISTS Isik CASCADE;
DROP TABLE IF EXISTS Tootaja CASCADE;
DROP TABLE IF EXISTS Laua_materjal CASCADE;
DROP TABLE IF EXISTS Laua_seisundi_liik CASCADE;
DROP TABLE IF EXISTS Laud CASCADE;
DROP TABLE IF EXISTS Laua_kategooria_tyyp CASCADE;
DROP TABLE IF EXISTS Laua_kategooria CASCADE;
DROP TABLE IF EXISTS Laua_kategooria_omamine CASCADE;
DROP TABLE IF EXISTS Kliendi_seisundi_liik CASCADE;
DROP TABLE IF EXISTS Klient CASCADE;


DROP DOMAIN IF EXISTS public.d_reg_aeg;
CREATE DOMAIN d_reg_aeg timestamp NOT NULL DEFAULT LOCALTIMESTAMP(0);
ALTER DOMAIN d_reg_aeg ADD CONSTRAINT reg_aeg_check_lubatud_vahemik CHECK (VALUE >= '01.01.2010  00:00:00''' AND VALUE < '01.01.2101  00:00:00''');
ALTER DOMAIN d_reg_aeg ADD CONSTRAINT reg_aeg_check_v2iksem_v6rdne_kui_hetke_aeg CHECK (VALUE <= LOCALTIMESTAMP(0));
ALTER DOMAIN public.d_reg_aeg OWNER to t164416;


CREATE TABLE Amet
(
  amet_kood smallint NOT NULL,
  nimetus varchar(60)	 NOT NULL,
  kirjeldus text	,
  CONSTRAINT PK_Amet_Amet_kood PRIMARY KEY (amet_kood),
  CONSTRAINT AK_Amet_Nimetus UNIQUE (nimetus),
  CONSTRAINT amet_amet_kood_check_0 CHECK (amet_kood >= 1),
  CONSTRAINT amet_kirjeldus_check_ei_koosne_tyhikutest CHECK (kirjeldus!~'^[[:space:]]*$'),
  CONSTRAINT amet_nimetus_check_ei_koosne_tyhikutest CHECK (nimetus!~'^[[:space:]]*$'),
  CONSTRAINT amet_kirjeldus_check_ei_ole_tyhi_string CHECK (kirjeldus<>''),
  CONSTRAINT amet_nimetus_check_ei_ole_tyhi_string CHECK (nimetus<>'')
)
WITH (
    OIDS = FALSE,
    FILLFACTOR = 90
)
TABLESPACE pg_default;
;


CREATE TABLE Tootaja_seisundi_liik
(
  tootaja_seisundi_liik_kood smallint NOT NULL,
  nimetus varchar(60)	 NOT NULL,
  CONSTRAINT PK_Tootaja_seisundi_liik_Tootaja_seisundi_liik_kood PRIMARY KEY (tootaja_seisundi_liik_kood),
  CONSTRAINT AK_Tootaja_Seisundi_Liik_Nimetus UNIQUE (nimetus),
  CONSTRAINT tootaja_seisundi_liik_tootaja_seisundi_liik_kood_check_0 CHECK (tootaja_seisundi_liik_kood >= 1),
  CONSTRAINT tootaja_seisundi_liik_nimetus_check_ei_koosne_tyhikutest CHECK (nimetus!~'^[[:space:]]*$'),
  CONSTRAINT tootaja_seisundi_liik_nimetus_check_ei_ole_tyhi_string CHECK (nimetus<>'')
)
;


CREATE TABLE Isiku_seisundi_liik
(
  isiku_seisundi_liik_kood smallint NOT NULL,
  nimetus varchar(60)	 NOT NULL,
  CONSTRAINT PK_Isiku_seisundi_liik_Isiku_seisundi_liik_kood PRIMARY KEY (isiku_seisundi_liik_kood),
  CONSTRAINT isiku_seisundi_liik_isiku_seisundi_liik_kood_check_0 CHECK (isiku_seisundi_liik_kood >= 1),
  CONSTRAINT AK_Isiku_Seisundi_Liik_Nimetus UNIQUE (nimetus),
  CONSTRAINT isiku_seisundi_liik_nimetus_check_ei_koosne_tyhikutest CHECK (nimetus!~'^[[:space:]]*$'),
  CONSTRAINT isiku_seisundi_liik_nimetus_check_ei_ole_tyhi_string CHECK (nimetus<>'')
)
;

CREATE TABLE Isik
(
  isik_id SERIAL,
  isikukoodi_riik varchar(3)	 NOT NULL,
  isiku_seisundi_liik_kood smallint NOT NULL DEFAULT 1,
  e_meil varchar(254)	 NOT NULL,
  isikukood varchar(60)	 NOT NULL,
  synni_kp date NOT NULL,
  parool varchar(60)	 NOT NULL,
  reg_aeg d_reg_aeg,
  eesnimi varchar(1000),
  perenimi varchar(1000)	,
  elukoht varchar(255)	,
  CONSTRAINT PK_Isik_isik_id PRIMARY KEY (isik_id),
  CONSTRAINT AK_Isik_e_meil UNIQUE (e_meil),
  CONSTRAINT AK_Isikukood_riik UNIQUE (isikukood,isikukoodi_riik),
  CONSTRAINT isik_e_meil_check_oige_vorm CHECK (e_meil::text ~ '^.*@.*$'::text AND e_meil::text !~ '^.*@.*@.*$'::text),
  CONSTRAINT isik_synni_kp_check_lubatud_vahemik CHECK (synni_kp >= '01.01.1900' AND synni_kp <= '12.31.2100'),
  CONSTRAINT isik_synni_kp_check_v2iksem_v6rdne_isiku_registreerimise_ajast CHECK (synni_kp <= reg_aeg),
  CONSTRAINT isik_synni_kp_check_v2iksem_v6rdne_kui_hetke_kuupaev CHECK (synni_kp <= current_date),
  CONSTRAINT isik_isikukood_check_ei_koosne_tyhikutest CHECK (isikukood!~'^[[:space:]]*$'),
  CONSTRAINT isik_isikukood_check_ei_ole_tyhi_string CHECK (isikukood<>''),
  CONSTRAINT isik_isikukood_check_lubatud_symbolid CHECK (isikukood::text ~* '^[a-z0-9 /-]+$'::text),
  CONSTRAINT isik_eesnimi_check_eesnimi_voi_perenimi_registreeritud CHECK (perenimi IS NOT NULL OR eesnimi IS NOT NULL),
  CONSTRAINT isik_eesnimi_check_ei_ole_tyhi_string CHECK (eesnimi<>''),
  CONSTRAINT isik_perenimi_check_ei_ole_tyhi_string CHECK (perenimi<>''),
  CONSTRAINT isik_eesnimi_check_ei_koosne_tyhikutest CHECK (eesnimi!~'^[[:space:]]*$'),
  CONSTRAINT isik_perenimi_check_ei_koosne_tyhikutest CHECK (perenimi!~'^[[:space:]]*$'),
  CONSTRAINT isik_elukoht_check_ei_koosne_tyhikutest CHECK (elukoht!~'^[[:space:]]*$'),
  CONSTRAINT isik_elukoht_check_ei_ole_tyhi_string CHECK (elukoht<>''),
  CONSTRAINT isik_elukoht_check_ei_koosne_ainult_numbritest CHECK (elukoht !~ '^[[:digit:]]+$'),
  CONSTRAINT isik_parool_check_ei_koosne_tyhikutest CHECK (parool!~'^[[:space:]]*$'),
  CONSTRAINT FK_Isik_Isiku_seisundi_liik FOREIGN KEY (isiku_seisundi_liik_kood) REFERENCES Isiku_seisundi_liik (isiku_seisundi_liik_kood) ON DELETE No Action ON UPDATE Cascade,
  CONSTRAINT FK_Isik_Riik FOREIGN KEY (isikukoodi_riik) REFERENCES Riik (riik_kood) ON DELETE No Action ON UPDATE Cascade
)
WITH (
    OIDS = FALSE,
    FILLFACTOR = 90
)
TABLESPACE pg_default;
;
ALTER TABLE isik DROP CONSTRAINT AK_Isik_e_meil;
CREATE UNIQUE INDEX IXFK_Isik_e_meil ON isik (Upper(e_meil));


CREATE TABLE Tootaja
(
  tootaja_id integer NOT NULL,
  amet_kood smallint NOT NULL,
  tootaja_seisundi_liik_kood smallint NOT NULL DEFAULT 1,
  mentor integer,
  CONSTRAINT tootaja_mentor_check_ei_ole_enda_mentor CHECK (tootaja_id<>mentor),
  CONSTRAINT PK_Tootaja_Tootaja_id PRIMARY KEY (tootaja_id),
  CONSTRAINT FK_Tootaja_Amet FOREIGN KEY (amet_kood) REFERENCES Amet (amet_kood) ON DELETE No Action ON UPDATE Cascade,
  CONSTRAINT FK_Tootaja_Tootaja_seisundi_liik FOREIGN KEY (tootaja_seisundi_liik_kood) REFERENCES Tootaja_seisundi_liik (tootaja_seisundi_liik_kood) ON DELETE No Action ON UPDATE Cascade,
  CONSTRAINT FK_Tootaja_Isik FOREIGN KEY (tootaja_id) REFERENCES Isik (isik_id) ON DELETE Cascade ON UPDATE No Action,
  CONSTRAINT FK_Tootaja_Mentor FOREIGN KEY (mentor) REFERENCES Tootaja (tootaja_id) ON DELETE Set Null ON UPDATE No Action
)
WITH (
    OIDS = FALSE,
    FILLFACTOR = 90
)
TABLESPACE pg_default;
;


CREATE TABLE Laua_materjal
(
  laua_materjal_kood smallint NOT NULL,
  nimetus varchar(60)	 NOT NULL,
  CONSTRAINT PK_Laua_materjal_laua_materjal_kood PRIMARY KEY (laua_materjal_kood),
  CONSTRAINT AK_Laua_Materjal_Nimetus UNIQUE (nimetus),
  CONSTRAINT laua_materjal_laua_materjal_kood_check_0 CHECK (laua_materjal_kood >= 1),
  CONSTRAINT laua_materjal_nimetus_check_ei_koosne_tyhikutest CHECK (nimetus!~'^[[:space:]]*$'),
  CONSTRAINT laua_materjal_nimetus_check_ei_ole_tyhi_string CHECK (nimetus<>'')
)
;


CREATE TABLE Laua_seisundi_liik
(
  laua_seisundi_liik_kood smallint NOT NULL,
  nimetus varchar(60)	 NOT NULL,
  CONSTRAINT PK_Laua_seisundi_liik_Laua_seisundi_liik_kood PRIMARY KEY (laua_seisundi_liik_kood),
  CONSTRAINT AK_Laua_Seisundi_Liik_Nimetus UNIQUE (nimetus),
  CONSTRAINT laua_seisundi_liik_laua_seisundi_liik_kood_check_0 CHECK (laua_seisundi_liik_kood >= 1),
  CONSTRAINT laua_seisundi_liik_nimetus_check_ei_koosne_tyhikutest CHECK (nimetus!~'^[[:space:]]*$'),
  CONSTRAINT laua_seisundi_liik_nimetus_check_ei_ole_tyhi_string CHECK (nimetus<>'')
)
;


CREATE TABLE Laud
(
  laud_kood integer NOT NULL,
  registreerija_id integer NOT NULL,
  laua_seisundi_liik_kood smallint NOT NULL DEFAULT 1, --ootel, mitteaktiivne, aktiivne, lopetatud
  laua_materjal_kood smallint NOT NULL, --metall, puit, jne
  reg_aeg d_reg_aeg,
  kohtade_arv Integer NOT NULL,
  kommentaar text	,
  CONSTRAINT PK_Laud_laud_kood PRIMARY KEY (laud_kood),
  CONSTRAINT laud_laud_kood_check_0 CHECK (laud_kood >= 1),
  CONSTRAINT laud_kohtade_arv_check_vahemik CHECK (kohtade_arv >= 1 AND kohtade_arv <= 200),
  CONSTRAINT laud_kommentaar_check_ei_koosne_tyhikutest CHECK (kommentaar!~'^[[:space:]]*$'),
  CONSTRAINT laud_kommentaar_check_ei_ole_tyhi_string CHECK (kommentaar<>''),
  CONSTRAINT FK_Laud_Laua_materjal FOREIGN KEY (laua_materjal_kood) REFERENCES Laua_materjal (laua_materjal_kood) ON DELETE No Action ON UPDATE Cascade,
  CONSTRAINT FK_Laud_Laua_seisundi_liik FOREIGN KEY (laua_seisundi_liik_kood) REFERENCES Laua_seisundi_liik (laua_seisundi_liik_kood) ON DELETE No Action ON UPDATE Cascade,
  CONSTRAINT FK_Laud_Tootaja FOREIGN KEY (registreerija_id) REFERENCES Tootaja (tootaja_id) ON DELETE No Action ON UPDATE No Action
)
WITH (
    OIDS = FALSE,
    FILLFACTOR = 90
)
TABLESPACE pg_default;
;


CREATE TABLE Laua_kategooria_tyyp
(
  laua_kategooria_tyyp_kood smallint NOT NULL, --omadussonad, liiklus, vaade
  nimetus varchar(60)	 NOT NULL,
  CONSTRAINT PK_Laua_kategooria_tyyp_Laua_kategooria_tyyp_kood PRIMARY KEY (laua_kategooria_tyyp_kood),
  CONSTRAINT AK_Laua_Kategooria_Tyyp_Nimetus UNIQUE (nimetus),
  CONSTRAINT laua_kategooria_tyyp_laua_kategooria_tyyp_kood_check_0 CHECK (laua_kategooria_tyyp_kood >= 1),
  CONSTRAINT laua_kategooria_tyyp_nimetus_check_ei_koosne_tyhikutest CHECK (nimetus!~'^[[:space:]]*$'),
  CONSTRAINT laua_kategooria_tyyp_nimetus_check_ei_ole_tyhi_string CHECK (nimetus<>'')
)
;


CREATE TABLE Laua_kategooria
(
  laua_kategooria_kood smallint NOT NULL, -- kirjelduse kood
  nimetus varchar(60)	 NOT NULL, -- kirjeldus
  laua_kategooria_tyyp_kood smallint NOT NULL, --omadussona kood (omadussonad, liiklus, vaade)
  CONSTRAINT PK_Laua_kategooria_Laua_kategooria_kood PRIMARY KEY (laua_kategooria_kood),
  CONSTRAINT AK_Nimetus_Laua_kategooria_tyyp UNIQUE (laua_kategooria_tyyp_kood,nimetus),
  CONSTRAINT laua_kategooria_laua_kategooria_kood_check_0 CHECK (laua_kategooria_kood >= 1),
  CONSTRAINT laua_kategooria_nimetus_check_ei_koosne_tyhikutest CHECK (nimetus!~'^[[:space:]]*$'),
  CONSTRAINT laua_kategooria_nimetus_check_ei_ole_tyhi_string CHECK (nimetus<>''),
  CONSTRAINT FK_Laua_kategooria_Laua_kategooria_tyyp FOREIGN KEY (laua_kategooria_tyyp_kood) REFERENCES Laua_kategooria_tyyp (laua_kategooria_tyyp_kood) ON DELETE No Action ON UPDATE Cascade
)
;


CREATE TABLE Laua_kategooria_omamine
(
  laua_kategooria_omamine_id SERIAL,
  laud_kood integer NOT NULL, -- laua kood
  laua_kategooria_kood smallint NOT NULL, -- kirjelduse kood
  CONSTRAINT Laua_kategooria_omamine_kood_check_lubatud_vaartus CHECK (laud_kood >= 1 AND laua_kategooria_kood >= 1),
  CONSTRAINT PK_laua_kategooria_omamine_Laua_kategooria_omamine_id PRIMARY KEY (laua_kategooria_omamine_id),
  CONSTRAINT AK_laua_kategooria_omamine_Laua_katogooria_Laud UNIQUE (laud_kood,laua_kategooria_kood),
  CONSTRAINT FK_laua_kategooria_omamine_Laud FOREIGN KEY (laud_kood) REFERENCES Laud (laud_kood) ON DELETE Cascade ON UPDATE Cascade,
  CONSTRAINT FK_Laua_kategooria_omamine_Laua_kategooria FOREIGN KEY (laua_kategooria_kood) REFERENCES Laua_kategooria (laua_kategooria_kood) ON DELETE No Action ON UPDATE Cascade
)
;



CREATE TABLE Kliendi_seisundi_liik
(
  kliendi_seisundi_liik_kood smallint NOT NULL,
  nimetus varchar(60)	 NOT NULL,
  CONSTRAINT PK_Kliendi_seisundi_liik_Kliendi_seisundi_liik_kood PRIMARY KEY (kliendi_seisundi_liik_kood),
  CONSTRAINT AK_Kliendi_Seisundi_Liik_Nimetus UNIQUE (nimetus),
  CONSTRAINT kliendi_seisundi_liik_kliendi_seisundi_liik_kood_check_0 CHECK (kliendi_seisundi_liik_kood >= 1),
  CONSTRAINT kliendi_seisundi_liik_nimetus_check_ei_koosne_tyhikutest CHECK (nimetus!~'^[[:space:]]*$'),
  CONSTRAINT kliendi_seisundi_liik_nimetus_check_ei_ole_tyhi_string CHECK (nimetus<>'')
)
;



CREATE TABLE Klient
(
  klient_id integer NOT NULL,
  on_nous_tylitamisega boolean NOT NULL DEFAULT false,
  kliendi_seisundi_liik_kood smallint NOT NULL DEFAULT 1,
  CONSTRAINT PK_Klient_Klient_id PRIMARY KEY (klient_id),
  CONSTRAINT FK_Klient_Kliendi_seisundi_liik FOREIGN KEY (kliendi_seisundi_liik_kood) REFERENCES Kliendi_seisundi_liik (kliendi_seisundi_liik_kood) ON DELETE No Action ON UPDATE Cascade,
  CONSTRAINT FK_Klient_Isik FOREIGN KEY (klient_id) REFERENCES Isik (isik_id) ON DELETE Cascade ON UPDATE No Action
)
WITH (
    OIDS = FALSE,
    FILLFACTOR = 90
)
TABLESPACE pg_default;
;


DROP INDEX IF EXISTS IXFK_Isik_Isiku_seisundi_liik_kood;
DROP INDEX IF EXISTS IXFK_Isik_Isikukoodi_riik;
DROP INDEX IF EXISTS IXFK_Tootaja_Amet_kood;
DROP INDEX IF EXISTS IXFK_Tootaja_Mentor;
DROP INDEX IF EXISTS IXFK_Tootaja_Tootaja_seisundi_liik_kood;
DROP INDEX IF EXISTS IXFK_Laud_laua_materjal_kood;
DROP INDEX IF EXISTS IXFK_Laud_Laua_seisundi_liik_kood;
DROP INDEX IF EXISTS IXFK_laua_kategooria_omamine_Laua_kategooria_kood;
DROP INDEX IF EXISTS IXFK_Klient_Kliendi_seisundi_liik_kood;
DROP INDEX IF EXISTS IXFK_Laud_Registreerija_id;

CREATE INDEX IXFK_Isik_Isiku_seisundi_liik_kood ON Isik(isiku_seisundi_liik_kood ASC);
CREATE INDEX IXFK_Isik_Isikukoodi_riik ON Isik(isikukoodi_riik ASC);
CREATE INDEX IXFK_Tootaja_Amet_kood ON Tootaja (amet_kood ASC);
CREATE INDEX IXFK_Tootaja_Mentor ON Tootaja (mentor ASC);
CREATE INDEX IXFK_Tootaja_Tootaja_seisundi_liik_kood ON Tootaja (tootaja_seisundi_liik_kood ASC);
CREATE INDEX IXFK_Laud_laua_materjal_kood ON Laud (laua_materjal_kood ASC);
CREATE INDEX IXFK_Laud_Laua_seisundi_liik_kood ON Laud (laua_seisundi_liik_kood ASC);
CREATE INDEX IXFK_Laua_kategooria_omamine_Laua_kategooria_kood ON Laua_kategooria_omamine (laua_kategooria_kood ASC);
CREATE INDEX IXFK_Klient_Kliendi_seisundi_liik_kood ON Klient (kliendi_seisundi_liik_kood ASC);
CREATE INDEX IXFK_Laud_Registreerija_id ON Laud (registreerija_id ASC);
