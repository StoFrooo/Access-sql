CREATE TABLE Klienci
(
 ID_Klienta INT NOT NULL IDENTITY,
 Imie_kl NVARCHAR(50) NOT NULL,
 Nazwisko_kl NVARCHAR(50) NOT NULL,
 Adres_zamieszkania_kl NVARCHAR(50) NOT NULL,
 Nr_telefonu_kl INT NOT NULL,
 PRIMARY KEY (ID_Klienta),
)

CREATE TABLE Pracownicy
(
 ID_Pracownika INT NOT NULL IDENTITY,
 Imie_pr NVARCHAR(50) NOT NULL,
 Nazwisko_pr NVARCHAR(50) NOT NULL,
 Adres_zamieszkania_pr NVARCHAR(50) NOT NULL,
 Pensja INT NOT NULL DEFAULT '3000',
 Nr_telefonu INT NOT NULL,
 Stanowsiko NVARCHAR(50) NOT NULL,
 PRIMARY KEY (ID_Pracownika),
)

CREATE TABLE Lokalizacje
(
 ID_Lokalizacji INT NOT NULL IDENTITY,
 Adres NVARCHAR(50) NOT NULL,
 Miasto NVARCHAR(50) NOT NULL,
 Wojewodztwo NVARCHAR(50) NOT NULL,
 PRIMARY KEY(ID_Lokalizacji),
)

CREATE TABLE Marki
(
 ID_Marki INT NOT NULL IDENTITY,
 Nazwa_marki NVARCHAR(50) NOT NULL,
 PRIMARY KEY(ID_Marki),
)

CREATE TABLE Modele
(
 ID_Modelu INT NOT NULL IDENTITY,
 ID_Marki INT NOT NULL,
 Nazwa_modelu NVARCHAR(50) NOT NULL,
 PRIMARY KEY(ID_Modelu),
 FOREIGN KEY(ID_Marki) REFERENCES Marki (ID_Marki),
)

CREATE TABLE Samochody
(
 ID_Samochodu INT NOT NULL IDENTITY,
 ID_Modelu INT NOT NULL,
 ID_Lokalizacji INT NOT NULL,
 Numer_rejestracyjny NVARCHAR(50) NOT NULL UNIQUE,
 Przebieg INT NOT NULL,
 Numer_VIN NVARCHAR(50) NOT NULL,
 PRIMARY KEY(ID_Samochodu),
 FOREIGN KEY(ID_Modelu) REFERENCES Modele (ID_Modelu),
 FOREIGN KEY(ID_Lokalizacji) REFERENCES Lokalizacje (ID_Lokalizacji),
)

CREATE TABLE Wynajmy
(
 ID_Wynajmu INT NOT NULL IDENTITY,
 ID_Klienta INT NOT NULL,
 ID_Pracownika INT NOT NULL,
 ID_Rezerwacji INT NULL,
 ID_Lokalizacji INT NOT NULL,
 Koszt INT NOT NULL,
 Wynajem_od DATE NOT NULL,
 Wynajem_do DATE NULL,
 PRIMARY KEY(ID_Wynajmu),
 FOREIGN KEY(ID_Klienta) REFERENCES Klienci (ID_Klienta),
 FOREIGN KEY(ID_Pracownika) REFERENCES Pracownicy (ID_Pracownika),
 FOREIGN KEY(ID_Lokalizacji) REFERENCES Lokalizacje (ID_Lokalizacji),
)

CREATE TABLE Rezerwacje
(
 ID_Rezerwacji INT NOT NULL IDENTITY,
 ID_Lokalizacji INT NOT NULL,
 ID_Modelu INT NOT NULL,
 ID_Klienta INT NOT NULL,
 ID_Wynajmu INT NULL,
 Numer_rezerwacji INT NOT NULL,
 Rezerwacja_od DATE NOT NULL,
 Rezerwacja_do DATE NOT NULL,
 PRIMARY KEY(ID_Rezerwacji),
 FOREIGN KEY(ID_Klienta) REFERENCES Klienci (ID_Klienta),
 FOREIGN KEY(ID_Wynajmu) REFERENCES Wynajmy (ID_Wynajmu),
 FOREIGN KEY(ID_Modelu) REFERENCES Modele (ID_Modelu),
 FOREIGN KEY(ID_Lokalizacji) REFERENCES Lokalizacje (ID_Lokalizacji),
)

ALTER TABLE Wynajmy
ADD CONSTRAINT FK_RezerwacjeWynajmy
FOREIGN KEY(ID_Rezerwacji) REFERENCES Rezerwacje (ID_Rezerwacji)

CREATE TABLE Wynajmowanie_auta
(
 ID_Samochodu INT NOT NULL,
 ID_Wynajmu INT NOT NULL,
 FOREIGN KEY(ID_Samochodu) REFERENCES Samochody (ID_Samochodu),
 FOREIGN KEY(ID_Wynajmu) REFERENCES Wynajmy (ID_Wynajmu),
 UNIQUE(ID_Samochodu,ID_Wynajmu)
)

INSERT INTO Klienci
VALUES('Janusz','Tracz','ul.S³oneczna 54','765456782')
INSERT INTO Klienci
VALUES('Mateusz','Nowak','ul.D³uga 2/5','876345777')
INSERT INTO Klienci
VALUES('Bart³omiej','Bigaj','ul.Kwiecista 91','765239876')
INSERT INTO Klienci
VALUES('Beata','Knap','ul.Algierska 4','123657987')
INSERT INTO Klienci
VALUES('Arnold','W³os','ul.Bierzanowska 2','762536475')

INSERT INTO Lokalizacje
VALUES('ul.Wroc³awska 4','Gdañsk','Pomorskie')
INSERT INTO Lokalizacje
VALUES('ul.G³ówna 3','Warszawa','Mazowieckie')
INSERT INTO Lokalizacje
VALUES('ul.Dietla 2','Kraków','Ma³opolskie')

INSERT INTO Marki
VALUES('Opel')
INSERT INTO Marki
VALUES('BMW')
INSERT INTO Marki
VALUES('Citroen')
INSERT INTO Marki
VALUES('Toyota')
INSERT INTO Marki
VALUES('Audi')
INSERT INTO Marki
VALUES('Chrysler')
INSERT INTO Marki
VALUES('Renault')
INSERT INTO Marki
VALUES('Peugeot')

INSERT INTO Modele
VALUES('1','Astra')
INSERT INTO Modele
VALUES('1','Zafira')
INSERT INTO Modele
VALUES('2','X6')
INSERT INTO Modele
VALUES('2','X3')
INSERT INTO Modele
VALUES('3','C4 CACTUS')
INSERT INTO Modele
VALUES('3','C3')
INSERT INTO Modele
VALUES('4','Avensis')
INSERT INTO Modele
VALUES('5','Corolla')
INSERT INTO Modele
VALUES('6','Pacifica')
INSERT INTO Modele
VALUES('7','Megane')
INSERT INTO Modele
VALUES('7','Kadjar')
INSERT INTO Modele
VALUES('8','508')
INSERT INTO Modele
VALUES('8','308')

INSERT INTO Pracownicy
VALUES('Jerzy','Jurek','ul.Górna 12','3500','111222333','Kierownik')
INSERT INTO Pracownicy
VALUES('Maciej','Kowalski','ul.Dolna 45/8','3200','222333444','Konsultant')
INSERT INTO Pracownicy
VALUES('Dawid','Dawidowicz','ul.Krótka 9','3000','333444555','Sprzedawca')
INSERT INTO Pracownicy
VALUES('Micha³','Michalski','ul.Ma³a 2','3200','444555666','Konsultant')
INSERT INTO Pracownicy
VALUES('Patryk','Nowak','ul.Wielka 99','3200','555666777','Konsultant')
INSERT INTO Pracownicy
VALUES('Ma³gorzata','Chmura','ul.P³ynna 4','3000','234567789','Sprzedawca')

INSERT INTO Samochody
VALUES('3','1','KROJF0F','40000','IUWAHFD8EFH89WEFH')
INSERT INTO Samochody
VALUES('10','2','WA9HRU6','35000','8924FH894FGH894HF')
INSERT INTO Samochody
VALUES('13','3','GDUHFE8','28500','FWEFEFWEF2323R34F')
INSERT INTO Samochody
VALUES('9','3','KR87HF6','34760','DWDW89FHW89EFJNE8')

INSERT INTO Rezerwacje(ID_Lokalizacji,ID_Modelu,ID_Klienta,Numer_rezerwacji,Rezerwacja_od,Rezerwacja_do)
VALUES('2','4','3','458','2021-06-10','2021-06-26')
INSERT INTO Rezerwacje(ID_Lokalizacji,ID_Modelu,ID_Klienta,Numer_rezerwacji,Rezerwacja_od,Rezerwacja_do)
VALUES('3','8','1','457','2021-05-04','2021-05-20')
INSERT INTO Rezerwacje(ID_Lokalizacji,ID_Modelu,ID_Klienta,Numer_rezerwacji,Rezerwacja_od,Rezerwacja_do)
VALUES('1','12','5','456','2021-04-13','2021-04-29')
INSERT INTO Rezerwacje(ID_Lokalizacji,ID_Modelu,ID_Klienta,Numer_rezerwacji,Rezerwacja_od,Rezerwacja_do)
VALUES('2','1','4','459','2021-06-23','2021-07-11')

INSERT INTO Wynajmy(ID_Klienta,ID_Pracownika,ID_Lokalizacji,Koszt,Wynajem_od,Wynajem_do)
VALUES('2','1','2','2500','2021-06-11','2021-06-25')
INSERT INTO Wynajmy
VALUES('3','2','2','1','15000','2021-06-01','2021-06-26')
INSERT INTO Wynajmy(ID_Klienta,ID_Pracownika,ID_Lokalizacji,Koszt,Wynajem_od,Wynajem_do)
VALUES('4','6','3','8000','2021-04-06','2021-04-21')

INSERT INTO Wynajmowanie_auta
VALUES('1','1')
INSERT INTO Wynajmowanie_auta
VALUES('1','2')
INSERT INTO Wynajmowanie_auta
VALUES('1','3')
INSERT INTO Wynajmowanie_auta
VALUES('2','3')
INSERT INTO Wynajmowanie_auta
VALUES('3','2')

/* Kwerenda pobieraj¹c¹ dane z jednej tabeli. Kwerenda ma zawieraæ klauzulê WHERE oraz wykorzystywaæ funkcje wierszowe operuj¹ce na tekstach oraz operuj¹ce na datach i/lub czasie */
/* Kwerenda pobiera dane z tabeli Wynajmy, gdzie koszt wynajmu wynosi 2500 i rozpocz¹³ siê 11 czerwca*/
select * from Wynajmy where Koszt = 2500 and Wynajem_od = '2021-06-11'

/*Kwerenda ³¹cz¹c¹ dane z dwóch tabel */
/* Kwerenda ³¹cz¹ca nazwe modelu do nazwy marki z tabel Modele i Marki*/
select Nazwa_modelu, Nazwa_marki from Modele as p, Marki as g where p.ID_Marki = g.ID_Marki

/*Kwerenda ³¹cz¹c¹ dane z trzech tabel*/
/* Kwerenda ³¹cz¹ca Numer rezerwacji do nazwy modelu i nazwe modelu do nazwy marki z tabel Rezerwacje, Marki i Modele*/
select Numer_rezerwacji, Nazwa_modelu, Nazwa_marki from Rezerwacje as p left join Modele as g on p.ID_Modelu = g.ID_Modelu  left join Marki as f on g.ID_Marki = f.ID_Marki

/*•Kwerenda, która wykorzystuje grupowanie, funkcje agreguj¹ce oraz klauzulê HAVING */

select ID_pracownika, count(ID_pracownika) as Liczba_wynajmów from Wynajmy group by ID_Pracownika having count(ID_Pracownika) >= 1

/*Kwerenda, która zawiera podzapytanie zwyk³e wierszowe */
select ID_Wynajmu, Koszt from Wynajmy p where Koszt < (select AVG(Koszt) from Wynajmy g)

/*Kwerenda pobieraj¹ca dane z dwóch tabel, wykorzystuj¹ca grupowanie oraz funkcje agreguj¹ce */
select p.ID_Marki, p.Nazwa_marki, count(g.ID_marki) as Liczba_modeli from Marki as p, Modele as g where p.ID_Marki = g.ID_Marki group by p.ID_marki,p.Nazwa_marki



