select * from laua_kategooria_omamine;
select * from tootaja;
select * from klient;
select * from isik;
select * from laud;
select * from laua_materjal;
select * from laua_kategooria;
select * from laua_kategooria_tyyp;
select * from kliendi_seisundi_liik;
select * from laua_seisundi_liik;
select * from tootaja_seisundi_liik;
select * from isiku_seisundi_liik;
select * from amet;
select * from riik;


select * from isik INNER JOIN tootaja ON  isik.isiku_id = tootaja.isiku_id