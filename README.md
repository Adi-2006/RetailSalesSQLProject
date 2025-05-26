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

