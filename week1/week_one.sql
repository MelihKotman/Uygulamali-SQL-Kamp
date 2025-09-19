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
FROM customers;

--Örnek-2 Customer tablosundaki customerID,CompanyName,City sütunlarını getiren sorguyu yazınız.
SELECT customer_id,company_name,city
FROM customers;

--Filtreleme (WHERE)
--Örnek-3 Customer tablosundan ülkeleri getir
SELECT country
FROM customers;

--Örnek-4 Customer tablpsundan ülkesi 'Germany' olanları getir
SELECT *
FROM customers
WHERE country = 'Germany';

--Örnek-5 Bİrim fiyatı 50 doların üzerinde olan ürünleri getiren sorguyu yazınız.
SELECT *
FROM order_details
WHERE unit_price > 50;

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
from order_details
WHERE product_id = 11;

--Örnek-7 Employee tablosundaki first_name ile last_name birleştirme yaptıktan sonra Full Name oluşturalım.
/*
 *SELECT first_name + ' ' + last_name as [Full Name]
 *FROM employees;
 */
SELECT first_name || ' ' || last_name AS "Full Name"
FROM employees;

-- isim sütunu oluştur ve içine isim ve soyisim yaz
--SELECT 'Melih' + ' ' + 'Kotman' AS isim;

--İşlemler
SELECT 10+2;
SELECT 10-2;
SELECT 10*9;
SELECT 10/2 as sonuc;

--Örnek-8 Ürünlerin KDV'li(1.20 ile hesaplayın) fiyatını hesaplayarak listeleyen sorguyu yazınız.
SELECT product_id,product_name,unit_price,unit_price * 1.20 AS "KDV'li Fiyat"
FROM products;

--Örnek-9 Bir numaralı tedarikçiye ait ürünleri getiren sorguyu yazınız.
SELECT *
FROM suppliers
WHERE supplier_id = 1;

--Örnek-10 10248 numaralı sipariş detaylarını getiren sorguyu yazınız.
SELECT * FROM orders
WHERE order_id = 10248;

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
FROM products
WHERE unit_price > 20 AND category_id = 1;

--Örnek-12 Berlin veya Amerika'da müşterileri getiren sorguyu yazınız.
SELECT *
FROM customers
WHERE city = 'Berlin' OR country = 'USA';

--Örnek-13 5 numarali çalışanın 1998'den sonra aldığı siparişleri getiren sorguyu yazınız.
SELECT *
FROM orders
WHERE order_date > '01-01-1998' AND employee_id = 5;

--Örnek-14 Customers tablosundan CompanyName,Country,City sütunlarından ya İngiltere'de London veya Oxford ya da Amerika'dan olanları getir
SELECT company_name,country,city
FROM customers
WHERE (country = 'UK' and (city = 'Oxford' or city = 'London')) or country = 'USA';

--Örnek-15 1 veya 2 numaralı tedarikçilerin birim fiyatı 10 dolardan pahalı olan ürünleri getir.
SELECT *
FROM products
WHERE (supplier_id = 1 or supplier_id = 2) and unit_price > 10;