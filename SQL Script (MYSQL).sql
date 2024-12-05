
-- Create Database:
CREATE DATABASE walmart;
USE walmart;
CREATE TABLE walmart_data (
    User_ID INT,
    Product_ID VARCHAR(255),
    Gender VARCHAR(10),
    Age VARCHAR(10),
    Occupation INT,
    City_Category VARCHAR(5),
    Stay_In_Current_City_Years VARCHAR(5),
    Marital_Status INT,
    Product_Category INT,
    Purchase DECIMAL(10,2)
);

LOAD DATA LOCAL INFILE '.../walmart_data.csv' 
INTO TABLE walmart.walmart_data 
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(User_ID, Product_ID, Gender, Age, Occupation, City_Category, Stay_In_Current_City_Years, Marital_Status, 
Product_Category, Purchase);


-- Here, we'll first look at the Walmart dataset. We'll check some rows to understand what the data looks like.

select * from walmart.walmart_data limit 10;


-- We'll also see how many rows and columns are there, what types of data we have, and what each column is called.

select column_name , data_type
from information_schema.columns 
where table_name = 'walmart_data'
  and table_schema = 'walmart';

select  count(*) as Number_of_column
from information_schema.columns 
where table_name = 'walmart_data'
  and table_schema = 'walmart';

select count(*) as Number_of_Rows from walmart.walmart_data;


-- Finding Unique Values
select
count(distinct Gender) as Unique_Values_of_Gender
,count(distinct Age) as Unique_Values_of_Age
,count(distinct Occupation) as Unique_Values_of_Occupation
,count(distinct City_Category) as Unique_Values_of_City_Category
,count(distinct Stay_In_Current_City_Years) as Unique_Values_of_Stay_In_Current_City_Years
,count(distinct Marital_Status) as Unique_Values_of_Marital_Status
,count(distinct Product_Category) as Unique_Values_of_Product_Category
from walmart.walmart_data;

select Gender
from walmart.walmart_data
group by Gender
order by 1;

SELECT Age
FROM walmart.walmart_data
GROUP BY Age
order by 1;

SELECT Occupation
FROM walmart.walmart_data
GROUP BY Occupation
order by 1;

SELECT City_Category
FROM walmart.walmart_data
GROUP BY City_Category
order by 1;

SELECT Stay_In_Current_City_Years
FROM walmart.walmart_data
GROUP BY Stay_In_Current_City_Years
order by 1;

SELECT Marital_Status
FROM walmart.walmart_data
GROUP BY Marital_Status
order by 1;

SELECT Product_Category
FROM walmart.walmart_data
GROUP BY Product_Category
order by 1;

-- Statistical Summary
-- Here, we'll look at some statistics of the data. This includes Total Number of Customers, 
-- Total Number of transactions, Average Number of Transactnios per Customer. Total Purchase Amount, 
-- Avergae Purchase Amount per Transaction ans per Customer, Minimum and Maximum Purchase

select 
format(count(distinct User_ID),0) as Number_of_Customers,  
format(count(User_ID), 0) as Number_of_Transactions,
format(count(User_ID)  / count(distinct User_ID),1) as Average_Number_of_Transactions,
concat('$', format(sum(Purchase),0)) as Total_Purchase,
concat('$', format(sum(Purchase) / count(User_ID),0)) as Average_Purchase_Per_Transaction,
concat('$', format(sum(Purchase) / count(distinct User_ID),0)) as Average_Purchase_Per_Customer,
concat('$', format(min(Purchase),0)) as Min_Purchase,
concat('$', format(max(Purchase),0)) as Max_Purchase
from walmart.walmart_data;
    
-- We will look at the same metrics on various level including
-- Gender, Age, Occupation, City, Stay_In_Current_City_Years, Marital_Status, Product_Category
-- Additioanaly , we analyze the percentage distribution of transactions accross above categories.

-- Gender
select Gender,
format(count(distinct User_ID),0) as Number_of_Customers,  
CONCAT(ROUND((COUNT(distinct User_ID) / (SELECT COUNT(distinct User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Customers,
format(count(User_ID), 0) as Number_of_Transactions,
CONCAT(ROUND((COUNT(User_ID) / (SELECT COUNT(User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Transactions,
format(count(User_ID)  / count(distinct User_ID),1) as Average_Number_of_Transactions,
concat('$', format(sum(Purchase),0)) as Total_Purchase,
CONCAT(ROUND((sum(Purchase) / (SELECT sum(Purchase) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Purchase,
concat('$', format(sum(Purchase) / count(User_ID),0)) as Average_Purchase_Per_Transaction,
concat('$', format(sum(Purchase) / count(distinct User_ID),0)) as Average_Purchase_Per_Customer,
concat('$', format(min(Purchase),0)) as Min_Purchase,
concat('$', format(max(Purchase),0)) as Max_Purchase
from walmart.walmart_data
group by Gender;

--Age
select Age,
format(count(distinct User_ID),0) as Number_of_Customers,  
CONCAT(ROUND((COUNT(distinct User_ID) / (SELECT COUNT(distinct User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Customers,
format(count(User_ID), 0) as Number_of_Transactions,
CONCAT(ROUND((COUNT(User_ID) / (SELECT COUNT(User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Transactions,
format(count(User_ID)  / count(distinct User_ID),1) as Average_Number_of_Transactions,
concat('$', format(sum(Purchase),0)) as Total_Purchase,
CONCAT(ROUND((sum(Purchase) / (SELECT sum(Purchase) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Purchase,
concat('$', format(sum(Purchase) / count(User_ID),0)) as Average_Purchase_Per_Transaction,
concat('$', format(sum(Purchase) / count(distinct User_ID),0)) as Average_Purchase_Per_Customer,
concat('$', format(min(Purchase),0)) as Min_Purchase,
concat('$', format(max(Purchase),0)) as Max_Purchase
from walmart.walmart_data
group by Age;


--Occupation
select Occupation,
format(count(distinct User_ID),0) as Number_of_Customers,  
CONCAT(ROUND((COUNT(distinct User_ID) / (SELECT COUNT(distinct User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Customers,
format(count(User_ID), 0) as Number_of_Transactions,
CONCAT(ROUND((COUNT(User_ID) / (SELECT COUNT(User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Transactions,
format(count(User_ID)  / count(distinct User_ID),1) as Average_Number_of_Transactions,
concat('$', format(sum(Purchase),0)) as Total_Purchase,
CONCAT(ROUND((sum(Purchase) / (SELECT sum(Purchase) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Purchase,
concat('$', format(sum(Purchase) / count(User_ID),0)) as Average_Purchase_Per_Transaction,
concat('$', format(sum(Purchase) / count(distinct User_ID),0)) as Average_Purchase_Per_Customer,
concat('$', format(min(Purchase),0)) as Min_Purchase,
concat('$', format(max(Purchase),0)) as Max_Purchase
from walmart.walmart_data
group by Occupation;

-- City Category
select City_Category,
format(count(distinct User_ID),0) as Number_of_Customers,  
CONCAT(ROUND((COUNT(distinct User_ID) / (SELECT COUNT(distinct User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Customers,
format(count(User_ID), 0) as Number_of_Transactions,
CONCAT(ROUND((COUNT(User_ID) / (SELECT COUNT(User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Transactions,
format(count(User_ID)  / count(distinct User_ID),1) as Average_Number_of_Transactions,
concat('$', format(sum(Purchase),0)) as Total_Purchase,
CONCAT(ROUND((sum(Purchase) / (SELECT sum(Purchase) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Purchase,
concat('$', format(sum(Purchase) / count(User_ID),0)) as Average_Purchase_Per_Transaction,
concat('$', format(sum(Purchase) / count(distinct User_ID),0)) as Average_Purchase_Per_Customer,
concat('$', format(min(Purchase),0)) as Min_Purchase,
concat('$', format(max(Purchase),0)) as Max_Purchase
from walmart.walmart_data
group by City_Category;

-- Stay in Current City Years
select Stay_In_Current_City_Years,
format(count(distinct User_ID),0) as Number_of_Customers,  
CONCAT(ROUND((COUNT(distinct User_ID) / (SELECT COUNT(distinct User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Customers,
format(count(User_ID), 0) as Number_of_Transactions,
CONCAT(ROUND((COUNT(User_ID) / (SELECT COUNT(User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Transactions,
format(count(User_ID)  / count(distinct User_ID),1) as Average_Number_of_Transactions,
concat('$', format(sum(Purchase),0)) as Total_Purchase,
CONCAT(ROUND((sum(Purchase) / (SELECT sum(Purchase) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Purchase,
concat('$', format(sum(Purchase) / count(User_ID),0)) as Average_Purchase_Per_Transaction,
concat('$', format(sum(Purchase) / count(distinct User_ID),0)) as Average_Purchase_Per_Customer,
concat('$', format(min(Purchase),0)) as Min_Purchase,
concat('$', format(max(Purchase),0)) as Max_Purchase
from walmart.walmart_data
group by Stay_In_Current_City_Years;


-- Marital Status
select Marital_Status,
format(count(distinct User_ID),0) as Number_of_Customers,  
CONCAT(ROUND((COUNT(distinct User_ID) / (SELECT COUNT(distinct User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Customers,
format(count(User_ID), 0) as Number_of_Transactions,
CONCAT(ROUND((COUNT(User_ID) / (SELECT COUNT(User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Transactions,
format(count(User_ID)  / count(distinct User_ID),1) as Average_Number_of_Transactions,
concat('$', format(sum(Purchase),0)) as Total_Purchase,
CONCAT(ROUND((sum(Purchase) / (SELECT sum(Purchase) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Purchase,
concat('$', format(sum(Purchase) / count(User_ID),0)) as Average_Purchase_Per_Transaction,
concat('$', format(sum(Purchase) / count(distinct User_ID),0)) as Average_Purchase_Per_Customer,
concat('$', format(min(Purchase),0)) as Min_Purchase,
concat('$', format(max(Purchase),0)) as Max_Purchase
from walmart.walmart_data
group by Marital_Status;


-- Product Category

select Product_Category,
format(count(distinct User_ID),0) as Number_of_Customers,  
CONCAT(ROUND((COUNT(distinct User_ID) / (SELECT COUNT(distinct User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Customers,
format(count(User_ID), 0) as Number_of_Transactions,
CONCAT(ROUND((COUNT(User_ID) / (SELECT COUNT(User_ID) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Transactions,
format(count(User_ID)  / count(distinct User_ID),1) as Average_Number_of_Transactions,
concat('$', format(sum(Purchase),0)) as Total_Purchase,
CONCAT(ROUND((sum(Purchase) / (SELECT sum(Purchase) FROM walmart.walmart_data)) * 100, 1), '%') AS Percentage_Purchase,
concat('$', format(sum(Purchase) / count(User_ID),0)) as Average_Purchase_Per_Transaction,
concat('$', format(sum(Purchase) / count(distinct User_ID),0)) as Average_Purchase_Per_Customer,
concat('$', format(min(Purchase),0)) as Min_Purchase,
concat('$', format(max(Purchase),0)) as Max_Purchase
from walmart.walmart_data
group by Product_Category
order by count(distinct User_ID) desc;





