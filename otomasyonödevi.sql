create database otomasyonödevi
use otomasyonödevi;

create table kitaplar(
Kitapİd int,
KitapAdi varchar(255),
YayinTarihi varchar(255),
SayfaSayisi varchar(255),
Yayineviİd int,
Yazarİd int,
primary key(Kitapİd)
);
INSERT INTO kitaplar(Kitapİd, KitapAdi, YayinTarihi,SayfaSayisi,Yayineviİd,Yazarİd)
VALUES (1,'Ben Kirke','2019','408',1,1),
(2,'Acımasızlar','2019','416',2,2),
(3,'Hayvan Çiftliği','1945','112',3,3);



create table yayinevi(
YayinEviİd int,
YayinEviAdi varchar(255),
Adresİd int,
primary key(YayinEviİd)
);
INSERT INTO yayinevi(YayinEviİd, YayinEviAdi,Adresİd)
VALUES (1,'İthaki Yayınları',1),
(2,' Ephesus Yayınları',2),
(3,' Can Yayınları',3);


create table yazarlar(
Yazarİd int,
YazarAd varchar(255),
YazarSoyad varchar(255),
Kitapİd int,
primary key(Yazarİd)
);
INSERT INTO yazarlar(Yazarİd, YazarAd,YazarSoyad,Kitapİd)
VALUES (1,'Madeline ','Miller',1),
(2,'J. J. ','McAvoy',2),
(3,' George ','Orwell',3);



create table kategoriler(
İd int,
KategoriAdi  varchar(255),
primary key(İd)
);
INSERT INTO kategoriler(İd,KategoriAdi)
VALUES(1,'Tarihi Kurgu'),
(2,'Aşk Romanı');


create table kutuphane(
Kutuphaneİd int,
KutuphaneAd varchar(255),
Kitapİd int,
Adresİd int,
primary key(Kutuphaneİd)
);
INSERT INTO kutuphane(Kutuphaneİd, KutuphaneAd,Kitapİd,Adresİd)
VALUES (1,'ÖZYİĞİT Kütüphanesi',1,1),
(2,'Sarıyer Kütüphanesi',3,2);

create table uyeler(
Uyeİd int,
Ad varchar(255),
Soyad varchar(255),
Cinsiyet varchar(255),
Telefon varchar(255),
Eposta varchar(255),
Adresİd int,
primary key(Uyeİd)
);
INSERT INTO uyeler(Uyeİd, Ad,Soyad,Cinsiyet,Telefon,Eposta,Adresİd)
VALUES (1,'Emre','Kamilçelebi','Erkek','05000000037','deneme@gmail.com',1),
(2,'Emirhan','Ünal','Erkek','05000003737','test@gmail.com',1);


create table adres(
Adresİd int,
Cadde varchar(255),
Sokak varchar(255),
Mahalle varchar(255),
BinaNo varchar(255),
Kat varchar(255),
Ilce varchar(255),
Il varchar(255),
PostaKodu varchar(255),
primary key(AdresId)
);
INSERT INTO adres(Adresİd, Cadde,Sokak,Mahalle,BinaNo,Kat,Ilce,Il,PostaKodu)
VALUES (1,'AhemtPriştina','Karadeniz','Yeşilpınar','37','1','Hanönü','Kastamonu','37377'),
(2,'Arabayolu','Yazlık','Cumhuriyer','14','1','Sarıyer','İstanbul','34457');


create table alımsatım(
İd int,
Satimtarihi varchar(255),
Alimtarihi varchar(255),
Kitapİd int,
Uyeİd int,
Kutuphaneİd int,
primary key(İd)
);
INSERT INTO alımsatım(İd, Satimtarihi,Alimtarihi,Kitapİd,Uyeİd,Kutuphaneİd)
VALUES (1,'21/04/2021','12/05/2021',1,1,2),
(2,'05/03/2021','16/04/2021',2,1,2);

create table satıs(
İd int,
Satimtarihi varchar(255),
Kitapİd int,
Uyeİd int,
Kutuphaneİd int,
primary key(İd)
);
INSERT INTO satıs(İd, Satimtarihi,Kitapİd,Uyeİd,Kutuphaneİd)
VALUES (1,'12/05/2021',1,1,2),
(2,'16/04/2021',2,1,2);

select*from adres;

SELECT uyeler.Uyeİd,Ad,Soyad ,adres.Sokak,Mahalle,BinaNo,İlce,İl
FROM uyeler
INNER JOIN adres
ON uyeler.Uyeİd = adres.Adresİd;


SELECT kutuphane.KutuphaneAd,adres.Cadde,Sokak,Mahalle,BinaNo,Ilce
FROM kutuphane
INNER JOIN adres
ON kutuphane.Kutuphaneİd = adres.Adresİd;

SELECT kutuphane.KutuphaneAd,kitaplar.KitapAdi,SayfaSayisi
FROM kutuphane
INNER JOIN kitaplar
ON kutuphane.Kutuphaneİd = kitaplar.Kitapİd;

SELECT yazarlar.YazarAd,YazarSoyad,kitaplar.KitapAdi,YayinTarihi
FROM yazarlar
INNER JOIN kitaplar
ON yazarlar.Yazarİd = kitaplar.Kitapİd;

SELECT yayinevi.YayinEviAdi,adres.Cadde,Sokak,Mahalle,Ilce
FROM yayinevi
INNER JOIN adres
ON yayinevi.YayinEviİd = adres.Adresİd;


SELECT kitaplar.KitapAdi,YayinTarihi,yayinevi.YayinEviAdi
FROM kitaplar
INNER JOIN yayinevi 
ON kitaplar.Kitapİd = yayinevi.YayinEviİd;

SELECT alımsatım.Satimtarihi,Alimtarihi,Uyeİd,kitaplar.KitapAdi
FROM alımsatım
INNER JOIN kitaplar
ON alımsatım.İd = kitaplar.Kitapİd;

SELECT alımsatım.Satimtarihi,Alimtarihi,Kitapİd,uyeler.Ad,Soyad,Eposta
FROM alımsatım
INNER JOIN uyeler
ON alımsatım.İd = uyeler.Uyeİd;

SELECT alımsatım.Satimtarihi,Alimtarihi,kutuphane.KutuphaneAd
FROM alımsatım
INNER JOIN kutuphane
ON alımsatım.İd = kutuphane.Kutuphaneİd;

SELECT satıs.Satimtarihi,Uyeİd,kitaplar.KitapAdi
FROM satıs
INNER JOIN kitaplar
ON satıs.İd = kitaplar.Kitapİd;


