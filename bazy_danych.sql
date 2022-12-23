#zad 1
create table andreievb.kreatura as select*from wikingowie.kreatura;
create table andreievb.zasob as select*from wikingowie.zasob;
create table andreievb.ekwipunek as select*from wikingowie.ekwipunek;
select*from zasob;
select *from zasob where rodzaj='jedzenia';
select idZasobu, ilosc from ekwipunek where idKreatury in (1,3,5);

#zad 2
select*from kreatura where rodzaj !='wiedzma'and udzwig >='50';
select*from zasob where waga between 2 and 5;

#zad 3
select dataPozyskania, year ( dataPozyskania),month ( dataPozyskania),monthname ( dataPozyskania),day( dataPozyskania) from zasob;
select*from zasob where month ( dataPozyskania)in(5,9);
select*from zasob where rodzaj is not null;
#order by wiek asc ,rodzaj desc;
#order by 1asc, 2 desc;
select*from kreatura order by dataUr limit 5;

#zad4 
#pkt1
select distinct rodzaj zasob;
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

#pkt2 
select k.nazwa,z.nazwa from wikingowie.kreatura k inner join wikingowie.ekwipunek e inner join wikingowie.zasob z on wikingowie.z.idZasobu = wikingowie.e.idZasobu on wikingowie.k.idKreatury=wikingowie.e.idKreatury;

#pkt3
select * from kreatura;
#zadania4
SELECT kreatura.nazwa, YEAR(kreatura.dataUr) AS rokUr, zasob.idZasobu, zasob.nazwa from kreatura
CROSS JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury JOIN zasob ON zasob.idZasobu = ekwipunek.idZasobu HAVING rokUr > 1670 AND rokUr < 1680;
SELECT kreatura.nazwa, zasob.idZasobu, zasob.rodzaj FROM kreatura  JOIN ekwipunek ON ekwipunek.idKreatury = kreatura.idKreatury LEFT JOIN zasob ON zasob.idZasobu = ekwipunek.idZasobu HAVING rodzaj='jedzenie' ORDER BY kreatura.dataUr ASC  LIMIT 5;
SELECT e.nazwa, m.nazwa, e.idKreatury, m.idKreatury FROM kreatura e INNER join kreatura m ON (e.idKreatury - m.idKreatury) = 5;
#zadania 4
#pkt 1
select * from kreatura.nazwa, year (kreatura.dataUr)as rokUr,zasob.idZasobu ,zasob.nazwa from kreatura join ekwipunek on kreatura.iaKreatury =ekwipunek.idKreatury join zasob on zasob.idKreatury =ekwipunek.idZasobu having rokUr > 1670 and rokUr <1680;
#pkt 2
select kreatura.nazwa, zasob.idZasobu, zasob.rodzaj from kreatura join ekwipunek on ekwipunek.idKreatury=kreatur.idKreatury left join zasob on zasob.idZasobu=ekwipunek.idZasobu having rodzaj='jedzenie'order by kreatura.dataUr asc limit 5;
select * from kreatura JOIN kreatura on k1.idKreatury=k2.idKreatury; 
select e.nazwa,m.nazwa,e.idKreatury,m.idKraury from kreatura e inner join kreatura m on (e.idkreatury - m.idKreatury)=5;

#zadania 5
#pkt 1
select k.rodzaj , sum(e.ilosc*z.waga)/count(distinct (k.nazwa))as srednia_waga from kreatura k join ekwipunek e on k.idKreatury =e.idKreatury join zasob z on e.idZasobu=z.idZasobu where k.rodzaj not in('malpa','waz') group by k.rodzaj; 
#pkt 2
select k.rodzaj ,max(k.dataUr), min(dataUr) from kreatura k group by k.rodzaj;
#lub uzic UNION
select nazwa from kreatura k where k.rodzaj='wiking'
union 
select nazwa from kreatura k where k.rodzaj='wiking';

#lab7w
#zadania 1
#pkt1
CREATE TABLE andreievb.kreatura2 AS SELECT*FROM wikingowie.kreatura;
CREATE TABLE andreievb.uczestnicy AS SELECT*FROM wikingowie.uczestnicy;
CREATE TABLE andreievb.etapy_wyprawy AS SELECT*FROM wikingowie.etapy_wyprawy;
CREATE TABLE andreievb.sektor AS SELECT*FROM wikingowie.sektor;
CREATE TABLE andreievb.wyprawa AS SELECT*FROM wikingowie.wyprawa;

SELECT nazwa FROM kreatura LEFT JOIN uczestnicy on kreatura.idKreatury=uczestnicy.id_uczestnika WHERE uczestnicy.id_uczestnika IS NULL GROUP BY nazwa;
#pkt2
#podzapitania lub left join
select idKreatury from kreatura;
select id_uczestnika from uczestnicy;
select * from uczestnicy u left join kreatura k on u.id_uczestnika =k.idKreatury;
select*from kreatura k left join uczestnicy u on u.id_uczestnika =k.idKreatury where u.id_uczestnika is null;
#pkt3
select w.nazwa ,sum(e.ilosc)from wyprawa w inner join uczestnicy u on w.id_wyprawy =u.id_wyprawy inner join ekwipunek e on u.id_uczestnika =e.idKreatury group by w.id_wyprawy;
#zadania 2
#pkt1
select w.nazwa ,count(u.id_uczestnika) ,group_concat(k.nazwa)from wyprawa w join uczestnicy u on u.id_wyprawy=w.id_wyprawy join kreatura k on k.idKreatury =u.id_uczestika group by w.id_wyprawy;
#pkt2
select w.nazwa, w.data_rozpoczecia,k.nazwa as kierownik,ew.kolejnosc,s.nazwa from etapy_wyprawy ew join sektor s on ew.sektor =s.id_sektora join wyprawa w on w.id_wyprawy=ew.idWyprawy join kreatura k on k.idKreatury=w.kierownik order by w.data_rozpoczecia desc , ew.kolejnosc asc; 

#zadania 3
#pkt1
select s.nazwa ,count(ew.sektor)from sektor s left join etapy_wyprawy ew on s.id_sektora=ew.sektor group by s.id_sektora;
#pkt2
select nazwa, if(count(etapy_wyprawy.idWyprawy)>0,count(etapy_wyprawy.idWyprawy),'zero')from sektor left join etapy_wyprawy on etapy_wyprawy.sektor =id_sektora group by nazwa; 
SELECT k.nazwa, CASE WHEN COUNT(u.id_uczestnika) > 0 THEN 'bral udzial w wyprawie'  ELSE 'nie bral udzialu w wyprawie' END as czy_bral_udzial FROM kreatura k LEFT JOIN uczestnicy u ON u.id_uczestnika=k.idKreatury GROUP BY k.nazwa;
#zadania 4
#pkt 1
Select w.nazwa, sum(length(ew.dziennik)) dlugosc from wyprawa w join etapy_wyprawy ew on w.id_wyprawy=ew.idWyprawy group by w.nazwa having dlugosc<400;
#pkt 2
SELECT w.nazwa, SUM(z.waga*e.ilosc)/COUNT(u.id_uczestnika) AS sr_waga FROM wyprawa w INNER JOIN uczestnicy u ON w.id_wyprawy=u.id_wyprawy INNER JOIN kreatura k ON u.id_uczestnika=k.idKreatury INNER JOIN ekwipunek e ON e.idKreatury=k.idKreatury INNER JOIN zasob z ON z.idZasobu=e.idZasobu GROUP BY w.nazwa;

#zadania 5

select k.nazwa, w.nazwa, datediff(data_rozpoczecia, dataUr)
from kreatura k join uczestnicy u
ON u.id_uczestnika=k.idKreatury join wyprawa w
ON w.id_wyprawy=u.id_wyprawy join etapy_wyprawy ew 
ON ew.idWyprawy=w.id_wyprawy join sektor s 
ON s.id_sektora=ew.sektor WHERE s.nazwa="Chatka dziadka";