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
