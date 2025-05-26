-- SQL Retail Sales Analysis -P1


-- Creating The table
DROP TABLE retail_sales;
CREATE TABLE retail_sales(
		  transactions_id INT PRIMARY KEY,
		  sale_date	DATE,
		  sale_time	TIME,
		  customer_id INT,	
		  gender VARCHAR(15),	
		  age INT,
		  category VARCHAR(25),
		  quantiy INT,
		  price_per_unit FLOAT,	
		  cogs FLOAT,
		  total_sale FLOAT
);
SELECT * from retail_sales;

-- Cheecking The null values
SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL 
	OR
	transactions_id IS NULL
	OR sale_time IS NULL 
	OR customer_id IS NULL
	OR gender IS NUll
	OR category IS Null
	OR quantiy IS Null
	OR price_per_unit IS NULL
	OR cogs IS NULL
	OR total_sale IS NULL;

-- Deleting The Null Values

DELETE FROM retail_sales
WHERE
 sale_date IS NULL 
	OR
	transactions_id IS NULL
	OR sale_time IS NULL 
	OR customer_id IS NULL
	OR gender IS NUll
	OR category IS Null
	OR quantiy IS Null
	OR price_per_unit IS NULL
	OR cogs IS NULL
	OR total_sale IS NULL;



-- Data Exploration

-- How many Sales We have:1997
SELECT COUNT(*) from retail_sales;

-- No. of Unique Customers :155
SELECT COUNT(DISTINCT customer_id) from retail_sales;

-- Total No. Catgoary
SELECT COUNT (DISTINCT category) as CatoNo FROM retail_sales;


-- Buisness Key Problmes And Answer

-- 1.SQL QUERY to find all columns for Sales made on '2022-11-05'
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

-- 2.SQL query to retreive all transcations where catogory is "Clothing" and Quantity more than 3 in month Nov-2022
SELECT * FROM retail_sales
WHERE category = 'Clothing' 
AND TO_CHAR(sale_date,'YYYY-MM') = '2022-11'
AND quantiy > 3;


-- Sql query to calculate toal sales as per category
SELECT category,SUM(total_sale),COUNT(quantiy)
FROM retail_sales
GROUP BY category;

-- Write a SQL query to Find AVG age for 'BEAUTY' Category'
SELECT 
    ROUND(AVG(age),2) FROM retail_sales
	WHERE Category = 'Beauty';


-- Sql query To find all transactions where the total_sale is greater than 1000.
SELECT * FROM retail_sales
WHERE total_sale>1000;

-- SQL query find total number of transcations made by eah gender in each catogary
SELECT 
     category,gender,COUNT(transactions_id) 
	 FROM retail_sales
	 GROUP BY category,gender;

-- SQL Query to calculate average sale for each month . Find Out best selling Month
SELECT * FROM (
SELECT 
     EXTRACT(YEAR FROM sale_date) as year,
	 EXTRACT(MONTH FROM sale_date) as month,
	 AVG(total_sale) AS avg_sale,
	 RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS rank
 	 FROM retail_sales
	 GROUP BY 1,2
	) as t1
	Where rank = 1;


-- WRITE A sql find top 5 customers based on highest total sales
SELECT customer_id,SUM(total_sale) AS total from retail_sales
Group by customer_id
ORDER By total DESC LIMIT 5;

     
-- SQL query to find the no. customers who purchased items from each Category
select category,COUNT(DISTINCT customer_id) from retail_sales
GRoUP BY category;

	
-- SQL QUERY no. of orders in each shift (morning <= 12 ,Afternoon between 12 &  17 ,Evening >17)
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


-- ************************************************************ End Of The project*************************************************************************



















	



