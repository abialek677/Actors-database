use Movie_DB;


--ZAPYTANIE #1


--Wytw�rnia chcia�aby traktowa� wszystkich r�wno, bez wzgl�du na
--narodowo��. Opracuj zestawienie, w kt�rym obliczysz procentowy udzia�
--poszczeg�lnych rodzaj�w um�w w�r�d zatrudnionych Polak�w, Bu�gar�w i
--Amerykan�w.

SELECT
	osb.Narodowosc,
	Nazwa_rodzaju AS Rodzaj_umowy,
	CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY Narodowosc) AS DECIMAL(5,2)) AS Procentowy_udzial
FROM
    Osoby osb
JOIN
    Udzialy_w_filmie udzial ON osb.KEY_ID = udzial.ID_Osoby
JOIN
    Rodzaje_umow rodzaj ON udzial.ID_Rodzaju = rodzaj.KEY_ID
WHERE
    Narodowosc IN ('Polska', 'Ameryka�ska', 'Bu�garska')
GROUP BY
    Narodowosc, Nazwa_rodzaju
ORDER BY
    Narodowosc, Procentowy_udzial DESC;

--ZAPYTANIE #2



--Wytw�rnia chcia�aby zorientowa� si�, osoby z jak� to�samo�ci� p�ciow�
--otrzymuj� najwi�cej nagr�d. Utw�rz zestawienie, w kt�rym dla ka�dej
--istniej�cej to�samo�ci p�ciowej wy�wietlisz ��czn� liczb� nag�d zdobyt� przez
--osoby tej to�samo�ci.

SELECT
    TozPlc.Nazwa_tozsamosci_plciowej AS Tozsamosc_P�ciowa,
    COUNT(Nagrody.KEY_ID) AS Liczba_Nagrod
FROM
    Tozsamosc_plciowa TozPlc
LEFT JOIN
    Osoby osb ON TozPlc.KEY_ID = osb.ID_Tozsamosci_P�ciowej
LEFT JOIN
    Udzialy_w_filmie udzial ON osb.KEY_ID = udzial.ID_Osoby
LEFT JOIN
    Nagrody ON (udzial.KEY_ID = Nagrody.ID_Udzialu)
GROUP BY
    TozPlc.Nazwa_tozsamosci_plciowej
ORDER BY
	Liczba_Nagrod DESC;

--ZAPYTANIE #3


--Wytw�rnia chcia�aby zaplanowa� strategi� dzia�ania na najbli�sze lata.
--Sporz�d� zestawienie gatunk�w film�w, kt�re zarobi�y najwi�cej na
--przestrzeni ostatniego roku.


DROP VIEW IF EXISTS NajlepiejZarabiajaceFilmy;

GO
CREATE VIEW NajlepiejZarabiajaceFilmy AS
SELECT
    G.Nazwa_Gatunku AS Gatunek,
    COALESCE(SUM(MP.Wartosc_przychodu), 0) AS Suma_Przychodu
FROM
    Gatunki G
LEFT JOIN
    Filmy F ON G.KEY_ID = F.ID_Gatunku
LEFT JOIN
    Miesieczny_przychod MP ON F.KEY_ID = MP.ID_Filmu AND MP.Data >= DATEADD(year, -1, GETDATE())
GROUP BY
    G.Nazwa_Gatunku;
GO

SELECT * FROM NajlepiejZarabiajaceFilmy
ORDER BY Suma_Przychodu DESC;



--ZAPYTANIE #4


--Dyrektor Warner Bros chce sprawdzi� umowy jakiego typu sa przydzielane dla kobiet.
--Sporz�d� zestawienie ilo�ci oraz rodzaju umow podpisanych przez kobiety.


SELECT
	Rodz.Nazwa_rodzaju AS Rodzaj_Umowy,
	COUNT(Udzial.ID_Umowy) AS Liczba_Umow
FROM
	Udzialy_w_filmie Udzial
JOIN
	Rodzaje_umow Rodz ON Udzial.ID_Rodzaju = Rodz.KEY_ID
JOIN
	Osoby osb ON Udzial.ID_Osoby = osb.KEY_ID
JOIN
	Tozsamosc_plciowa Toz ON osb.ID_Tozsamosci_P�ciowej = Toz.KEY_ID
WHERE
	Toz.Nazwa_tozsamosci_plciowej = 'Kobieta'
GROUP BY
	Rodz.Nazwa_rodzaju
ORDER BY
	Liczba_Umow DESC;


--ZAPYTANIE #5


--Hollowood planuje odmlodzic kadre aktorow. W ilu filmach wypuszczonych po XXXX
--roky graly osoby urodzone przed XXXX rokiem.

SELECT 
	COUNT(DISTINCT F.KEY_ID) AS Liczba_Filmow
FROM 
	Filmy F
JOIN 
	Miesieczny_przychod MP ON F.KEY_ID = MP.ID_Filmu
JOIN 
	Udzialy_w_filmie UWF ON F.KEY_ID = UWF.ID_Filmu
JOIN 
	Osoby O ON UWF.ID_Osoby = O.KEY_ID
WHERE 
	YEAR(F.Data_Premiery_Swiat) > 2000 AND YEAR(O.Data_Urodzenia) < 1980;




-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
															--ZAPYTANIA WLASNE--




--ZAPYTANIE #6


--Przedsi�biorstwo jest w niema�ych k�opotach finansowych. 
--Maj� wystarczaj�ce fundusze, aby wyprodukowa� tylko jeden film, ale nie wiedz� jaki gatunek wybra�. 
--Potrzebuj� informacji, kt�ry gatunek zarabia najwi�cej w stosunku do ka�dego $ wydanego na produkcj� filmu.
--Przedsi�biorstwo potrzebuje aktualnych inforamacji rynkowych zatem nie interesuj� ich filmy wyprodukowane przed 2010.
--Napisz zapytanie kt�re przedstawi zestawienie gatunk�w film�w wraz ze �rednim przychodem, �rednim bud�etem oraz stosunkiem zarobku do bud�etu


SELECT
	G.Nazwa_Gatunku AS Gatunek,
	SUM(MP.Wartosc_przychodu)/COUNT(CASE WHEN YEAR(F.Data_Premiery_Swiat) > 2010 THEN F.KEY_ID END) AS Sredni_przychod,
	AVG(F.Budzet) AS Sredni_budzet,
	AVG(MP.Wartosc_przychodu) / AVG(F.Budzet) AS Stosunek_zarobku_do_budzetu
FROM
	Filmy F
JOIN
	Gatunki G ON F.ID_Gatunku = G.KEY_ID

LEFT JOIN
	Miesieczny_przychod MP ON F.KEY_ID = MP.ID_Filmu
WHERE
	YEAR(F.Data_Premiery_Swiat)>2010
GROUP BY
	G.Nazwa_Gatunku
ORDER BY
	Stosunek_zarobku_do_budzetu DESC;



--ZAPYTANIE #7


--Wraz ze zmian� preferencji widz�w przedsi�biorstwo musi zrobi� reewaluacje tego jakie to�samo�ci p�ciowe powinmny mie� postacie w ich filmach.
--Wypisz zestawienie z trzech najbardziej dochodowych film�w zawieraj�ce to�samo�ci p�ciowe wraz z liczb� ich wyst�pie� w tych filmach


SELECT
    TP.Nazwa_tozsamosci_plciowej AS Tozsamosc_plciowa,
    COUNT(DISTINCT RWF.KEY_ID) AS Liczba_wystapien
FROM
    (
        SELECT TOP 3
            F.KEY_ID,
            F.Tytul
        FROM
            Filmy F
        JOIN
            Miesieczny_przychod MP ON F.KEY_ID = MP.ID_Filmu
        GROUP BY
            F.KEY_ID, F.Tytul
        ORDER BY
            SUM(MP.Wartosc_przychodu) DESC
    ) AS Flm
JOIN
    Udzialy_w_filmie UWF ON Flm.KEY_ID = UWF.ID_Filmu
JOIN
    Rola_w_filmie RWF ON RWF.ID_Filmu = UWF.ID_Filmu
JOIN
    Postac ON Postac.KEY_ID = RWF.ID_Postaci
JOIN
    Tozsamosc_plciowa TP ON TP.KEY_ID = Postac.ID_To�samo�ci_P�ciowej
GROUP BY
    TP.Nazwa_tozsamosci_plciowej
ORDER BY
    Liczba_wystapien DESC;



--ZAPYTANIE #8

--Przedsi�biorstwo pracuje nad nowym eksperymentalnym gatunkiem filmowym i potrzebuje aktor�w kt�rzy pracowali nad wi�cej ni� jednym gatukniem filmu w swojej karierze.
--Przedstaw wszystkich aktor�w kt�rzy pracowali co najmniej nad dwoma filmami o r�nych gatunkach wraz z liczb� tych film�w

SELECT 
    O.Imie,
    O.Nazwisko,
    COUNT(DISTINCT G.Nazwa_Gatunku) AS Liczba_pracowanych_gatunkow
FROM 
    Osoby O
JOIN
    Udzialy_w_filmie UWF ON O.KEY_ID = UWF.ID_Osoby
JOIN 
    Filmy F ON UWF.ID_Filmu = F.KEY_ID
JOIN 
    Gatunki G ON F.ID_Gatunku = G.KEY_ID
JOIN
	Posady P ON UWF.ID_Posady = P.KEY_ID
WHERE
	P.Nazwa_posady = 'Aktor'
GROUP BY 
    O.KEY_ID, O.Imie, O.Nazwisko
HAVING 
    COUNT(DISTINCT G.Nazwa_Gatunku) >= 2
ORDER BY 
    Liczba_pracowanych_gatunkow DESC;



--ZAPYTANIE #9

--Przedsi�biorstwo szykuje si� do jednego z najd�u�szych projekt�w ostatnich lat. Z tego powodu potrzebuj� aktor�w kt�rzy mieli najd�u�szy �redni czas pracy nad filmem.
--Sporz�d� zestawienie trzech takich aktor�w aby przedsi�biorstwo mog�o wybra� kogo chc� zatrudni�


SELECT TOP 3
    O.Imie AS Imie,
    O.Nazwisko AS Nazwisko,
    AVG(DATEDIFF(DAY, UWF.Poczatek_udzialu, UWF.Koniec_udzialu)) AS Srednia_dlugosc_kontraktu
FROM 
    Osoby O
JOIN 
    Udzialy_w_filmie UWF ON O.KEY_ID = UWF.ID_Osoby
WHERE 
    UWF.Poczatek_udzialu IS NOT NULL AND UWF.Koniec_udzialu IS NOT NULL
GROUP BY 
    O.KEY_ID, O.Imie, O.Nazwisko
ORDER BY 
    Srednia_dlugosc_kontraktu DESC;



--ZAPYTANIE #10

--Przedsi�biorstwo potrzebuje informacji aby obra� strategi� na najbli�sze lata.
--Chce ono sprawdzi� jakie gatunki film�w wychodz� im najgorzej.
--W tym celu sporz�d� zestawienie trzech gatunk�w film�w kt�re uzyska�y najmniej nagr�d

SELECT TOP 3 
	G.Nazwa_Gatunku AS Gatunek,
	Liczba_nagrod
FROM 
	Gatunki G
LEFT JOIN 
(
    SELECT F.ID_Gatunku, COUNT(N.KEY_ID) AS Liczba_nagrod
    FROM Filmy F
    LEFT JOIN Nagrody N ON F.KEY_ID = N.ID_Filmu
    GROUP BY F.ID_Gatunku
) AS Gatunki_nagrody ON G.KEY_ID = Gatunki_nagrody.ID_Gatunku
WHERE 
	Liczba_nagrod != 0 --pomijam case 0 aby zaprezentowa� dzia�anie zapytania, normalnie by nie by�o tego
ORDER BY 
	Liczba_nagrod ASC;









