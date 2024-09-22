

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


LOAD DATA LOCAL INFILE 'C:/Users/cagri/Desktop/walmart_data.csv' 
INTO TABLE walmart.walmart_data 
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(User_ID, Product_ID, Gender, Age, Occupation, City_Category, Stay_In_Current_City_Years, Marital_Status, 
Product_Category, Purchase);

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


