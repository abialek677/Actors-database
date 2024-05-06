use Movie_DB;


--ZAPYTANIE #1


--Wytwórnia chcia³aby traktowaæ wszystkich równo, bez wzglêdu na
--narodowoœæ. Opracuj zestawienie, w którym obliczysz procentowy udzia³
--poszczególnych rodzajów umów wœród zatrudnionych Polaków, Bu³garów i
--Amerykanów.

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
    Narodowosc IN ('Polska', 'Amerykañska', 'Bu³garska')
GROUP BY
    Narodowosc, Nazwa_rodzaju
ORDER BY
    Narodowosc, Procentowy_udzial DESC;

--ZAPYTANIE #2



--Wytwórnia chcia³aby zorientowaæ siê, osoby z jak¹ to¿samoœci¹ p³ciow¹
--otrzymuj¹ najwiêcej nagród. Utwórz zestawienie, w którym dla ka¿dej
--istniej¹cej to¿samoœci p³ciowej wyœwietlisz ³¹czn¹ liczbê nagód zdobyt¹ przez
--osoby tej to¿samoœci.

SELECT
    TozPlc.Nazwa_tozsamosci_plciowej AS Tozsamosc_P³ciowa,
    COUNT(Nagrody.KEY_ID) AS Liczba_Nagrod
FROM
    Tozsamosc_plciowa TozPlc
LEFT JOIN
    Osoby osb ON TozPlc.KEY_ID = osb.ID_Tozsamosci_P³ciowej
LEFT JOIN
    Udzialy_w_filmie udzial ON osb.KEY_ID = udzial.ID_Osoby
LEFT JOIN
    Nagrody ON (udzial.KEY_ID = Nagrody.ID_Udzialu)
GROUP BY
    TozPlc.Nazwa_tozsamosci_plciowej
ORDER BY
	Liczba_Nagrod DESC;

--ZAPYTANIE #3


--Wytwórnia chcia³aby zaplanowaæ strategiê dzia³ania na najbli¿sze lata.
--Sporz¹dŸ zestawienie gatunków filmów, które zarobi³y najwiêcej na
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


--Dyrektor Warner Bros chce sprawdziæ umowy jakiego typu sa przydzielane dla kobiet.
--Sporz¹dŸ zestawienie iloœci oraz rodzaju umow podpisanych przez kobiety.


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
	Tozsamosc_plciowa Toz ON osb.ID_Tozsamosci_P³ciowej = Toz.KEY_ID
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


--Przedsiêbiorstwo jest w niema³ych k³opotach finansowych. 
--Maj¹ wystarczaj¹ce fundusze, aby wyprodukowaæ tylko jeden film, ale nie wiedz¹ jaki gatunek wybraæ. 
--Potrzebuj¹ informacji, który gatunek zarabia najwiêcej w stosunku do ka¿dego $ wydanego na produkcjê filmu.
--Przedsiêbiorstwo potrzebuje aktualnych inforamacji rynkowych zatem nie interesuj¹ ich filmy wyprodukowane przed 2010.
--Napisz zapytanie które przedstawi zestawienie gatunków filmów wraz ze œrednim przychodem, œrednim bud¿etem oraz stosunkiem zarobku do bud¿etu


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


--Wraz ze zmian¹ preferencji widzów przedsiêbiorstwo musi zrobiæ reewaluacje tego jakie to¿samoœci p³ciowe powinmny mieæ postacie w ich filmach.
--Wypisz zestawienie z trzech najbardziej dochodowych filmów zawieraj¹ce to¿samoœci p³ciowe wraz z liczb¹ ich wyst¹pieñ w tych filmach


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
    Tozsamosc_plciowa TP ON TP.KEY_ID = Postac.ID_To¿samoœci_P³ciowej
GROUP BY
    TP.Nazwa_tozsamosci_plciowej
ORDER BY
    Liczba_wystapien DESC;



--ZAPYTANIE #8

--Przedsiêbiorstwo pracuje nad nowym eksperymentalnym gatunkiem filmowym i potrzebuje aktorów którzy pracowali nad wiêcej ni¿ jednym gatukniem filmu w swojej karierze.
--Przedstaw wszystkich aktorów którzy pracowali co najmniej nad dwoma filmami o ró¿nych gatunkach wraz z liczb¹ tych filmów

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

--Przedsiêbiorstwo szykuje siê do jednego z najd³u¿szych projektów ostatnich lat. Z tego powodu potrzebuj¹ aktorów którzy mieli najd³u¿szy œredni czas pracy nad filmem.
--Sporz¹dŸ zestawienie trzech takich aktorów aby przedsiêbiorstwo mog³o wybraæ kogo chc¹ zatrudniæ


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

--Przedsiêbiorstwo potrzebuje informacji aby obraæ strategiê na najbli¿sze lata.
--Chce ono sprawdziæ jakie gatunki filmów wychodz¹ im najgorzej.
--W tym celu sporz¹dŸ zestawienie trzech gatunków filmów które uzyska³y najmniej nagród

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
	Liczba_nagrod != 0 --pomijam case 0 aby zaprezentowaæ dzia³anie zapytania, normalnie by nie by³o tego
ORDER BY 
	Liczba_nagrod ASC;









