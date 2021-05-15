drop database if exists advokat;
create database advokat;
use advokat;

#1 advokat vi�e klijenata, 1 klijent vi�e obrana, 1 obrana vi�e suradnika, 1 suradnik vi�e obrana

create table klijent(
	sifra int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50)
);

create table obrana(
	sifra int not null primary key auto_increment,
	klijent int,
	datum_pocetka datetime
);

create table suradnik(
	sifra int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50)
);

create table suradnik_obrana(
	sifra int not null primary key auto_increment,
	suradnik int,
	obrana int
);

alter table obrana add foreign key (klijent) references klijent(sifra);

alter table suradnik_obrana add foreign key (suradnik) references suradnik(sifra);
alter table suradnik_obrana add foreign key (obrana) references obrana(sifra);

insert into klijent(ime,prezime)
values('Zdravko','Mami�'),('Zoran','Mami�');

insert into obrana(klijent,datum_pocetka)
values(1,'2021-05-20'),(2,'2021-05-20');

insert into suradnik(ime,prezime)
values('Luka','Modri�'),('Dejan','Lovren');

insert into suradnik_obrana(suradnik,obrana)
values(1,2),(2,1);