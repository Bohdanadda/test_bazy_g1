#zad 1 
create table andreievb.kreatura as select*from wikingowie.kreatura;
create table andreievb.zasoby as select*from wikingowie.kreatura;
create table andreievb.ekwipunek as select*from wikingowie.ekwipunek;
select*from zasob;
SELECT*FROM zasob WHERE rodzaj='jedzenie';
SELECT idZasobu, ilosc FROM ekwipunek WHERE idKreatury IN (1,3,5);

#zad 2
SELECT*FROM kreatura WHERE rodzaj != 'wiedzma' AND udzwig >= '50';
SELECT*FROM zasob WHERE waga BETWEEN 2 AND 5;
SELECT*FROM kreatura WHERE nazwa LIKE '%or%' AND udzwig BETWEEN 30 AND 70;

#zad 3
select dataPozyskania, year ( dataPozyskania),month ( dataPozyskania),monthname ( dataPozyskania),day( dataPozyskania) from zasob;
select*from zasob where month ( dataPozyskania)in(5,9);
select*from zasob where rodzaj is not null;
#order by wiek asc ,rodzaj desc;
#order by 1asc, 2 desc;
select*from kreatura order by dataUr limit 5;

#zad 4
#pkt 1
select distinct rodzaj from zawob;
select distinct nazwa, dataPozyskania from zasob;
select distinct (rodzaj) from zasob;
#pkt2
#kontakt()
select concat(nazwa,rodzaj)from kreatura;
select concat('nazywam się',nazwa)from kreatura;
#pkt 3
select nazwa,ilosc *waga, dataPozyskania from zasob where year (dataPozyskania)between 2000 and 2007;
#zad5
select nazwa , waga *0.7 as 'netto',waga *0.3 as 'odpadki'from zasob;
select*from zasob where rodzaj is null;
select distinct nazwa,rodzaj from zasob where nazwa like 'Ba%' or nazwa like '%os%' order by nazwa;
select*from zasob;

#lab 6
select sum(udzwig)from kreatura; #suma 
select avg(udzwig)from kreatura; #srednia wartosc 
select max(udzwig)from kreatura; #max 
select min(udzwig)from kreatura; #min
select count(*)from kreatura; #ilosc rekordow 
#pkt1 
select avg(waga)from kreatura where rodzaj='wiking';
#pkt2
select avg(waga),count(*) from kreatura group by rodzaj;
#pkt3 
select avg(dataUr) from kreatura where idKreatury;
select rodzaj,avg(year(now())-year (dataUr))as sredni_wiek
from kreatura group by rodzaj;

select now();
select curdate();
#zadania 2
#pkt1
select nazwa,rodzaj,sum(waga*ilosc)from zasob group by nazwa, rodzaj with rollup order by rodzaj;
select year (dataPozyskania)as rok, month (dataPozyskania),count(*) from zasob group by rok, miesianc with rollup;
#pkt2
#having filtr dla kolumn agregowanych po agregacji; 
select rodzaj, count(nazwa)from kreatura group by rodzaj having count(nazwa)>1;
select nazwa, avg(waga)from zasob group by nazwa having avg(waga)>10 and sum(ilosc)>=4; 
select nazwa ,avg(waga),sum(ilosc)from zasob group by nazwa;
#pkt 3
select count(*)from zasob where rodzaj='jedzenia';

#zadania 3
#pkt1
select * from kreatura , ekwipunek where kreatura.idKreatury =ekwipunek.idKreatury;
select k.nazwa, e.ilosc, e.idZasobu from kreatura k inner join ekwipunek e inner join zasob z on z.idZasobu=e.idZasobu on k.idKreatury=e.idKreatury;

select*from kreatura k left join ekwipunek e on k.idKreatury=e.idKreatury where e.idEkwipunku is not null;

#podzapitanie
select idKreatury from kreatura where idKreatury not in(select distinct idKreatury from ekwipunek where idKreatury);