use Movie_DB;

INSERT INTO Rodzaje_umow (Nazwa_rodzaju)
VALUES
('Umowa na wyst¹pienie w filmie'),
('Umowa na wyre¿yserowanie filmu'),
('Umowa na napisanie scenariusza'),
('Umowa na filmowanie'),
('Umowa na stworzenie œcie¿ki dŸwiêkowej'),
('Umowa na efekty specjalne'),
('Umowa na dystrybucjê filmu'),
('Umowa na reprezentacjê artysty'),
('Umowa na zaprojektowanie kostiumów do filmu'),
('Umowa na zarz¹dzanie produkcj¹ filmow¹'),
('Umowa na wynajem lokacji'),
('Umowa o tworzenie animacji'),
('Umowa o bycie aktorem g³osowym'),
('Umowa na zarz¹dzanie zasobami i bud¿etem produkcji');

INSERT INTO Posady (Nazwa_posady)
VALUES
('Aktor'),
('Re¿yser filmowy'),
('Operator kamery'),
('Kompozytor œcie¿ki dŸwiêkowej'),
('Grafik komputerowy'),
('Producent wykonawczy'),
('Agent aktora'),
('Kierownik produkcji'),
('Kostiumograf'),
('Scenarzysta'),
('Inne');

INSERT INTO Gatunki (Nazwa_Gatunku)
VALUES
('Akcja'),
('Komedia'),
('Dramat'),
('Horror'),
('Science Fiction'),
('Romans'),
('Thriller'),
('Fantasy'),
('Animacja'),
('Dokumentalny');

INSERT INTO Tozsamosc_plciowa (Nazwa_tozsamosci_plciowej)
VALUES
('Mê¿czyzna'),
('Kobieta'),
('Transgender - Kobieta'),
('Transgender - Mê¿czyzna'),
('Niebinarna'),
('Genderfluid'),
('Bigender'),
('Agender'),
('Demigirl'),
('Demiboy'),
('P³eæ nieokreœlona');

INSERT INTO Organy_nagradzajace (Nazwa_organa_nagradzajacego, Aktywna, Rok_zalozenia)
VALUES 
('Oscar Academy', 1, 1927),
('Festiwal Filmowy w Cannes', 1, 1946),
('BAFTA', 1, 1947),
('Saturn Awards', 1, 1972),
('Venice Film Festival', 1, 1932),
('Berlin International Film Festival', 1, 1951),
('Golden Raspberry Awards', 1, 1980),
('MTV Movie & TV Awards', 1, 1992),
('Critics Choice Movie Awards', 1, 1995),
('American Film Manufacturing Company', 0, 1910),
('Selig Polyscope Company', 0, 1896);

INSERT INTO Filmy (ID_Gatunku, Budzet, Tytul, Data_Premiery_USA, Data_Premiery_Swiat, Opis)
VALUES
(1, 5000000.00, 'Zemsta Akcji', '2019-07-15', '2019-07-21', 'Ekscytuj¹cy film akcji o tajnym agencie walcz¹cym ze œwiatowymi zagro¿eniami.'),
(2, 8000000.00, 'K³opoty Komedii', '2018-04-10', '2018-05-01', 'Komiczne perypetie grupy przyjació³ zmuszonych do przetrwania w œwiecie chaosu.'),
(3, 3500000.00, 'Los Dramatu', '2019-09-05', '2019-09-10', 'Wzruszaj¹ca historia o ¿yciowych wyborach i konsekwencjach.'),
(4, 6000000.00, 'Nocny Strach', '2021-11-20', '2021-12-15', 'Przera¿aj¹cy horror, który zaprowadzi Ciê do najciemniejszych zakamarków strachu.'),
(5, 4500000.00, 'Kosmiczna Opowieœæ', '2019-02-28', '2019-03-15', 'Epicka podró¿ w kosmosie, gdzie nauka spotyka siê z nieznanym.'),
(7, 7000000.00, 'Napiêcie Thrillera', '2022-06-18', '2022-07-05', 'Niesamowita opowieœæ o œledztwie prowadzonym przez agenta federalnego.'),
(8, 5500000.00, 'Zaklête Królestwo', '2018-08-10', '2018-08-25', 'Fantastyczna animowana podró¿ w krainê magii i przygód.'),
(10, 4800000.00, 'Historia Ludzi', '2016-01-05', '2016-01-20', 'Porywaj¹cy film dokumentalny o niezwyk³ych losach zwyk³ych ludzi.'),
(4, 5200000.00, 'Nocny Koszmar', '2016-03-30', '2016-04-20', 'Przera¿aj¹cy horror, w którym rzeczywistoœæ zlewa siê z koszmarami.'),
(8, 6700000.00, 'Magiczna Przygoda', '2023-10-12', '2023-10-30', 'Fantasy o m³odym czarodzieju, który odkrywa moc przyjaŸni i mi³oœci.'),
(3, 5200000.00, 'Sekretne Tajemnice', '2018-07-28', '2018-08-10', 'Dramatyczne spojrzenie na ¿ycie ludzi w poszukiwaniu prawdy i sensu.'),
(2, 4300000.00, 'Szlachetna Zabawa', '2021-04-05', '2021-04-20', 'Radosna komedia o przygodach grupy przyjació³ w staro¿ytnym zamku.'),
(4, 5500000.00, 'Mroczne Pocz¹tki', '2023-06-02', '2023-06-15', 'Tajemnicza opowieœæ o losach bohaterów w œwiecie fantasy.'),
(9, 6200000.00, 'Nadzieja dla Œwiata', '2020-09-20', '2020-10-05', 'Intryguj¹ca historia o walce dobra ze z³em w przysz³oœci.'),
(6, 5700000.00, 'Mi³oœæ w Sercach', '2013-12-05', '2013-12-20', 'Romantyczna opowieœæ o mi³oœci trwaj¹cej przez lata i pokolenia.'),
(7, 5000000.00, 'Zagubiona Pamiêæ', '2010-03-10', '2010-03-25', 'Thriller z w¹tkiem szpiegowskim, gdzie g³ówny bohater próbuje odkryæ swoj¹ to¿samoœæ.'),
(9, 7000000.00, 'Œwiat³o Ufnoœci', '2022-05-20', '2022-06-05', 'Animowany film o przygodach grupy bohaterów w magicznym œwiecie.'),
(10, 4000000.00, 'Kroniki Nauki', '2022-09-01', '2022-09-20', 'Dokumentalny film przedstawiaj¹cy najnowsze osi¹gniêcia w nauce i technologii.'),
(4, 6500000.00, 'Nocne Przera¿enie', '2021-11-12', '2021-12-01', 'Horror, który przenosi widza w mroczne i upiorne zak¹tki ludzkiego umys³u.'),
(6, 4800000.00, 'Spacer Mi³oœci', '2020-07-30', '2020-08-15', 'Romantyczna komedia o przypadkowym spotkaniu dwóch osób, które zmienia ich ¿ycie.'),
(5, 5500000.00, 'Ostatnia Nadzieja', '2019-12-05', '2019-12-20', 'Science fiction, które pokazuje próbê ratowania œwiata przed zag³ad¹.'),
(8, 4200000.00, 'Zaklête Tajemnice', '2018-08-22', '2018-09-10', 'Fantastyczna opowieœæ o magicznych moce, które zmieniaj¹ œwiat.');

--INSERT INTO Filmy (Gatunek, Budzet, Tytul, Data_Premiery_USA, Data_Premiery_Swiat, Opis)
--VALUES
--('Akcja', 5000000.00, 'Zemsta Akcji', '2019-07-15', '2019-07-21', 'Ekscytuj¹cy film akcji o tajnym agencie walcz¹cym ze œwiatowymi zagro¿eniami.'),
--('Komedia', 8000000.00, 'K³opoty Komedii', '2018-04-10', '2018-05-01', 'Komiczne perypetie grupy przyjació³ zmuszonych do przetrwania w œwiecie chaosu.'),
--('Dramat', 3500000.00, 'Los Dramatu', '2019-09-05', '2019-09-10', 'Wzruszaj¹ca historia o ¿yciowych wyborach i konsekwencjach.'),
--('Horror', 6000000.00, 'Nocny Strach', '2021-11-20', '2021-12-15', 'Przera¿aj¹cy horror, który zaprowadzi Ciê do najciemniejszych zakamarków strachu.'),
--('Science Fiction', 4500000.00, 'Kosmiczna Opowieœæ', '2019-02-28', '2019-03-15', 'Epicka podró¿ w kosmosie, gdzie nauka spotyka siê z nieznanym.'),
--('Thriller', 7000000.00, 'Napiêcie Thrillera', '2022-06-18', '2022-07-05', 'Niesamowita opowieœæ o œledztwie prowadzonym przez agenta federalnego.'),
--('Fantasy', 5500000.00, 'Zaklête Królestwo', '2018-08-10', '2018-08-25', 'Fantastyczna animowana podró¿ w krainê magii i przygód.'),
--('Dokumentalny', 4800000.00, 'Historia Ludzi', '2016-01-05', '2016-01-20', 'Porywaj¹cy film dokumentalny o niezwyk³ych losach zwyk³ych ludzi.'),
--('Horror', 5200000.00, 'Nocny Koszmar', '2016-03-30', '2016-04-20', 'Przera¿aj¹cy horror, w którym rzeczywistoœæ zlewa siê z koszmarami.'),
--('Fantasy', 6700000.00, 'Magiczna Przygoda', '2023-10-12', '2023-10-30', 'Fantasy o m³odym czarodzieju, który odkrywa moc przyjaŸni i mi³oœci.'),
--('Dramat', 5200000.00, 'Sekretne Tajemnice', '2018-07-28', '2018-08-10', 'Dramatyczne spojrzenie na ¿ycie ludzi w poszukiwaniu prawdy i sensu.'),
--('Komedia', 4300000.00, 'Szlachetna Zabawa', '2021-04-05', '2021-04-20', 'Radosna komedia o przygodach grupy przyjació³ w staro¿ytnym zamku.'),
--('Horror', 5500000.00, 'Mroczne Pocz¹tki', '2023-06-02', '2023-06-15', 'Tajemnicza opowieœæ o losach bohaterów w œwiecie fantasy.'),
--('Animacja', 6200000.00, 'Nadzieja dla Œwiata', '2020-09-20', '2020-10-05', 'Intryguj¹ca historia o walce dobra ze z³em w przysz³oœci.'),
--('Romans', 5700000.00, 'Mi³oœæ w Sercach', '2013-12-05', '2013-12-20', 'Romantyczna opowieœæ o mi³oœci trwaj¹cej przez lata i pokolenia.'),
--('Thriller', 5000000.00, 'Zagubiona Pamiêæ', '2010-03-10', '2010-03-25', 'Thriller z w¹tkiem szpiegowskim, gdzie g³ówny bohater próbuje odkryæ swoj¹ to¿samoœæ.'),
--('Animacja', 7000000.00, 'Œwiat³o Ufnoœci', '2022-05-20', '2022-06-05', 'Animowany film o przygodach grupy bohaterów w magicznym œwiecie.'),
--('Dokumentalny', 4000000.00, 'Kroniki Nauki', '2022-09-01', '2022-09-20', 'Dokumentalny film przedstawiaj¹cy najnowsze osi¹gniêcia w nauce i technologii.'),
--('Horror', 6500000.00, 'Nocne Przera¿enie', '2021-11-12', '2021-12-01', 'Horror, który przenosi widza w mroczne i upiorne zak¹tki ludzkiego umys³u.'),
--('Romans', 4800000.00, 'Spacer Mi³oœci', '2020-07-30', '2020-08-15', 'Romantyczna komedia o przypadkowym spotkaniu dwóch osób, które zmienia ich ¿ycie.'),
--('Science Fiction', 5500000.00, 'Ostatnia Nadzieja', '2019-12-05', '2019-12-20', 'Science fiction, które pokazuje próbê ratowania œwiata przed zag³ad¹.'),
--('Fantasy', 4200000.00, 'Zaklête Tajemnice', '2018-08-22', '2018-09-10', 'Fantastyczna opowieœæ o magicznych moce, które zmieniaj¹ œwiat.');

INSERT INTO Miesieczny_przychod (ID_Filmu, Data, Wartosc_przychodu)
VALUES 
(1, '2019-07-01', 150000),
(1, '2019-08-01', 140000),
(1, '2019-09-01', 130000),
			 
(2, '2018-04-01', 160000),
(2, '2018-05-01', 150000),
(2, '2018-06-01', 140000),
			 
(3, '2019-09-01', 35000),
(3, '2019-10-01', 33000),
(3, '2019-11-01', 31000),
			 
(4, '2021-11-01', 60000),
(4, '2021-12-01', 58000),
(4, '2022-01-01', 55000),
			 
(5, '2019-02-01', 45000),
(5, '2019-03-01', 43000),
(5, '2019-04-01', 41000),
			 
(6, '2022-06-01', 70000),
(6, '2022-07-01', 68000),
(6, '2022-08-01', 65000),
			 
(7, '2018-08-01', 55000),
(7, '2018-09-01', 53000),
(7, '2018-10-01', 51000),
			 
(8, '2016-01-01', 48000),
(8, '2016-02-01', 46000),
(8, '2016-03-01', 44000),
			 
(9, '2016-03-01', 52000),
(9, '2016-04-01', 50000),
(9, '2016-05-01', 48000),

(10, '2023-10-01', 65000),
(10, '2023-11-01', 63000),
(10, '2023-12-01', 67000),
			  
(11, '2018-07-01', 55000),
(11, '2018-08-01', 53000),
(11, '2018-09-01', 51000),
			  
(12, '2021-04-01', 42000),
(12, '2021-05-01', 40000),
(12, '2021-06-01', 38000),
			  
(13, '2023-06-01', 68000),
(13, '2023-07-01', 66000),
(13, '2023-08-01', 64000),
			  
(14, '2020-09-01', 48000),
(14, '2020-10-01', 46000),
(14, '2020-11-01', 44000),
			  
(15, '2013-12-01', 52000),
(15, '2014-01-01', 50000),
(15, '2014-02-01', 48000),
			  
(16, '2010-03-01', 67000),
(16, '2010-04-01', 65000),
(16, '2010-05-01', 63000),
			  
(17, '2022-05-01', 55000),
(17, '2022-05-01', 53000),
(17, '2022-05-01', 51000),
			  
(18, '2022-09-01', 42000),
(18, '2022-10-01', 40000),
(18, '2022-11-01', 38000),
			  
(19, '2021-11-01', 68000),
(19, '2021-12-01', 66000),
(19, '2022-01-01', 64000),
			  
(20, '2020-07-01', 75000),
(20, '2020-08-01', 73000),
(20, '2020-09-01', 71000),
			  
(21, '2019-12-01', 48000),
(21, '2020-01-01', 46000),
(21, '2020-02-01', 44000),
			  
(22, '2018-08-01', 52000),
(22, '2018-09-01', 50000),
(22, '2018-10-01', 48000);

INSERT INTO Osoby (ID_Tozsamosci_P³ciowej, Imie, Nazwisko, Narodowosc, Data_Urodzenia, Data_Smierci, Poczatek_kariery, Koniec_kariery, jest_aktorem, Aktywny_kontrakt)
VALUES
(1, 'John', 'Doe', 'Amerykañska', '1980-05-15', NULL, '2008-01-01', NULL, 0, 0),
(2, 'Emily', 'Johnson', 'Brytyjska', '1985-08-20', NULL, '2008-01-01', NULL, 0, 0),
(1, 'Alex', 'Smith', 'Bu³garska', '1985-03-10', NULL, '2009-06-01', NULL, 0, 0),
(2, 'Maria', 'Garcia', 'Polska', '1988-11-28', NULL, '2007-04-01', NULL, 0, 0),
(1, 'Mohammed', 'Ali', 'Amerykañska', '1988-07-07', NULL, '2008-10-15', NULL, 0, 1),
(2, 'Marta', 'Kowalska', 'Polska', '1993-09-12', NULL, '2001-03-01', NULL, 0, 1),
(1, 'Javier', 'Lopez', 'Amerykañska', '1983-12-18', NULL, '2005-07-01', NULL, 0, 1),
(2, 'Sophie', 'Müller', 'Bu³garska', '1967-06-30', NULL, '2005-05-01', NULL, 0, 1),
(3, 'Aya', 'Tanaka', 'Amerykañska', '1974-04-22', NULL, '2004-08-01', NULL, 0, 1),
(4, 'Li', 'Wei', 'Chiñska', '1998-01-25', NULL, '2003-02-01', NULL, 1, 1),
(1, 'David', 'Lee', 'Bu³garska', '1996-11-12', NULL, '2003-06-01', NULL, 1, 1),
(2, 'Elena', 'Garcia', 'Amerykañska', '1990-04-28', NULL, '2003-03-05', NULL, 1, 0),
(1, 'Daniel', 'Kim', 'Koreañska', '1987-02-19', NULL, '2008-09-10', NULL, 1, 0),
(2, 'Anna', 'Nowak', 'Polska', '1998-08-15', NULL, '2007-12-01', NULL, 1, 1),
(1, 'Ricardo', 'Silva', 'Bu³garska', '1993-07-30', NULL, '2005-05-20', NULL, 1, 0),
(2, 'Olivia', 'Müller', 'Bu³garska', '1985-06-25', NULL, '2007-04-15', NULL, 1, 0),
(1, 'Lucas', 'Martin', 'Polska', '1989-03-10', NULL, '2002-01-01', NULL, 1, 1),
(2, 'Sophia', 'Smith', 'Amerykañska', '1995-10-18', NULL, '2002-09-01', NULL, 1, 0),
(3, 'Yuki', 'Yamamoto', 'Amerykañska', '1997-12-05', NULL, '2002-07-01', NULL, 1, 1),
(4, 'Chen', 'Wang', 'Bu³garska', '1990-09-22', NULL, '2003-12-20', NULL, 1, 0),
(1, 'Julia', 'Fernandez', 'Amerykañska', '1992-04-10', NULL, '1999-06-15', NULL, 1, 0),
(2, 'Adam', 'Johnson', 'Polska', '1986-08-30', NULL, '2008-03-01', NULL, 1, 1),
(1, 'Mateusz', 'Nowak', 'Polska', '1996-02-28', NULL, '2004-08-10', NULL, 1, 0),
(2, 'Alicia', 'Smith', 'Amerykañska', '1991-07-05', NULL, '2003-11-15', NULL, 1, 0),
(1, 'Sergio', 'Lopez', 'Amerykañska', '1988-06-20', NULL, '2008-05-01', NULL, 1, 1),
(2, 'Emily', 'Brown', 'Polska', '1994-01-15', NULL, '2007-03-20', NULL, 1, 0),
(1, 'Kamil', 'Sikorski', 'Polska', '1993-09-05', NULL, '2001-10-12', NULL, 1, 0),
(2, 'Luna', 'Gomez', 'Bu³garska', '1997-05-28', NULL, '2000-09-15', NULL, 1, 1);




INSERT INTO Udzialy_w_filmie (ID_Filmu, ID_Rodzaju, ID_Posady, ID_Osoby, ID_Umowy, Poczatek_udzialu, Koniec_udzialu, Wysokosc_Wynagrodzenia, Tresc_zawartej_umowy)
VALUES
(1, 1, 1, 10, 10000000, '2018-06-15', '2019-01-15', 800000, 'tresc'),
(1, 1, 1, 11, 10000001, '2018-06-19', '2019-01-19', 1200000, 'tresc'),
(1, 1, 1, 12, 10000002, '2018-06-11', '2019-01-11', 1400000, 'tresc'),
(1, 2, 2, 13, 10000003, '2018-05-15', '2019-01-15', 700000, 'tresc'),
(1, 4, 3, 14, 10000004, '2018-07-15', '2019-02-15', 950000, 'tresc'),

(2, 1, 1, 14, 10000005, '2016-08-10', '2017-03-10', 1350000, 'tresc'),
(2, 1, 1, 15, 10000006, '2016-07-17', '2017-02-17', 800000, 'tresc'),
(2, 2, 2, 2, 10000007, '2016-02-21', '2016-09-21', 1300000, 'tresc'),
(2, 5, 4, 4, 10000008, '2016-06-11', '2017-01-11', 1400000, 'tresc'),
(2, 6, 5, 5, 10000009, '2016-09-22', '2017-04-22', 900000, 'tresc'),

(3, 1, 1, 16, 10000010, '2018-08-28', '2019-03-28', 850000, 'tresc'),
(3, 1, 1, 17, 10000011, '2018-08-31', '2019-03-31', 950000, 'tresc'),
(3, 1, 1, 18, 10000012, '2018-09-05', '2019-04-05', 1400000, 'tresc'),
(3, 2, 2, 1, 10000013, '2018-09-09', '2019-04-09', 1250000, 'tresc'),
(3, 10, 6, 6, 10000014, '2018-09-12', '2019-04-12', 1200000, 'tresc'),

(4, 1, 1, 19, 10000015, '2020-11-15', '2021-06-15', 1300000, 'tresc'),
(4, 1, 1, 20, 10000016, '2020-11-18', '2021-06-18', 900000, 'tresc'),
(4, 1, 1, 21, 10000017, '2020-11-20', '2021-06-20', 720000, 'tresc'),
(4, 2, 2, 10, 10000018, '2020-11-23', '2021-06-23', 1400000, 'tresc'),
(4, 8, 7, 7, 10000019, '2020-11-26', '2021-06-26', 750000, 'tresc'),

(5, 1, 1, 22, 10000020, '2018-02-25', '2018-09-25', 850000, 'tresc'),
(5, 1, 1, 23, 10000021, '2018-02-27', '2018-09-27', 1350000, 'tresc'),
(5, 2, 2, 11, 10000022, '2018-02-28', '2018-09-28', 950000, 'tresc'),
(5, 14, 8, 8, 10000023, '2018-03-03', '2018-10-03', 720000, 'tresc'),
(5, 9, 9, 9, 10000024, '2018-03-06', '2018-10-06', 1400000, 'tresc'),

(6, 1, 1, 24, 10000025, '2021-06-15', '2022-01-15', 750000, 'tresc'),
(6, 1, 1, 25, 10000026, '2021-06-16', '2022-01-16', 1100000, 'tresc'),
(6, 2, 2, 2, 10000027, '2021-06-18', '2022-01-18', 800000, 'tresc'),
(6, 3, 10, 2, 10000028, '2021-06-20', '2022-01-20', 1400000, 'tresc'),
(6, 11, 11, 9, 10000029, '2021-06-23', '2022-01-23', 950000, 'tresc'),

(7, 1, 1, 26, 10000030, '2017-08-05', '2018-03-05', 720000, 'tresc'),
(7, 1, 1, 27, 10000031, '2017-08-08', '2018-03-08', 1400000, 'tresc'),
(7, 1, 1, 28, 10000032, '2017-08-10', '2018-03-10', 980000, 'tresc'),
(7, 2, 2, 12, 10000033, '2017-08-13', '2018-03-13', 850000, 'tresc'),
(7, 3, 10, 12, 10000034, '2017-08-16', '2018-03-16', 720000, 'tresc'),


(8, 1, 1, 10, 10000035, '2015-01-01', '2015-08-01', 1400000, 'tresc'),
(8, 1, 1, 11, 10000036, '2015-01-03', '2015-08-03', 720000, 'tresc'),
(8, 2, 2, 14, 10000037, '2015-01-05', '2015-08-05', 950000, 'tresc'),
(8, 9, 9, 9, 10000038, '2015-01-08', '2015-08-08', 800000, 'tresc'),
(8, 14, 8, 8, 10000039, '2015-01-11', '2015-08-11', 1400000, 'tresc'),

(9, 1, 1, 12, 10000040, '2015-03-25', '2015-10-25', 1400000, 'tresc'),
(9, 1, 1, 13, 10000041, '2015-03-28', '2015-10-28', 800000, 'tresc'),
(9, 2, 2, 2, 10000042, '2015-03-30', '2015-10-30', 1200000, 'tresc'),
(9, 8, 7, 7, 10000043, '2015-04-02', '2015-11-02', 1100000, 'tresc'),
(9, 10, 6, 6, 10000044, '2015-04-05', '2015-11-05', 850000, 'tresc'),

(10, 1, 1, 14, 10000045, '2022-10-08', '2023-05-08', 720000, 'tresc'),
(10, 1, 1, 15, 10000046, '2022-10-10', '2023-05-10', 1350000, 'tresc'),
(10, 1, 1, 16, 10000047, '2022-10-12', '2023-05-12', 950000, 'tresc'),
(10, 2, 2, 1, 10000048, '2022-10-15', '2023-05-15', 1400000, 'tresc'),
(10, 6, 5, 5, 10000049, '2022-10-18', '2023-05-18', 820000, 'tresc'),

(11, 1, 1, 17, 10000050, '2019-07-25', '2020-02-25', 720000, 'tresc'),
(11, 1, 1, 18, 10000051, '2019-07-27', '2020-02-27', 1450000, 'tresc'),
(11, 2, 2, 1, 10000052, '2019-07-28', '2020-02-28', 900000, 'tresc'),
(11, 5, 4, 4, 10000053, '2019-07-31', '2020-02-28', 720000, 'tresc'),
(11, 4, 3, 3, 10000054, '2019-08-03', '2020-03-03', 1350000, 'tresc'),

(12, 1, 1, 19, 10000055, '2020-04-01', '2020-11-01', 900000, 'tresc'),
(12, 1, 1, 20, 10000056, '2020-04-03', '2020-11-03', 1200000, 'tresc'),
(12, 2, 2, 2, 10000057, '2020-04-05', '2020-11-05', 1400000, 'tresc'),
(12, 5, 4, 4, 10000058, '2020-04-08', '2020-11-08', 800000, 'tresc'),
(12, 6, 5, 5, 10000059, '2020-04-11', '2020-11-11', 950000, 'tresc'),

-- Group 13 (around '2022-06-02')
(13, 1, 1, 21, 10000060, '2022-05-28', '2023-01-28', 1000000, 'tresc'),
(13, 1, 1, 22, 10000061, '2022-05-31', '2023-01-31', 720000, 'tresc'),
(13, 2, 2, 1, 10000062, '2022-06-02', '2023-02-02', 1400000, 'tresc'),
(13, 10, 6, 6, 10000063, '2022-06-05', '2023-02-05', 880000, 'tresc'),
(13, 8, 7, 7, 10000064, '2022-06-08', '2023-02-08', 750000, 'tresc'),

-- Group 14 (around '2019-09-20')
(14, 13, 1, 23, 10000065, '2019-09-15', '2020-04-15', 980000, 'tresc'),
(14, 13, 1, 24, 10000066, '2019-09-18', '2020-04-18', 720000, 'tresc'),
(14, 13, 1, 25, 10000067, '2019-09-20', '2020-04-20', 1300000, 'tresc'),
(14, 2, 2, 11, 10000068, '2019-09-23', '2020-04-23', 850000, 'tresc'),
(14, 12, 5, 5, 10000069, '2019-09-26', '2020-04-26', 750000, 'tresc'),

-- Group 15 (around '2012-12-05')
(15, 1, 1, 26, 10000070, '2012-12-01', '2013-07-01', 1100000, 'tresc'),
(15, 1, 1, 27, 10000071, '2012-12-03', '2013-07-03', 900000, 'tresc'),
(15, 2, 2, 10, 10000072, '2012-12-05', '2013-07-05', 1200000, 'tresc'),
(15, 14, 8, 8, 10000073, '2012-12-08', '2013-07-08', 730000, 'tresc'),
(15, 9, 9, 9, 10000074, '2012-12-11', '2013-07-11', 800000, 'tresc'),

-- Group 16 (around '2009-03-10')
(16, 1, 1, 28, 10000075, '2009-03-05', '2009-10-05', 820000, 'tresc'),
(16, 1, 1, 10, 10000076, '2009-03-08', '2009-10-08', 1500000, 'tresc'),
(16, 1, 1, 11, 10000077, '2009-03-10', '2009-10-10', 720000, 'tresc'),
(16, 2, 2, 12, 10000078, '2009-03-13', '2009-10-13', 1400000, 'tresc'),
(16, 3, 10, 12, 10000079, '2009-03-16', '2009-10-16', 750000, 'tresc'),

-- Group 17 (around '2021-05-20')
(17, 13, 1, 12, 10000080, '2021-05-15', '2021-12-15', 920000, 'tresc'),
(17, 13, 1, 13, 10000081, '2021-05-18', '2021-12-18', 750000, 'tresc'),
(17, 2, 2, 2, 10000082, '2021-05-20', '2021-12-20', 1100000, 'tresc'),
(17, 14, 8, 8, 10000083, '2021-05-23', '2021-12-23', 1450000, 'tresc'),
(17,12,5,5,10000084,'2021-05-26','2021-12-26', 800000, 'tresc'),

-- Group 18 (around '2021-09-01')
(18, 1, 1, 14, 10000085, '2021-08-28', '2022-03-28', 890000, 'tresc'),
(18, 1, 1, 15, 10000086, '2021-08-31', '2022-03-31', 1350000, 'tresc'),
(18, 2, 2, 1, 10000087, '2021-09-01', '2022-04-01', 930000, 'tresc'),
(18, 11, 11, 9, 10000088, '2021-09-04', '2022-04-04', 1150000, 'tresc'),
(18, 9, 9, 9, 10000089, '2021-09-07', '2022-04-07', 780000, 'tresc'),

-- Group 19 (around '2020-11-12')
(19, 1, 1, 16, 10000090, '2020-11-08', '2021-06-08', 870000, 'tresc'),
(19, 1, 1, 17, 10000091, '2020-11-10', '2021-06-10', 1130000, 'tresc'),
(19, 1, 1, 18, 10000092, '2020-11-12', '2021-06-12', 720000, 'tresc'),
(19, 2, 2, 2, 10000093, '2020-11-15', '2021-06-15', 1420000, 'tresc'),
(19, 8, 7, 7, 10000094, '2020-11-18', '2021-06-18', 950000, 'tresc'),

-- Group 20 (around '2019-07-30')
(20, 1, 1, 19, 10000095, '2019-07-25', '2020-02-25', 800000, 'tresc'),
(20, 1, 1, 20, 10000096, '2019-07-28', '2020-02-28', 1350000, 'tresc'),
(20, 1, 1, 21, 10000097, '2019-07-30', '2020-03-30', 920000, 'tresc'),
(20, 2, 2, 1, 10000098, '2019-08-02', '2020-04-02', 1120000, 'tresc'),
(20, 10, 6, 6, 10000099, '2019-08-05', '2020-04-05', 780000, 'tresc'),


-- Group 21 (around '2018-12-05')
(21, 1, 1, 22, 10000100, '2018-12-01', '2019-07-01', 950000, 'tresc'),
(21, 1, 1, 23, 10000101, '2018-12-03', '2019-07-03', 1220000, 'tresc'),
(21, 2, 2, 1, 10000102, '2018-12-05', '2019-07-05', 710000, 'tresc'),
(21, 6, 5, 5, 10000103, '2018-12-08', '2019-07-08', 1420000, 'tresc'),
(21, 5, 4, 4, 10000104, '2018-12-11', '2019-07-11', 890000, 'tresc'),

-- Group 22 (around '2017-08-22')
(22, 1, 1, 24, 10000105, '2017-08-18', '2018-03-18', 800000, 'tresc'),
(22, 1, 1, 25, 10000106, '2017-08-20', '2018-03-20', 1350000, 'tresc'),
(22, 2, 2, 2, 10000107, '2017-08-22', '2018-03-22', 920000, 'tresc'),
(22, 4, 3, 3, 10000108, '2017-08-25', '2018-03-25', 1120000, 'tresc'),
(22, 14, 8, 8, 10000109, '2017-08-28', '2018-03-28', 780000, 'tresc');



INSERT INTO Nagrody (ID_Filmu, ID_Udzialu, ID_Organu_Nagradzajacego, Data_Przyznania, Nazwa_nagrody)
VALUES
(1,NULL,1,'2020-02-09', 'Nagroda Akademii Filmowej dla najlepszego filmu'),
(1,NULL,2,'2020-05-17', 'Z³ota palma'),
(1,NULL,3,'2020-02-02', 'Nagroda brytyjskiej Akademii Filmowej dla najlepszego filmu'),
(NULL,1,1,'2020-02-09', 'Nagroda Akademii Filmowej dla najlepszej aktorki drugoplanowej'),
(NULL,5,1,'2020-02-09', 'Nagroda Akademii Filmowej za najlepsze zdjêcia'),

(4,NULL,2,'2022-09-13','Z³ota palma'),
(4,NULL,5,'2022-09-09','Z³oty lew'),
(4,NULL,6,'2022-02-15','Z³oty niedŸwiedŸ'),
(NULL,16,3,'2022-03-13','Nagroda brytyjskiej akademii filmowej dla najlepszej aktorki pierwszoplanowej'),
(NULL,17,1,'2022-03-28','Nagroda Akademii Filmowej dla najlepszego aktora pierwszoplanowego'),

(7, NULL,1,'2019-02-24','Nagroda Akademii Filmowej dla najlepszego filmu'),
(7, NULL,1,'2019-02-24','Nagroda Akademii Filmowej dla najlepszego filmu nieanglojêzycznego'),
(NULL,31,3,'2019-02-10','Nagroda brytyjskiej akademii filmowej dla najlepszego aktora drugoplanowego'),
(NULL,33,3,'2019-02-10','Nagroda brytyjskiej akademii filmowej dla najlepszej aktorki pierwszoplanowej'),
(NULL,35,1,'2019-02-24','Nagroda Akademii Filmowej za najlepsz¹ scenografie'),

(16, NULL,2,'2011-05-20','Z³ota palma'),
(16, NULL,1,'2011-02-27','Nagroda Akademii Filmowej dla najlepszego filmu nieanglojêzycznego'),
(16, NULL,1,'2011-02-27','Nagroda Akademii Filmowej dla najlepszego filmu'),
(NULL,61,8,'2011-06-05', 'Nagroda filmowa MTV dla najlepszej aktorki'),
(NULL,64,3,'2011-02-11','Nagroda brytyjskiej akademii filmowej dla najlepszego re¿ysera'),


(9,NULL,2,'2018-05-19','Z³ota palma'),
(9,NULL,5,'2018-09-06','Z³oty lew'),
(NULL,42,1,'2018-02-26','Nagroda Akademii Filmowej dla najlepszego aktora drugoplanowego'),
(NULL,43,1,'2018-02-26','Nagroda Akademii Filmowej dla najlepszego re¿ysera'),
(NULL,41,1,'2018-02-26','Nagroda Akademii Filmowej dla najlepszej aktorki pierwszoplanowej');


INSERT INTO Postac (ID_To¿samoœci_P³ciowej, Nazwa, Wiek, Narodowosc)
VALUES
(1, 'John Smith', 30, 'Amerykañska'),
(1, 'Jack Johnson', 25, 'Brytyjska'),
(2, 'Emily Brown', 28, 'Kanadyjska'),
(4, 'Mariusz Nowak', 35, 'Polska'),
(2, 'Sophia Kowalska', 40, 'Polska'),
(1, 'Carlos Rodriguez', 32, 'Hiszpañska'),
(2, 'Isabella Costa', 27, 'W³oska'),
(1, 'Hiro Yamamoto', 29, 'Japoñska'),
(3, 'Lena Schmidt', 31, 'Niemiecka'),
(1, 'Mohammed Ali', 26, 'Egipska'),
(2, 'Aisha Khan', 33, 'Pakistañska'),
(1, 'Andrei Petrov', 34, 'Rosyjska'),
(2, 'Anastasia Ivanova', 23, 'Rosyjska'),
(1, 'Liam Murphy', 24, 'Irlandzka'),
(2, 'Freya Jensen', 29, 'Duñska'),
(1, 'Matteo Ferrari', 27, 'W³oska'),
(3, 'Maria Garcia', 36, 'Hiszpañska'),
(1, 'Seung Lee', 31, 'Koreañska'),
(2, 'Yuki Tanaka', 28, 'Japoñska'),
(1, 'Ivan Dimitrov', 30, 'Bu³garska'),
(2, 'Elena Popescu', 25, 'Rumuñska'),
(3, 'Johan Svensson', 29, 'Szwedzka');

INSERT INTO Rola_w_filmie (ID_Postaci, ID_Filmu, Nazwa_roli)
VALUES
(1, 1, 'normal John Smith'),
(2, 1, 'normal Jack Johnson'),
(3, 1, 'normal Emily Brown'),
(4, 1, 'normal Mariusz Nowak'),
(5, 2, 'normal Sophia Kowalska'),
(6, 2, 'normal Carlos Rodriguez'),
(7, 2, 'normal Isabella Costa'),
(8, 2, 'normal Hiro Yamamoto'),
(9, 3, 'normal Lena Schmidt'),
(10, 3, 'normal Mohammed Ali'),
(11, 3, 'normal Aisha Khan'),
(12, 3, 'normal Andrei Petrov'),
(13, 4, 'normal Anastasia Ivanova'),
(14, 4, 'normal Liam Murphy'),
(15, 4, 'normal Freya Jensen'),
(16, 5, 'normal Matteo Ferrari'),
(17, 5, 'normal Maria Garcia'),
(18, 5, 'normal Seung Lee'),
(19, 6, 'normal Yuki Tanaka'),
(20, 6, 'normal Ivan Dimitrov'),
(21, 6, 'normal Elena Popescu'),
(22, 6, 'normal Johan Svensson');