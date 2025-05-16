SELECT *
FROM VERI_TABANI.SEMA.DOSYA_ADI WITH(NOLOCK)

SELECT * --*burada tüm kolonların getirilmesini sağlar
From dbo.Customer_churn WITH(NOLOCK) --*MS SQL WİTH nolock önemli otomotik olarak koymuyor ama gerekli olabiliyor sistemi durduma görevi görüyor büyük sistemlerdeCustomer_churn


Select TOP 10 *
From dbo.Customer_churn WITH(NOLOCK)

--Seçili kolonların getirilmesi
SELECT
surname,
customerid,
geography,
age,
exited
From dbo.Customer_churn WITH(NOLOCK)


SELECT DISTINCT * --yıldız tüm kolonlar demek
FROM dbo.customer_churn WITH(NOLOCK)

SELECT COUNT(DISTINCT customerid)
FROM dbo.customer_gender WITH(NOLOCK)

SELECT Count(customerid)
FROM dbo.customer_gender WITH(NOLOCK)
--8990 - 8997 Customer_churn

--küçükten büyüğe 
SELECT * 
FROM dbo.customer_churn WITH(NOLOCK)
order by customerid --Default olarak ASC

SELECT * 
FROM dbo.customer_churn WITH(NOLOCK)
order by customerid ASC --küçükten büyüğe ascending

SELECT * 
FROM dbo.customer_churn WITH(NOLOCK)
order by customerid DESC --bu sıfırları almadı --büyükten küçüğe descanding


-----------
SELECT 
  rownumber,
  customerid,
  surname,
  age,
  balance,
  estimatedsalary
FROM 
	dbo.customer_churn WITH(NOLOCK)
order by --her zaman en sona yazılır orderbydan sonra herhangi bir şey yazamazsın
	Age,
    estimatedsalary DESC,
    balance DESC


SELECT 
  rownumber,
  customerid,
  surname,
  age,
  balance,
  estimatedsalary
FROM 
	dbo.customer_churn WITH(NOLOCK)
order by --her zaman en sona yazılır orderbydan sonra herhangi bir şey yazamazsın
	Age, balance DESC


SELECT 
  rownumber AS Sıra_no,
  customerid,
  surname,
  age,
  balance,
  estimatedsalary
FROM 
	dbo.customer_churn WITH(NOLOCK)
order by --her zaman en sona yazılır orderbydan sonra herhangi bir şey yazamazsın
	1, --güncellediğin isim çalışmıyor kod deüiştiğinde anlamıyor
	4, --age
    estimatedsalary DESC,
    5 DESC --balance


--filtreleme
SELECT 
customerid,
creditscore,
age,
geography,
isactivemember
FROM dbo.Customer_churn With(NOLOCK)
WHERE isactivemember =1


SELECT TOP 10
customerid,
creditscore,
age,
geography,
isactivemember,
balance
FROM dbo.Customer_churn With(NOLOCK)
Where isactivemember =1
order by balance DESC


SELECT
customerid,
creditscore,
age,
geography,
isactivemember,
balance
FROM dbo.Customer_churn With(NOLOCK)

where age <=40
ORDER by age ASC


SELECT *
FROM dbo.Customer_churn With(NOLOCK)
Where balance = 0 and isactivemember=1



SELECT customerid, surname, age, geography, balance
FROM dbo.Customer_churn With(NOLOCK)
Where (age>35 AND geography= 'France') --tek '' yapmalısın
       OR balance >50000;



SELECT customerid, surname, age, geography, balance
FROM dbo.Customer_churn With(NOLOCK)
Where (age>35 AND geography= 'France') --tek '' yapmalısın
       and balance >50000;


--yaşı 30dan büyük kredi skoru 300 ile 500 arası kişiler

SELECT customerid, surname, age, geography, balance, creditscore
FROM dbo.Customer_churn With(NOLOCK)
WHERE age>30 and (300<=creditscore and creditscore<=500)
ORDER by creditscore asc

SELECT COUNT(customerid) 
FROM dbo.Customer_churn With(NOLOCK)
WHERE age>30 and (300<=creditscore and creditscore<=500)


SELECT MAX(age) as MAX_YAS,
MIN(age) AS MIN_YAS,
MAX(creditscore) AS MAX_KS,
MIN(creditscore) AS MIN_KS
FROM dbo.Customer_churn With(NOLOCK)
WHERE age>30 and (300<=creditscore and creditscore<=500)


--
--betweenCustomer_churn
SELECT *
FROM dbo.Customer_churn With(NOLOCK)
where age>30 and (creditscore BETWEEN 300 and 500)


--kredi kartı olan aktif müşterilerden balansı 30k üstünde veya yaşı 18-32 arası olan kayıtlar

SELECT 
customerid,
creditscore,
age,
geography,
isactivemember,
balance
FROM dbo.customer_churn WITH(NOLOCK)
where isactivemember=1 and (balance>30000 or age BETWEEN 18 and 32)

SELECT COUNT(customerid)
FROM dbo.customer_churn WITH(NOLOCK)
where isactivemember=1 and (balance>30000 or age BETWEEN 18 and 32)


----like


select 
surname
FROM dbo.customer_churn WITH(NOLOCK)
WHERE
surname like '%oro%'


select 
surname
FROM dbo.customer_churn WITH(NOLOCK)
WHERE
surname like '%ova' --ova ile biten



select 
surname
FROM dbo.customer_churn WITH(NOLOCK)
WHERE
surname like '%o_a%' --ova ile biten



select 
surname
FROM dbo.customer_churn WITH(NOLOCK)
WHERE
surname like '%o[d,b]a%' --içerisinde oda oba geçen


select 
surname
FROM dbo.customer_churn WITH(NOLOCK)
WHERE
surname like '%o[b-d]a%' --içerisinde oda oba geçen;oba,oca,oda






----grouplama
--fonksiyonların kullanılması gerekiyor

SELECT
  age,
  COUNT(*) AS Adet,
  MAX(balance) max_balance,
  MIN(balance) min_balance
FROM dbo.customer_churn WITH(NOLOCK)
where 1=1 ---true=true where demek zorunda değildim dinamik quere olduğu için
GROUP BY
  age
order by --burada columnlara denk geliyor
  age asc

---aynı şey
SELECT
top 10
  age,
  COUNT(*) AS Adet,
  MAX(balance) max_balance,
  MIN(balance) min_balance
FROM dbo.customer_churn WITH(NOLOCK)
where balance <>0
GROUP BY
  age
order by 
  age asc,
  3 DESC

---
select geography,
COUNT(*) as musterisayısı
FROM dbo.customer_churn WITH(NOLOCK)
group by geography;



--ülkerin 30-42 yaş arası dağılım
SELECT
geography,
age,
COUNT(*) As Müsteri_Adet
FROM dbo.customer_churn WITH(NOLOCK)
where age BETWEEN 30 and 42
GROUP by age,
geography---group by yı yazmadığımda hata aldım;gruplama için gerekli
ORDER BY
1 desc,
2 ASC





SELECT
exited,
COUNT(*) as Kayıt_Sayısı,
COUNT(DISTINCT customerid) as Tekil_Müşteri_Ad_Sayısı,
COUNT(surname) as Soyad_adet
FROM dbo.customer_churn WITH(NOLOCK)

Where 1=1
GROUP by exited




--having ile filtre: müşteri sayısı 100den fazla olan ülkeler
--HAVING GROUP BY in WHERE clause g,b, düşünebilirisiniz.

SELECT 
geography,
COUNT(*) as Müşteri_sayısı
FROM dbo.customer_churn WITH(NOLOCK)
GROUP by geography
HAVING COUNT(*)>2000;




---ülekeye göre ortalama bakiye
SELECT
geography,
avg(balance) as Ortalama_Bakiye
FROM dbo.customer_churn WITH(NOLOCK)
GROUP by geography




----ülkeye göre toplam bakiye ve ortalama yaş
SELECT
geography,
sum(balance) as Toplam_Bakiye,
avg(age) AS Ort_yas
FROM dbo.customer_churn WITH(NOLOCK)

GROUP by geography


----------------------------------------------
--SUBQUERY
----------------------------------------------
SELECT subquery FROM

select * From Subquery

select * from tablo where (subquery)--yazış biçimleri


SELECT customerid, surname, balance
FROM dbo.customer_churn WITH(NOLOCK)
where balance > 62030


---ortlama karşılaştırması
SELECT customerid, surname, balance 
FROM dbo.customer_churn WITH(NOLOCK)
where balance>(
  SELECT avg(balance)
  FROM dbo.customer_churn WITH(NOLOCK)
	where geography='France'


  SELECT avg(balance)
  FROM dbo.customer_churn WITH(NOLOCK)
  where geography='France'


---cinsiyete göre aktif üyeleerin syaısını hesaplama
SELECT
  gender,
  count(*) as ActiveMembersCount
FROM dbo.customer_churn WITH(NOLOCK)
where customerid IN (SELECT customerid   FROM dbo.customer_churn WITH(NOLOCK) where isactivemember=1)
GROUP BY
  gender;


--In kullanımı
SELECT
  customerid, surname, age
FROM dbo.customer_churn WITH(NOLOCK)
where customerid IN (SELECT customerid   FROM dbo.customer_churn);

 
--NOt in 
--In kullanımı
SELECT
  customerid, surname, age
FROM dbo.customer_churn WITH(NOLOCK)
where customerid NOT IN (SELECT customerid   FROM dbo.customer_churn);


SELECT
  customerid, surname, age
FROM dbo.customer_churn WITH(NOLOCK)
where customerid NOT IN (select customerid from Customer_gender where gender = 'Male')---join python
  
  

--müşterilerin cinsiyetine göre ortalama kredi puanı hesaplama
  --subquery sorgu içinde sorgu yazmaya yardımcı olur
  --biraz komplex
SELECT
  gender,
  (SELECT avg(creditscore)
  FROM dbo.customer_churn AS cc
  where cc.CustomerId IN 
  (select customerid from dbo.Customer_gender where gender = cg.Gender)
  )as averagecreditscore
FROM dbo.customer_gender AS cg
GROUP BY
  gender;
  
  
select gender
FROM dbo.customer_gender as cg
GROUP BY
  gender;
  
  
---cinsiyete göre aktif üyelerin sayısını hesaplamama
SELECT
  gender,
  (SELECT Count(*)
  FROM dbo.customer_churn AS cc
  where cc.CustomerId IN 
  (select customerid from dbo.Customer_gender where gender = cg.Gender)
  )as averagecreditscore
FROM dbo.customer_gender AS cg
GROUP BY
  gender;  
  

  
  
-----exist nonexist
  
  --exist:cinsiyeti olan müşteriler
SELECT customer id, surname
from dbo.customer_churn c
where exists (
	select 1 from dbo.customer_gender g)
  	where g.customerId=c.customerId
  
  --exist:cinsiyeti olan müşteriler
SELECT customer id, surname
from dbo.customer_churn c
where NOT exists (
	select 1 from dbo.customer_gender g)
  	where g.customerId=c.customerId
  
  
 SELECT
  geography,
  avg(creditscore) as avr_credistcore,
  sum(estimatedsalary) as est_salary
from dbo.customer_churn as cc  
GROUP BY
  geography;
  
 

SELECT getdate()  
  