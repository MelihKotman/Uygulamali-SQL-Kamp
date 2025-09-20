 --1.Görev Veri tabanı ve Tabloyu oluştur
CREATE DATABASE LibraryDB;

DROP TABLE IF EXISTS books;

CREATE TABLE books (
    book_id INT PRIMARY KEY IDENTITY, --Hem artan hemde benzersiz int değerinde bir sütun
    Title NVARCHAR(255) NOT NULL, -- Türkçe karakter desteği veriyor yani unicode'un N'si anlamına geliyor
    Author NVARCHAR(255) NOT NULL,
    Genre NVARCHAR(50),
    Price DECIMAL(10,2) CHECK(Price > 0),-- 10luk tabanda olacak ve maximum 10 haneli olacak virgülden sonra 2 basamak yazılacak ve 0'dan büyük olacak
    Stock INT CHECK (Stock >= 0),
    Published_year INT CHECK (Published_year BETWEEN 1900 AND 2025),
    Added_at DATE
);
--2.GÖrev Tabloya Verileri Ekle
 INSERT INTO books ( Title, Author, Genre, Price, Stock, published_year, added_at)VALUES
('Kayıp Zamanın İzinde','M. Proust',	'roman', 129.90, 25, 1913, '2025-08-20'),
('Simyacı',	'P. Coelho',	'roman',	89.50,	40,	1988,	'2025-08-21'),
('Sapiens',	'Y. N. Harari','tarih',	159.00,	18,	2011,	'2025-08-25'),
('İnce Memed', 'Y. Kemal', 'roman', 99.90, 12, 1955, '2025-08-22'),
('Körlük', 'J. Saramago','roman',119.00,7,1995,'2025-08-28'),
('Dune','F. Herbert', 'bilim',149.00,30,1965,'2025-09-01'),
('Hayvan Çiftliği', 'G. Orwell','roman',79.90,55,1945,'2025-08-23'),
('1984','G. Orwell','roman',99.00,35,1949,'2025-08-24'),
('Nutuk', 'M. K. Atatürk', 'tarih',139.00, 20, 1927, '2025-08-27'),
('Küçük Prens', 'A. de Saint-Exupéry', 'çocuk',69.90,80,1943,'2025-08-26'),
('Başlangıç', 'D. Brown', 'roman', 109.00,22,2017,'2025-09-02'),
('Atomik Alışkanlıklar','J. Clear', 'kişisel gelişim',129.00,28,2018,'2025-09-03'),
('Zamanın Kısa Tarihi','S. Hawking','bilim',119.50,16,1988,'2025-08-29'),
('Şeker Portakalı','J. M. de Vasconcelos', 'roman',84.90,45,1968,'2025-08-30'),
('Bir İdam Mahkûmunun Son Günü','V. Hugo','roman',74.90,26,1929,'2025-08-31');
--Mevcut tarihi alacaksak GETDATE() fonksiyonu kullanılır

--3.Görevler -Yalnızca Filtreleme(SELECT)
--1.Tüm kitapların title,author,price alanlarını fiyatı artan şekilde sıralayarak listeleyin
SELECT Title,Author,Price
FROM books
ORDER BY Price ASC; --ASC: Artan

--2.Türü 'roman' olan kitapların A->Z title sırasıyla gösterin
SELECT *
FROM books
WHERE Genre = N'roman' --Burada koyma sebebimiz unicode olması için
ORDER BY Title ASC; --Artan şekilde

--3.Fiyatı 80 ile 120 (dahil) arasındaki kitapları listeleyin(BETWEEN)
SELECT *
FROM books
WHERE Price BETWEEN 80 AND 120;

--4.Stok adedi 20'den az olan kitapları bulun (title, stock_qty)
SELECT Title, Stock
FROM books
WHERE Stock < 20;

--5. title içinde 'zaman' geçen kitapları LIKE ile filtreleyin (büyük/küçük harf durumunu not edin)
SELECT *
FROM books
WHERE Title LIKE '%zaman%'; --Metin içinde arama yapmak için kullanılır.

--6. genre değeri 'roman' veya 'bilim' olanları IN ile listeleyin.
SELECT *
FROM books
WHERE Genre IN ('roman','bilim'); --Bir sütunun birden fazla değere sahip olup olmadığını kontrol eder.

--7. published_year değeri 2000 ve sonrası olan kitapları, en yeni yıldan eskiyw doğru sıralayın
SELECT *
FROM books
WHERE Published_year >= 2000
ORDER BY Published_year DESC; --Azalan şekilde

--8. Son 10 gün içinde eklenen kitapları bulun (added_at tarihine göre)
SELECT *
FROM books
WHERE added_at >= DATEADD(DAY,-10,GETDATE()); --Tarih işlemleri için kullanılır.

--9. En pahalı 5 kitabı price azalan sırada listeleyin (LIMIT 5)
SELECT TOP 5 *
FROM books
ORDER BY price DESC;

--10. Stok adedi 30 ile 60 arasında olan kitapları price artan şekilde sıralayın
SELECT *
FROM books
WHERE Stock BETWEEN 30 AND 60
ORDER BY Price ASC;