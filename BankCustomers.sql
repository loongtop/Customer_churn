create database BankCustomers;

use BankCustomers;


CREATE TABLE Customers (
                           RowNumber INT PRIMARY KEY,
                           CustomerId INT UNIQUE,
                           Surname VARCHAR(50),
                           CreditScore INT,
                           Geography VARCHAR(50),
                           Gender VARCHAR(10),
                           Age INT,
                           Tenure INT,
                           Balance DECIMAL(12,2),
                           NumOfProducts INT,
                           HasCrCard BOOLEAN,
                           IsActiveMember BOOLEAN,
                           EstimatedSalary DECIMAL(12,2),
                           Exited BOOLEAN,
                           Complain BOOLEAN,
                           SatisfactionScore INT,
                           CardType VARCHAR(20),
                           PointEarned INT
);


Describe Customers;

SHOW CREATE TABLE Customers;

select * from Customers limit 10;

SELECT
    COUNT(*) - COUNT(CustomerId) AS CustomerId_Null_Count,
    COUNT(*) - COUNT(Surname) AS Surname_Null_Count,
    COUNT(*) - COUNT(CreditScore) AS CreditScore_Null_Count,
    COUNT(*) - COUNT(Geography) AS Geography_Null_Count,
    COUNT(*) - COUNT(Gender) AS Gender_Null_Count,
    COUNT(*) - COUNT(Age) AS Age_Null_Count,
    COUNT(*) - COUNT(Tenure) AS Tenure_Null_Count,
    COUNT(*) - COUNT(Balance) AS Balance_Null_Count,
    COUNT(*) - COUNT(NumOfProducts) AS NumOfProducts_Null_Count,
    COUNT(*) - COUNT(HasCrCard) AS HasCrCard_Null_Count,
    COUNT(*) - COUNT(IsActiveMember) AS IsActiveMember_Null_Count,
    COUNT(*) - COUNT(EstimatedSalary) AS EstimatedSalary_Null_Count,
    COUNT(*) - COUNT(Exited) AS Exited_Null_Count,
    COUNT(*) - COUNT(Complain) AS Complain_Null_Count,
    COUNT(*) - COUNT(SatisfactionScore) AS SatisfactionScore_Null_Count,
    COUNT(*) - COUNT(CardType) AS CardType_Null_Count,
    COUNT(*) - COUNT(PointEarned) AS PointEarned_Null_Count
FROM Customers;


Select CustomerId, Surname, Gender, Age,
        count(*) as DuplicateCount
from Customers
group by CustomerId, Surname, Gender, Age
having count(*) > 1;


SELECT
    COUNT(*) AS total,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned,
    SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS not_churned,
    SUM(CASE WHEN Exited NOT IN (0, 1) THEN 1 ELSE 0 END) AS unknown
FROM Customers;


Select IsActiveMember,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned,
       SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS not_churned
from Customers
group by IsActiveMember;


Select Gender AS gender,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned,
       SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS not_churned,
       count(Gender) as cnt
from Customers
group by gender;


Select Geography AS geography,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned,
       SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS not_churned,
       count(Geography) as cnt
from Customers
group by Geography;

SELECT
    CASE
        WHEN age <= 20 THEN '0-20'
        WHEN age <= 30 THEN '21-30'
        WHEN age <= 40 THEN '31-40'
        WHEN age <= 50 THEN '41-50'
        WHEN age <= 60 THEN '51-60'
        ELSE '61-100'
        END AS age_category,
    COUNT(CASE WHEN exited = 1 then 1 end) as Churn,
    COUNT(CASE WHEN exited = 0 then 1 end) as Not_Churn,
    COUNT(*) AS cnt
FROM Customers
GROUP BY 1
ORDER BY 1



SELECT
    CASE
        WHEN CreditScore <= 580 THEN 'Low'
        WHEN CreditScore <= 670 THEN 'Medium'
        WHEN CreditScore <= 750 THEN 'High'
        ELSE 'Very High'
        END
    AS CreditCategory,
    COUNT(CASE WHEN exited = 1 then 1 end) as Churn,
    COUNT(CASE WHEN exited = 0 then 1 end) as Not_Churn,
    COUNT(*) AS cnt
FROM Customers
group by CreditCategory;




SELECT
    CASE
        WHEN numofproducts = 1  THEN 1
        WHEN numofproducts = 2  THEN 2
        WHEN numofproducts = 3 THEN 3
        WHEN numofproducts = 4 THEN 4
        END
    AS numofproducts,
    COUNT(CASE WHEN exited = 1 then 1 end) as Churn,
    COUNT(CASE WHEN exited = 0 then 1 end) as Not_Churn,
    COUNT(*) AS cnt
FROM Customers
GROUP BY 1
ORDER BY 1


SELECT
    CASE
        WHEN SatisfactionScore = 1  THEN 1
        WHEN SatisfactionScore = 2  THEN 2
        WHEN SatisfactionScore = 3 THEN 3
        WHEN SatisfactionScore = 4 THEN 4
        WHEN SatisfactionScore = 5 THEN 5
        END
    AS SatisfactionScore,
    COUNT(CASE WHEN exited = 1 then 1 end) as Churn,
    COUNT(CASE WHEN exited = 0 then 1 end) as Not_Churn,
    COUNT(*) AS cnt
FROM Customers
GROUP BY 1
ORDER BY 1


select hascrcard,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned,
       SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS not_churned,
       count(*) as cnt
from Customers
group by hascrcard

Select CardType
         ,SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned
         ,SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS not_churned
         ,count(*) as cnt
from Customers
group by CardType

Select CASE
            when PointEarned <= 200 then '0-200'
            when PointEarned <= 400 then '200-400'
            when PointEarned <= 600 then '400-600'
            when PointEarned <= 800 then '600-800'
            when PointEarned <= 1000 then '800-1000'
            else '1000-2000'
    end as PointEarned
     ,SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned
     ,SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS not_churned
     ,count(*) as cnt
from Customers
group by 1
order by 1;
