delete from laua_kategooria_omamine;
delete from laud;
delete from tootaja;
delete from klient;
delete from isik;
delete from laua_materjal;
delete from laua_kategooria;
delete from laua_kategooria_tyyp;
delete from kliendi_seisundi_liik;
delete from laua_seisundi_liik;
delete from tootaja_seisundi_liik;
delete from isiku_seisundi_liik;
delete from amet;
delete from riik;

insert into riik (riik_kood, nimetus)values ('EST', 'Eesti');
insert into riik (riik_kood, nimetus)values ('AFG', 'Afganistaan');
insert into riik (riik_kood, nimetus)values ('RUS', 'Venemaa');
insert into riik (riik_kood, nimetus)values ('GBR', 'Suurbritannia');
insert into riik (riik_kood, nimetus)values ('ALB', 'Ahvenamaa');
insert into riik (riik_kood, nimetus)values ('LVA', 'Läti');
insert into riik (riik_kood, nimetus)values ('LTU', 'Leedu');
insert into riik (riik_kood, nimetus)values ('DEU', 'Saksamaa');
insert into riik (riik_kood, nimetus)values ('USA', 'Ameerika Ühendriigid');

insert into amet (amet_kood, nimetus, kirjeldus)values (1, 'Kokk', 'Söögi tegemine');
insert into amet (amet_kood, nimetus, kirjeldus)values (2, 'Kelner', 'Klientide teenindamine');
insert into amet (amet_kood, nimetus, kirjeldus)values (3, 'Müüja', 'Kassa teenindamine');
insert into amet (amet_kood, nimetus, kirjeldus)values (4, 'Koristaja', 'Tööpindade puhastuse operaator');
insert into amet (amet_kood, nimetus, kirjeldus)values (5, 'Juhataja', 'Vastutav isik töökoha eest');

insert into isiku_seisundi_liik (isiku_seisundi_liik_kood, nimetus)values (1, 'Elus');
insert into isiku_seisundi_liik (isiku_seisundi_liik_kood, nimetus)values (2, 'Surnud');

insert into tootaja_seisundi_liik (tootaja_seisundi_liik_kood, nimetus)values (1, 'Katseajal');
insert into tootaja_seisundi_liik (tootaja_seisundi_liik_kood, nimetus)values (2, 'Tööl');
insert into tootaja_seisundi_liik (tootaja_seisundi_liik_kood, nimetus)values (3, 'Puhkusel');
insert into tootaja_seisundi_liik (tootaja_seisundi_liik_kood, nimetus)values (4, 'Haiguslehel');
insert into tootaja_seisundi_liik (tootaja_seisundi_liik_kood, nimetus)values (5, 'Töösuhe peatatud');
insert into tootaja_seisundi_liik (tootaja_seisundi_liik_kood, nimetus)values (6, 'Töösuhe lõpetatud oma soovil');
insert into tootaja_seisundi_liik (tootaja_seisundi_liik_kood, nimetus)values (7, 'Vallandatud');

insert into laua_seisundi_liik (laua_seisundi_liik_kood, nimetus)values (1, 'Ootel');
insert into laua_seisundi_liik (laua_seisundi_liik_kood, nimetus)values (2, 'Mitteaktiivne');
insert into laua_seisundi_liik (laua_seisundi_liik_kood, nimetus)values (3, 'Aktiivne');
insert into laua_seisundi_liik (laua_seisundi_liik_kood, nimetus)values (4, 'Lõpetatud');

insert into kliendi_seisundi_liik (kliendi_seisundi_liik_kood, nimetus)values (1, 'Aktiivne');
insert into kliendi_seisundi_liik (kliendi_seisundi_liik_kood, nimetus)values (2, 'Mustas nimekirjas');

insert into laua_kategooria_tyyp (laua_kategooria_tyyp_kood, nimetus)values (1, 'Omadussõnad');
insert into laua_kategooria_tyyp (laua_kategooria_tyyp_kood, nimetus)values (2, 'Liiklus laua ümber');
insert into laua_kategooria_tyyp (laua_kategooria_tyyp_kood, nimetus)values (3, 'Vaade');

insert into laua_kategooria (laua_kategooria_kood, nimetus, laua_kategooria_tyyp_kood)values (1, 'Ilus', 1);
insert into laua_kategooria (laua_kategooria_kood, nimetus, laua_kategooria_tyyp_kood)values (2, 'Külmavõitu', 1);
insert into laua_kategooria (laua_kategooria_kood, nimetus, laua_kategooria_tyyp_kood)values (3, 'Hubane', 1);
insert into laua_kategooria (laua_kategooria_kood, nimetus, laua_kategooria_tyyp_kood)values (4, 'Palju', 2);
insert into laua_kategooria (laua_kategooria_kood, nimetus, laua_kategooria_tyyp_kood)values (5, 'Keskmiselt', 2);
insert into laua_kategooria (laua_kategooria_kood, nimetus, laua_kategooria_tyyp_kood)values (6, 'Vähe', 2);
insert into laua_kategooria (laua_kategooria_kood, nimetus, laua_kategooria_tyyp_kood)values (7, 'Ilus', 3);
insert into laua_kategooria (laua_kategooria_kood, nimetus, laua_kategooria_tyyp_kood)values (8, 'kole', 3);

insert into laua_materjal (laua_materjal_kood, nimetus)values (1, 'Puit');
insert into laua_materjal (laua_materjal_kood, nimetus)values (2, 'Klaas');
insert into laua_materjal (laua_materjal_kood, nimetus)values (3, 'Metall');
insert into laua_materjal (laua_materjal_kood, nimetus)values (4, 'Plastik');

insert into isik (isiku_id, isikukoodi_riik, isiku_seisundi_liik_kood,e_meil, isikukood, synni_kp, parool, eesnimi, perenimi, elukoht)values (1,'EST',1,'nilsemil.lille@gmail.com',3554151,'03.20.2018','parool','Nils','Nils','Rakvere');
insert into isik (isiku_id, isikukoodi_riik, isiku_seisundi_liik_kood,e_meil, isikukood, synni_kp, parool, eesnimi, perenimi, elukoht)values (2,'DEU',1,'kaspar@gmail.com',5152151,'05.01.2018','parool','Kaspar','Nils','Tallinn');
insert into isik (isiku_id, isikukoodi_riik, isiku_seisundi_liik_kood,e_meil, reg_kp,isikukood, synni_kp, parool, eesnimi, perenimi, elukoht)values (3,'RUS',1,'merje@mail.ee','09.09.2018',5125125,'05.01.2018','parool','Nils','Pajula','Keila');
insert into isik (isiku_id, isikukoodi_riik, isiku_seisundi_liik_kood,e_meil, isikukood, synni_kp, parool, eesnimi, perenimi, elukoht)values (4,'RUS',2,'maxim@max.ee',5512422,'04.01.2018','paroo','Maxim','Nils','Tallinn');
insert into isik (isiku_id, isikukoodi_riik, isiku_seisundi_liik_kood,e_meil, isikukood, synni_kp, parool, eesnimi, perenimi, elukoht)values (5,'RUS',2,'markus@ttu.ee',565122,'05.01.2018','PASSWORD','Mihkel','Muhkel','Mägilinna');
insert into isik (isiku_id, isikukoodi_riik, isiku_seisundi_liik_kood,e_meil, reg_kp,isikukood, synni_kp, parool, eesnimi, perenimi, elukoht)values (6,'USA',1,'hans@restoran.com','11.23.2018',55555555,'11.28.2017','PASSWORD','Hans','Nils','Ei tea');
insert into isik (isiku_id, isikukoodi_riik, isiku_seisundi_liik_kood,e_meil, reg_kp,isikukood, synni_kp, parool, eesnimi, perenimi, elukoht)values (7,'EST',1,'nilsemil.lille2@gmail.com','06.06.2018',3554152,'03.20.2018','parool','Nils','Nils','Rakvere');
insert into isik (isiku_id, isikukoodi_riik, isiku_seisundi_liik_kood,e_meil, reg_kp,isikukood, synni_kp, parool, eesnimi, perenimi, elukoht)values (8,'DEU',1,'kaspar2@gmail.com','05.05.2018',5152152,'05.01.2018','parool','Kaspar','Nils','Tallinn');
insert into isik (isiku_id, isikukoodi_riik, isiku_seisundi_liik_kood,e_meil, isikukood, synni_kp, parool, eesnimi, perenimi, elukoht)values (9,'RUS',1,'merje2@mail.ee',5125126,'05.01.2018','parool','Nils','Pajula','Keila');
insert into isik (isiku_id, isikukoodi_riik, isiku_seisundi_liik_kood,e_meil, isikukood, synni_kp, parool, eesnimi, perenimi, elukoht)values (10,'RUS',2,'maxim2@max.ee',5512423,'04.01.2018','paroo','Maxim','Nils','Tallinn');
insert into isik (isiku_id, isikukoodi_riik, isiku_seisundi_liik_kood,e_meil, isikukood, synni_kp, parool, eesnimi, perenimi, elukoht)values (11,'RUS',1,'markus2@ttu.ee',565123,'05.01.2018','PASSWORD','Mihkel','Muhkel','Mägilinna');

insert into tootaja (isiku_id, amet_kood, tootaja_seisundi_liik_kood,mentor) values (1,1,2,null );
insert into tootaja (isiku_id, amet_kood, tootaja_seisundi_liik_kood,mentor) values (2,3,2,null );
insert into tootaja (isiku_id, amet_kood, tootaja_seisundi_liik_kood,mentor) values (3,4,1,null);
insert into tootaja (isiku_id, amet_kood, tootaja_seisundi_liik_kood,mentor) values (4,2,3,null );
insert into tootaja (isiku_id, amet_kood, tootaja_seisundi_liik_kood,mentor) values (5,2,2,null );
insert into tootaja (isiku_id, amet_kood, tootaja_seisundi_liik_kood,mentor) values (6,1,3,3);
insert into tootaja (isiku_id, amet_kood, tootaja_seisundi_liik_kood,mentor) values (7,3,5,null );
insert into tootaja (isiku_id, amet_kood, tootaja_seisundi_liik_kood,mentor) values (8,4,4,null);
insert into tootaja (isiku_id, amet_kood, tootaja_seisundi_liik_kood,mentor) values (9,2,6,null );
insert into tootaja (isiku_id, amet_kood, tootaja_seisundi_liik_kood,mentor) values (10,2,7,null );

insert into laud (laua_kood, isiku_id, reg_kp, laua_seisundi_liik_kood,laua_materjal_kood, kohtade_arv, kommentaar)values (1,3,'05.02.2018',1,1, 4,'Laud nagu laud ikka');
insert into laud (laua_kood, isiku_id, reg_kp, laua_seisundi_liik_kood,laua_materjal_kood, kohtade_arv, kommentaar)values (2,4,'05.02.2018',3,1, 4,'Laud nagu laud ikka');
insert into laud (laua_kood, isiku_id, reg_kp, laua_seisundi_liik_kood,laua_materjal_kood, kohtade_arv, kommentaar)values (3,4,'05.02.2018',2,1, 4,'Laud nagu laud ikka');
insert into laud (laua_kood, isiku_id, reg_kp, laua_seisundi_liik_kood,laua_materjal_kood, kohtade_arv, kommentaar)values (4,1,'05.02.2018',2,2, 2,'Laud nagu laud ikka');
insert into laud (laua_kood, isiku_id, reg_kp, laua_seisundi_liik_kood,laua_materjal_kood, kohtade_arv, kommentaar)values (5,2,'05.02.2018',3,3, 2,'Laud nagu laud ikka');
insert into laud (laua_kood, isiku_id, reg_kp, laua_seisundi_liik_kood,laua_materjal_kood, kohtade_arv, kommentaar)values (6,1,'05.03.2018',3,4, 2,'Eriline,habras.');
insert into laud (laua_kood, isiku_id, reg_kp, laua_seisundi_liik_kood,laua_materjal_kood, kohtade_arv, kommentaar)values (7,9,'05.03.2018',4,3, 8,'Ruumi on ka rohkemate jaoks');
insert into laud (laua_kood, isiku_id, reg_kp, laua_seisundi_liik_kood,laua_materjal_kood, kohtade_arv, kommentaar)values (8,3,'05.02.2018',1,2, 4,'Laud nagu laud ikka');
insert into laud (laua_kood, isiku_id, reg_kp, laua_seisundi_liik_kood,laua_materjal_kood, kohtade_arv, kommentaar)values (9,5,'05.02.2018',4,3, 4,'Laud nagu laud ikka');
insert into laud (laua_kood, isiku_id, reg_kp, laua_seisundi_liik_kood,laua_materjal_kood, kohtade_arv, kommentaar)values (10,6,'05.03.2018',2,4, 2,'Eriline,habras.');
insert into laud (laua_kood, isiku_id, reg_kp, laua_seisundi_liik_kood,laua_materjal_kood, kohtade_arv, kommentaar)values (11,7,'05.03.2018',3,3, 8,'Ruumi on ka rohkemate jaoks');

insert into klient (isiku_id, on_nous_tylitamisega, kliendi_seisundi_liik_kood) values (1,FALSE,1);
insert into klient (isiku_id, on_nous_tylitamisega, kliendi_seisundi_liik_kood) values (2,TRUE,1);
insert into klient (isiku_id, on_nous_tylitamisega, kliendi_seisundi_liik_kood) values (3,FALSE,2);
insert into klient (isiku_id, on_nous_tylitamisega, kliendi_seisundi_liik_kood) values (4,FALSE,1);
insert into klient (isiku_id, on_nous_tylitamisega, kliendi_seisundi_liik_kood) values (5,TRUE,2);
insert into klient (isiku_id, on_nous_tylitamisega, kliendi_seisundi_liik_kood) values (6,FALSE,1);
insert into klient (isiku_id, on_nous_tylitamisega, kliendi_seisundi_liik_kood) values (7,FALSE,2);
insert into klient (isiku_id, on_nous_tylitamisega, kliendi_seisundi_liik_kood) values (8,TRUE,1);
insert into klient (isiku_id, on_nous_tylitamisega, kliendi_seisundi_liik_kood) values (9,FALSE,2);
insert into klient (isiku_id, on_nous_tylitamisega, kliendi_seisundi_liik_kood) values (10,FALSE,2);
insert into klient (isiku_id, on_nous_tylitamisega, kliendi_seisundi_liik_kood) values (11,TRUE,1);


insert into laua_kategooria_omamine (laua_kategooria_omamine_id, laua_kood, laua_kategooria_kood) values (1,1,1);
insert into laua_kategooria_omamine (laua_kategooria_omamine_id, laua_kood, laua_kategooria_kood) values (2,2,3);
insert into laua_kategooria_omamine (laua_kategooria_omamine_id, laua_kood, laua_kategooria_kood) values (3,3,5);
insert into laua_kategooria_omamine (laua_kategooria_omamine_id, laua_kood, laua_kategooria_kood) values (4,4,6);
insert into laua_kategooria_omamine (laua_kategooria_omamine_id, laua_kood, laua_kategooria_kood) values (5,5,4);
insert into laua_kategooria_omamine (laua_kategooria_omamine_id, laua_kood, laua_kategooria_kood) values (6,6,2);
insert into laua_kategooria_omamine (laua_kategooria_omamine_id, laua_kood, laua_kategooria_kood) values (7,7,2);
insert into laua_kategooria_omamine (laua_kategooria_omamine_id, laua_kood, laua_kategooria_kood) values (8,8,1);
insert into laua_kategooria_omamine (laua_kategooria_omamine_id, laua_kood, laua_kategooria_kood) values (9,9,2);
insert into laua_kategooria_omamine (laua_kategooria_omamine_id, laua_kood, laua_kategooria_kood) values (10,10,2);
insert into laua_kategooria_omamine (laua_kategooria_omamine_id, laua_kood, laua_kategooria_kood) values (11,11,1);
