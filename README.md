# Walmart---Black-Friday-Purchases---MYSQL
Analyzed customer purchase behavior using SQL to uncover trends in transactions, customer habits, and product sales.

This project analyzes customer purchase behavior during Walmart's Black Friday sales to help the business make informed decisions. Specifically, it focuses on whether spending habits differ based on gender and other factors, such as age, occupation, and city category.

# Dataset
The dataset contains Walmart customer transactions during Black Friday, with key features such as User_ID, Product_ID, Gender, Age, Occupation, City_Category, Stay_In_Current_City_Years, Marital_Status, Product_Category, and Purchase.

# SQL Queries
The SQL queries in this project include:
- Loading data into MySQL WorkBench from a CSV file.
- Exploring the dataset and calculating summary statistics.
- Analyzing spending patterns based on various customer attributes (gender, age, occupation, etc.).
- Aggregating purchase metrics like total purchase, average transaction value, and customer segmentation.

# Key Analysis
- Customer Segmentation: Count of unique customers by attributes such as gender, age, occupation, and more.
- Purchase Analysis: Calculating total purchases, average transactions, and distribution of spending across customer groups.
- Insights: Identify trends, such as whether women spend more than men during Black Friday, and customer behavior across different age groups and city categories.

# Key Insights

- For the Age feature, we observed that around 80% of customers who fall within the 25-40 age group account for the highest spending. Specifically, 40% of these customers are aged 26-35, 18% are aged 18-25, and 20% are aged 36-45.
- Regarding the Gender feature, approximately 75% of purchases are made by male customers, while the remaining 25% are by female customers. This suggests that men are the primary contributors to sales for the retail store. On average, male customers spend more than female customers, a trend that can be confirmed by examining total purchase values:
- Average spending by male customers: 9,25,408.28
- Average spending by female customers: 7,12,217.18
- When analyzing the relationship between Purchase and Marital Status (60% are single, 40% are married)
- An interesting finding from the Stay_In_Current_City_Years column revealed that people who have lived in the city for one year tend to spend the most. This makes sense, as those who have been in the city for more than four years are typically more settled and purchase fewer items compared to newer residents, who tend to buy more. Specifically, 35% of the sample have lived in the city for one year, 18% for two years, and 17% for three years.
- Looking at the City_Category feature, we were surprised to discover that although City B contributes the most to overall sales, City C shows the highest purchases for this particular product.
- There are 20 product categories in total, with Product Categories 1, 5, 8, and 11 having the highest purchasing frequency.
- There are 20 different types of occupations in the city.
