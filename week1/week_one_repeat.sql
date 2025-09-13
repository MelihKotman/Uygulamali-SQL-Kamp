--'SchoolDB' adında bir veritabanı oluştur
CREATE DATABASE SchoolDB;

--Oluşturulan veri tabanını kullan
--USE SchoolDB
\connect schooldb;

--Öğrenciler tablosu oluştur
CREATE TABLE Students (
    Student_ID SERIAL PRIMARY KEY, --1'den başlar, her yeni kayıt 1 artar
    Name VARCHAR(50), --İsim
    Age INT, --Yaş
    Department VARCHAR(50), --Bölüm
    RegistrationDate DATE --Kayıt Tarihi
);

--Student_ID otomatik atanacak
INSERT INTO Students (Name, Age, Department, RegistrationDate)
VALUES ('Murat Can Barçın',24,'Computer Engineering','2023-09-01');

INSERT INTO Students (Name, Age, Department, RegistrationDate)
VALUES ('Ayşe Yılmaz', 20, 'Electrical Engineering', '2023-09-10');

--Tüm öğrencileri listele
SELECT * FROM Students;

--Sadece isim ve yaş getir
SELECT Name, Age FROM Students;

--1 numaralı öğrencinin yaşını güncelle
UPDATE Students
SET Age = 25
WHERE Student_ID = 1;

--1 numaralı öğrenciyi sil
DELETE FROM Students
WHERE Name = 'Murat Can Barçın';
--Eğer hata alırsan [Name] şeklinde yazabilirsin

--Tüm tablodaki verileri sil ama tablo kalsın
TRUNCATE  TABLE Students;

--20 yaşından büyük öğrencileri getir
SELECT Name, Age
FROM Students
WHERE Age > 20;

--Öğrencilerin farklı bölümlerini listele
SELECT DISTINCT Department
FROM Students;

--İlk 5 öğrenciyi listele
--SELECT TOP 5 *
--FROM Students;

--20 yaşından küçük öğrencileri listele
SELECT * FROM Students
WHERE Age < 20;