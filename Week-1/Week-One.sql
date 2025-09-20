--Tekli yorum satırı
/*
 * Çoklu yorum satırı
 */
/*
İlişkisel Veri tabanı nedir?
Verilerin birbiyle ilişkili tablolarda tutuldupu veri tabanı modelidir.

Tablo nedir?
Verilerin satır ve sütun olarak tutulduğu yapıdır

Sütun ve Satır nedit?
Sütun, tablodaki dikey alanlardır. Belirli bir veri türündeki bilgiyi verir.
Satır ise tablodaki yatay kayıttır. Bir varlığa ait bilgileri içerir.

Primary Key nedir?
Tablodaki verileri benzersiz olarak tanımlamamıza olanak sağlar.

Foreign Key nedir?
Bİr tablodaki verinin başka bir tablodaki veriye referans sağlar

DDL: Veri tabanı nesnelerini oluşturmamızı sağlar.
DML: Tabloda veri manipülasyonu yapmak için kullanılır.
Dql: Veri tabanı sorgulamamıza olanak sağlar.
DCL: Veri tabanını kullanıcılarına erişim yetkileri vermek veya almak için kullanılır.
*/

--Örnek-1 Customer tablosundaki bütün verileri getir
SELECT *
FROM Customers;

--Örnek-2 Customer tablosundaki customerID,CompanyName,City sütunlarını getiren sorguyu yazınız.
SELECT CustomerID,CompanyName,city
FROM Customers;

--Filtreleme (WHERE)
--Örnek-3 Customer tablosundan ülkeleri getir
SELECT country
FROM Customers;

--Örnek-4 Customer tablpsundan ülkesi 'Germany' olanları getir
SELECT *
FROM Customers
WHERE country = 'Germany';

--Örnek-5 Bİrim fiyatı 50 doların üzerinde olan ürünleri getiren sorguyu yazınız.
SELECT *
FROM [Order Details]
WHERE UnitPrice > 50;

/*
 Karşılaştırma Operatörleri
 = -> eşittir
 != -> eşit değildir
 > -> büyüktür
 < -> küçüktür
 >= -> büyük eşittir
 <= -> küçük eşittir
 */

 --Örnek-6 11 numaralı üründen sipariş verilen siparişlerin ID'lerini getiren sorguyu yazınız.
SELECT *
from [Order Details]
WHERE ProductID = 11;

--Örnek-7 Employee tablosundaki first_name ile last_name birleştirme yaptıktan sonra Full Name oluşturalım.
SELECT FirstName + ' ' + LastName as [Full Name]
FROM employees;


-- isim sütunu oluştur ve içine isim ve soyisim yaz
SELECT 'Melih' + ' ' + 'Kotman' AS isim;

--İşlemler
SELECT 10+2;
SELECT 10-2;
SELECT 10*9;
SELECT 10/2 as sonuc;

--Örnek-8 Ürünlerin KDV'li(1.20 ile hesaplayın) fiyatını hesaplayarak listeleyen sorguyu yazınız.
SELECT ProductID,ProductName,UnitPrice,UnitPrice * 1.20 AS [KDV'li Fiyat]
FROM Products;

--Örnek-9 Bir numaralı tedarikçiye ait ürünleri getiren sorguyu yazınız.
SELECT *
FROM Suppliers
WHERE SupplierID = 1;

--Örnek-10 10248 numaralı sipariş detaylarını getiren sorguyu yazınız.
SELECT *
FROM Orders
WHERE OrderID = 10248;

/*
 AND Operatörü
 A B  C
 0 0  0
 0 1  0
 1 0  0
 1 1  1
 OR Operatörü
 A B  C
 0 0  0
 0 1  1
 1 0  1
 1 1  1
 NOT Operatörü
 A A'
 0 1
 1 0
*/

--Örnek-11 Birim fiyatı 20 dolardan büyük ve kategori ID'si 1 olan ürünleri getir.
SELECT *
FROM Products
WHERE UnitPrice > 20 AND CategoryID = 1;

--Örnek-12 Berlin veya Amerika'da müşterileri getiren sorguyu yazınız.
SELECT *
FROM Customers
WHERE city = 'Berlin' OR country = 'USA';

--Örnek-13 5 numarali çalışanın 1998'den sonra aldığı siparişleri getiren sorguyu yazınız.
SELECT *
FROM Orders
WHERE OrderDate > '01-01-1998' AND EmployeeID = 5;

--Örnek-14 Customers tablosundan CompanyName,Country,City sütunlarından ya İngiltere'de London veya Oxford ya da Amerika'dan olanları getir
SELECT CompanyName,country,city
FROM Customers
WHERE (country = 'UK' and (city = 'Oxford' or city = 'London')) or country = 'USA';

--Örnek-15 1 veya 2 numaralı tedarikçilerin birim fiyatı 10 dolardan pahalı olan ürünleri getir.
SELECT *
FROM Products
WHERE (SupplierID = 1 or SupplierID = 2) and UnitPrice > 10;