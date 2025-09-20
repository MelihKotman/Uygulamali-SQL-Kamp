--Mantıksal Operatörler (AND, OR, NOT)

--Örnek-1 Yaşı 20'den büyük ve Bilgisayar Mühendisliği okuyan kişileri getir.
SELECT Name, Age,Department
FROM Students
WHERE Age > 20 AND Department = 'Computer Engineering';

--Örnek-2 22 yaşından küçük ve Makine mühendisliği öğrencilerini getir.
SELECT *
FROM Students
WHERE Age < 22 OR Department = 'Mechanical Engineering';

--Örnek-3 Bilgisayar mühendisliği okumayan öğrenciler
SELECT Name, Department
FROM Students
WHERE NOT Department = 'Computer Engineering'

--Örnek-4 Bölümü Elektrik mühendisliği olan ve yaşı 23'den küçük olmayan öğrencileri getir.
SELECT *
FROM Students
WHERE Department = 'Electrical Engineering' AND NOT Age < 23;

--BETWEEN .. AND ..

--Örnek-5 18 ile 25 yaş arası öğrenciler

SELECT Name,Age
FROM Students
WHERE Age BETWEEN 18 AND 25;

--Örnek-6 2023 yılında kaydı olan öğrenciler
SELECT Name, RegistrationDate
FROM Students
WHERE RegistrationDate BETWEEN '2023-01-01' AND '2023-12-31';

--Örnek-7 2022 yılında kayt olan ve yaşı 23-25 arasında olan öğrencileri listeleyin
SELECT *
FROM Students
WHERE (RegistrationDate BETWEEN '2022-01-01' AND '2022-12-31' ) AND (Age BETWEEN 23 AND 25);

--IN (...)

--Örnek-8 Bölümü bilgisayar ve elektrik mühendisliğinden olan öğrencileri listeleyin.
SELECT Name, Department
FROM Students
WHERE Department IN('Computer Engineering', 'Electrical Engineering');

--Örnek-9 Yaşı 20,22,24 olan kişileri listeleyin.
SELECT Name,Age
FROM Students
WHERE AGE IN(20,22,24);

--Örnek-10 ID'si 5,10 veya 15 olan ve yaşı 20'den büyük olan öğrencileri getiriniz.
SELECT StudentID,Name,Age
FROM Students
WHERE StudentID IN(5,10,15) AND Age > 20;

--LIKE

--Örnek-11 Adı 'M' ile başlayan öğrencileri listeleyin.
SELECT Name
FROM Students
WHERE Name LIKE  'M%'; --Burada yüzde herhangi şeyler gelebilir anlamında ... yani

--Örnek-12 Soyadı 'at' ile biten öğrencileri listeleyin.
SELECT Name
FROM Students
WHERE Name LIKE '%at';

--Örnek-13 Adında ikinci harfi 'a' olan öğrencileri getirin.
SELECT Name
FROM Students
WHERE Name LIKE '_a%' --Eğer bir karakter simgelicekse '_' koyalım.

--Örnek-14 Adı A ile başlayan ve 2023 yılında kayıt olan öğrencileri listeleyin.
SELECT Name, RegistrationDate
FROM Students
WHERE Name LIKE 'A%' AND RegistrationDate BETWEEN '2023-01-01' AND '2023-12-31';

--AGGREGATE FUNCTIONS
-- COUNT,SUM,AVG,MIN,MAX

--Örnek-15 Toplam öğrenci sayısı
SELECT COUNT(*) AS TotalStudents
FROM Students;

--Örnek-16 Öğrencilerin yaş ortalaması
SELECT AVG(Age) AS AverageAge
FROM Students;

--Örnek-17 En yaşlı ve En genç öğrencileri listeleyin.
SELECT MIN(Age) AS Youngest, MAX(Age) AS Oldest
FROM Students;

--GROUP BY Aynı değerlere sahip kayıtları gruplar

--Örnek-18 Bölümlere göre öğrenci sayısı
SELECT Department, COUNT(*) AS TotalStudents
FROM Students
GROUP BY Department;

--Örnek-19 Her bölümdeki en genç öğrenciyi listele.
SELECT Department, MIN(Age) AS Youngest
FROM Students
GROUP BY Department;

--Örnek-20 Kayıt yılına göre öğrenci sayısını listele.
SELECT YEAR(RegistrationDate) AS Year, COUNT(*) AS TotalStudents
FROM Students
GROUP BY YEAR(RegistrationDate);

--Örnek-21 Bilgisayar veya Elektrik bölümündeki öğrencilerin hem toplam sayısını hemde yaş ortalamasını bulunuz.
SELECT Department, COUNT(*) AS TotalStudents, AVG(Age) AS AverageAge
FROM Students
WHERE Department IN('Computer Engineering','Electrical Engineering')
GROUP BY Department;

--Örnek-22 Kayıt yılına göre bölüm bazlı öğrenci sayısını bulunuz.
SELECT Department, YEAR(RegistrationDate) AS Year, COUNT(*) AS TotalStudents
FROM Students
GROUP BY Department,YEAR(RegistrationDate);

--HAVING

--Örnek-23 En az 17 öğrencisi olan bölümleri göster.
SELECT Department,COUNT(*) AS TotalStudents
FROM Students
GROUP BY Department
HAVING COUNT(*) >= 17;

--Örnek-24 Ortalama yaşı 21'den büyük olan bölümler
SELECT Department,AVG(Age) AS AverageAge
FROM Students
GROUP BY Department
HAVING AVG(Age) > 21;

--Örnek-25 En genç öğrencisi  19'dan küçük olan bölümler
SELECT Department, MIN(Age) AS Youngest
FROM Students
GROUP BY Department
HAVING MIN(Age) < 19;

--Örnek-26 Ortalama yaşı 20'den küçük ve öğrenci sayısı 17'den büyük olan bölümleri sıralayın.
SELECT Department,COUNT(*) AS TotalStudents, AVG(Age) AS AverageAge
FROM Students
GROUP BY Department
HAVING COUNT(*) > 17 AND AVG(Age) < 20;
