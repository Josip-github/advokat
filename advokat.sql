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