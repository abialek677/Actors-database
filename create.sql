use Movie_DB;



CREATE TABLE Rodzaje_umow (
    KEY_ID INT PRIMARY KEY IDENTITY(1,1),
    Nazwa_rodzaju VARCHAR(100) UNIQUE  NOT NULL
);

CREATE TABLE Posady (
    KEY_ID INT PRIMARY KEY IDENTITY(1,1),
    Nazwa_posady VARCHAR(100) UNIQUE  NOT NULL
);

CREATE TABLE Gatunki (
    KEY_ID INT PRIMARY KEY IDENTITY(1,1),
    Nazwa_Gatunku VARCHAR(100) UNIQUE  NOT NULL
);

--CREATE TABLE Gatunki (
--    Nazwa_Gatunku VARCHAR(100) PRIMARY KEY  NOT NULL
--);

CREATE TABLE Tozsamosc_plciowa (
    KEY_ID INT PRIMARY KEY IDENTITY(1,1) ,
    Nazwa_tozsamosci_plciowej VARCHAR(100) UNIQUE  NOT NULL
);

CREATE TABLE Organy_nagradzajace (
    KEY_ID INT PRIMARY KEY IDENTITY(1,1) ,
    Nazwa_organa_nagradzajacego VARCHAR(100) UNIQUE  NOT NULL,
    Aktywna BIT,
    Rok_zalozenia INT
);


CREATE TABLE Filmy (
    KEY_ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ID_Gatunku INT NOT NULL,
    Budzet DECIMAL(15, 2),
    Tytul VARCHAR(100),
    Data_Premiery_USA DATE,
    Data_Premiery_Swiat DATE,
    Opis TEXT NOT NULL DEFAULT 'Opis',
	FOREIGN KEY(ID_Gatunku) REFERENCES Gatunki(KEY_ID) ON UPDATE CASCADE ON DELETE NO ACTION
);

--CREATE TABLE Filmy (
--    KEY_ID INT PRIMARY KEY IDENTITY(1,1) ,
--    Gatunek VARCHAR(100) NOT NULL,
--    Budzet DECIMAL(15, 2),
--    Tytul VARCHAR(100),
--    Data_Premiery_USA DATE,
--    Data_Premiery_Swiat DATE,
--    Opis TEXT NOT NULL DEFAULT 'Opis',
--	FOREIGN KEY(Gatunek) REFERENCES Gatunki(Nazwa_Gatunku) ON UPDATE CASCADE ON DELETE NO ACTION
--);

CREATE TABLE Miesieczny_przychod (
    KEY_ID INT PRIMARY KEY IDENTITY(1,1) ,
    ID_Filmu INT  NOT NULL,
    Data DATE,
    Wartosc_przychodu DECIMAL(13, 2),
	FOREIGN KEY (ID_Filmu) REFERENCES Filmy(KEY_ID) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE Osoby (
    KEY_ID INT PRIMARY KEY IDENTITY(1,1) ,
    ID_Tozsamosci_P³ciowej INT NOT NULL,
    Imie VARCHAR(100) NOT NULL,
    Nazwisko VARCHAR(100) NOT NULL,
    Narodowosc VARCHAR(100) NOT NULL,
    Data_Urodzenia DATE NOT NULL,
    Data_Smierci DATE,
    Poczatek_kariery DATE NOT NULL,
    Koniec_kariery DATE,
    jest_aktorem BIT,
    Aktywny_kontrakt BIT,
	FOREIGN KEY (ID_Tozsamosci_P³ciowej) REFERENCES Tozsamosc_plciowa(KEY_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT constraint_Imie_Nazwisko_DataUrodzenia UNIQUE (Imie, Nazwisko, Data_Urodzenia)
);



CREATE TABLE Udzialy_w_filmie (
    KEY_ID INT PRIMARY KEY IDENTITY(1,1) ,
    ID_Osoby INT  NOT NULL,
    ID_Rodzaju INT  NOT NULL,
    ID_Filmu INT  NOT NULL,
    ID_Posady INT  NOT NULL,
    ID_Umowy INT NOT NULL UNIQUE check(99999999>=ID_Umowy AND ID_Umowy >=10000000),
    Poczatek_udzialu DATE,
    Koniec_udzialu DATE,
    Tresc_zawartej_umowy TEXT NOT NULL DEFAULT 'Tresc Przykladowa',
    Wysokosc_Wynagrodzenia INT,
	FOREIGN KEY (ID_Osoby) REFERENCES Osoby(KEY_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (ID_Rodzaju) REFERENCES Rodzaje_umow(KEY_ID) ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY (ID_Filmu) REFERENCES Filmy(KEY_ID) ON DELETE CASCADE,
	FOREIGN KEY (ID_Posady) REFERENCES Posady(KEY_ID) ON DELETE CASCADE
);





CREATE TABLE Nagrody (
    KEY_ID INT PRIMARY KEY IDENTITY(1,1),
    ID_Filmu INT,
    ID_Udzialu INT,
    ID_Organu_Nagradzajacego INT REFERENCES Organy_nagradzajace(KEY_ID) NOT NULL,
    Data_Przyznania DATE NOT NULL,
    Nazwa_nagrody VARCHAR(100) NOT NULL,
	FOREIGN KEY (ID_Filmu) REFERENCES Filmy(KEY_ID) ON UPDATE CASCADE ON DELETE NO ACTION,
	FOREIGN KEY (ID_Udzialu) REFERENCES Udzialy_w_filmie(KEY_ID) ON DELETE NO ACTION ON UPDATE CASCADE,
	CHECK ((ID_Filmu IS NULL AND ID_Udzialu IS NOT NULL) OR (ID_Filmu IS NOT NULL AND ID_Udzialu IS NULL))
);





CREATE TABLE Postac (
    KEY_ID INT PRIMARY KEY IDENTITY(1,1),
    ID_To¿samoœci_P³ciowej INT NOT NULL,
    Nazwa VARCHAR(100) NOT NULL,
    Wiek TINYINT NOT NULL,
    Narodowosc VARCHAR(100),
	FOREIGN KEY (ID_To¿samoœci_P³ciowej)  REFERENCES Tozsamosc_plciowa(KEY_ID) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE Rola_w_filmie (
    KEY_ID INT PRIMARY KEY IDENTITY(1,1),
    ID_Postaci INT,
    ID_Filmu INT,
    Nazwa_roli VARCHAR(100),
	FOREIGN KEY (ID_Postaci) REFERENCES Postac(KEY_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (ID_Filmu) REFERENCES Filmy(KEY_ID) ON UPDATE CASCADE ON DELETE CASCADE
);