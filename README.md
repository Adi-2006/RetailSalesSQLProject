# Retail Sales Anaysis SQL Project

## Project Overview

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set Up a Retail Sales Database:** Create and populate a retail sales database using the provided sales data.
 
2. **Data Cleaning:** Identify and remove any records containing missing or null values to ensure data integrity.
  
3. **Exploratory Data Analysis (EDA):**  Perform basic EDA to understand the structure, distribution, and trends in the dataset.
 
4. **Business Analysis with SQL:**  Use SQL to answer key business questions and derive actionable insights from the retail sales data. 

## 1. Database Setup

### 📁 Database Creation
The project begins by creating a database named `sql_project_p1`.

### 🧱 Table Creation
A table named `retail_sales` is created to store the sales data. This table includes the following columns:

- `transactions_id`: Unique identifier for each transaction (Primary Key)
- `sale_date`: Date of the sale
- `sale_time`: Time of the sale
- `customer_id`: Unique ID of the customer
- `gender`: Gender of the customer
- `age`: Age of the customer
- `category`: Product category
- `quantiy`: Number of units sold 
- `price_per_unit`: Price per unit of the product
- `cogs`: Cost of goods sold
- `total_sale`: Total sale amount

### 🧾 SQL Code

```sql
-- Drop the table if it already exists
DROP TABLE retail_sales;

-- Create the retail_sales table
CREATE TABLE retail_sales(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(25),
    quantiy INT,  -- Consider fixing typo to 'quantity'
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```

## 2. Data Exploration & Cleaning

### 📊 Data Exploration Tasks

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are present.
- **Category Count**: Identify all unique product categories.

### 🧼 Null Value Handling

To ensure data quality, we check for any null or missing values and remove those records.

```sql
-- View the data
SELECT * FROM retail_sales;

-- Check for NULL values
SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL 
    OR transactions_id IS NULL
    OR sale_time IS NULL 
    OR customer_id IS NULL
    OR gender IS NULL
    OR category IS NULL
    OR quantiy IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;

-- Delete records with NULL values
DELETE FROM retail_sales
WHERE
    sale_date IS NULL 
    OR transactions_id IS NULL
    OR sale_time IS NULL 
    OR customer_id IS NULL
    OR gender IS NULL
    OR category IS NULL
    OR quantiy IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;
```


## 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions based on the retail sales dataset.

### 📌 SQL Queries

#### 1. Retrieve all columns for sales made on `2022-11-05`:
```sql
SELECT * FROM retail_sales WHERE sale_date = '2022-11-05';
```
#### 2. Transactions where the category is Clothing and quantity sold is more than 3 in November 2022:
```sql
SELECT * FROM retail_sales
WHERE category = 'Clothing' 
AND TO_CHAR(sale_date,'YYYY-MM') = '2022-11'
AND quantiy > 3;
```

#### 3. Calculate total sales (total_sale) and total orders for each category:
```sql
SELECT category,SUM(total_sale),COUNT(quantiy)
FROM retail_sales
GROUP BY category;
```

#### 4. Find the average age of customers who purchased items from the Beauty category:
```sql
SELECT ROUND(AVG(age), 2) AS avg_age 
FROM retail_sales 
WHERE category = 'Beauty';
```

#### 5. Find all transactions where total_sale is greater than 1000:
```sql
SELECT * FROM retail_sales WHERE total_sale > 1000;
```

#### 6. Find total number of transactions made by each gender in each category:
```sql
SELECT category, gender, COUNT(*) AS total_trans 
FROM retail_sales 
GROUP BY category, gender 
ORDER BY category;
```

#### 7. Calculate the average sale for each month and find the best-selling month per year:
```sql
SELECT year, month, avg_sale 
FROM (
    SELECT EXTRACT(YEAR FROM sale_date) AS year, 
           EXTRACT(MONTH FROM sale_date) AS month, 
           AVG(total_sale) AS avg_sale, 
           RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS rank 
    FROM retail_sales 
    GROUP BY year, month
) AS t1 
WHERE rank = 1;
```

#### 8. Find the top 5 customers based on the highest total sales:
```sql
SELECT customer_id, SUM(total_sale) AS total_sales 
FROM retail_sales 
GROUP BY customer_id 
ORDER BY total_sales DESC 
LIMIT 5;
```

#### 9. Number of unique customers who purchased items from each category:
```sql
SELECT category, COUNT(DISTINCT customer_id) AS cnt_unique_cs 
FROM retail_sales 
GROUP BY category;
```

#### 10. Create shifts and count number of orders per shift (Morning <12, Afternoon 12–17, Evening >17):
```sql
SELECT shift,COUNT(*) FROM (
SELECT *,
      CASE
	      WHEN EXTRACT (HOUR FROM sale_time) < 12 THEN 'Morning'
		  WHEN EXTRACT (HOUR FROM sale_time) BETWEEN 12 AND 17  THEN 'Afternoon'
		  ELSE 'Evening'
	  END AS shift
from retail_sales
) as t1
GROUP BY shift;
```

---

### Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with notable sales across categories like Clothing and Beauty.
- **High-Value Transactions**: Multiple transactions recorded total sales over 1000, indicating premium purchases.
- **Sales Trends**: Monthly average sales analysis highlights peak months, aiding seasonal sales strategy.
- **Customer Insights**: Identified top-spending customers and popular product categories.

---

### Reports

- **Sales Summary**: Detailed summary of total sales, customer demographics, and category-wise performance.
- **Trend Analysis**: Insights into monthly and shift-wise sales trends.
- **Customer Insights**: Top customers and unique customer count per category.

---

### 📞 Contact

Connect for suggestions: [LinkedIn](https://www.linkedin.com/in/aditya-kumar-dwivedi-3702552aa/)

Thank you for taking the time to explore this project! I hope it provides valuable insights and demonstrates effective use of SQL for retail sales analysis.




