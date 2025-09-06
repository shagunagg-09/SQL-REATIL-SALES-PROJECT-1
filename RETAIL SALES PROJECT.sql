#                        ****START PROJECT SALES OF SQL****
create database sql_project2;
CREATE TABLE REATAIL_SALES2
(transactions_id INT PRIMARY KEY,
	sale_date  DATE,
    sale_time TIME,
	customer_id INT,
	gender VARCHAR(15),
	age INT,
    category VARCHAR(15) ,
	quantiy INT,
	price_per_unit FLOAT,
	cogs FLOAT,
	total_sale FLOAT
    );
    SELECT * FROM reatail_sales2;
    LIMIT 10;
    # DATA CLEANING
    select count(*)from reatail_sales2;
    SELECT * FROM  reatail_sales2 
   where transactions_id is Null;
   SELECT * FROM  reatail_sales2 
   where sale_date is Null;
   SELECT * FROM  reatail_sales2 
   where sale_time is Null;
   SELECT * FROM  reatail_sales2 
   where 
        transactions_id is Null 
		or
	    sale_date is Null
	    or 
        sale_time is Null
        or
        gender is NULL
		OR 
	    category is NULL
        OR 
        quantiy is NULL 
		OR
        cogs is NULL
        OR 
        total_sale is NULL;
      
DELETE FROM reatail_sales2  
WHERE
        transactions_id is NULL
		OR
	    sale_date is NULL
	    OR
        sale_time is NULL
        OR
        gender is NULL
		OR 
	    category is NULL
        OR 
        quantiy is NULL 
		OR
        cogs is NULL
        OR 
        total_sale is NULL;
        
        #DATA EXPLORATION
	#1 HOW MANY SALES WE HAVE?
    select count(*)as total_sales from reatail_sales2;
    #2 HOW MANY UNIQUE CUSTOMER WE HAVE?
    select count( distinct  customer_id) as total_sales from reatail_sales2;
    #3 HOW MANY  UNIQUE CATEGORY WE HAVE?
    select distinct  category from reatail_sales2;
     # DATA ANALYSIS & BUSINESS KEY PROBLEM & ANSWERED
        #1  WRITE  a sql query to retrieve all colum for sales made on   " 2022-11-05 "
    select *  from reatail_sales2
 where sale_date ="2022-11-05" ;
 #2 WRITE  a sql query to retrieve all TRANSACTION WHERE CATEGORY IS CLOTHING AND QUANTITY  SOLD IS MORE THAN 10 IN THE MONTH OF NOV 2022?
            select *  from reatail_sales2
 where  category="clothing" and
 month(sale_date)=11 and
year(sale_date)=2022
and 
quantiy=4;
#3 write a sql query to calculte the (total sales )for each category
       select category ,sum(total_sale) as net_sales,
       count(*) as total_orders 
       from reatail_sales2
       group by category;
    #4 write a sql query to find the averge age of customers who purchased item from the beauty category
    select round(avg(age),2) as avg_age  from reatail_sales2 
    where category="Beauty";
    #5 write a sql quert to find a  all transaction where the total_sale is greater then 1000
      SELECT 
    *
FROM
    reatail_sales2
WHERE
    total_sale > 1000;
    #6 write a sql quert to find the total number of transactions( transactions_id) made by each gender in each category
select category ,
gender,
count(*)  as total_trans
from reatail_sales2
group by category ,gender
order by category;

#7 write a sql query to calculate the avg sale for each month .find out best selling month in each year
select
year,month,avg_totaL_sales
 from (
select
 year(sale_date)as year,
 month(sale_date) as month, 
 avg(total_sale) as avg_total_sales,
 RANK() OVER(partition by  year(sale_date)ORDER BY avg(total_sale) DESC) AS rank_no
from reatail_sales2
group by year(sale_date),
month(sale_date) 
) as t1
where rank_no=1;
  #order by year(sale_date),
  #month(sale_date),
   #avg(total_sale)  desc
   
   
   
#8 write a sql query to find the top 5 customers based on the highest total_sales

 select 
 customer_id,
 sum(total_sale) as total_sales
 from reatail_sales2
 group by customer_id
 order by sum(total_sale) desc
 limit 5;     
 
 
 
 
 #9 write a sql query to find the number of uniqiue customers who purchased items from each category
 select
 category,
 count(distinct customer_id) as cnt_unique_cs
 from reatail_sales2
 group by category ;
 
 
 #10 write a sql query to create each shift and numbers of order (example morning <12, afternoon between 12 & 17 ,evenning>17)
 with hourly_sales
 as (
 select *,
   CASE 
       WHEN  hour(sale_time) < 12 THEN "Morning"
       WHEN  HOUR(sale_time) BETWEEN 12 AND 17 THEN "Afternoon"
       ELSE  "Evening"
    END AS shift
 from reatail_sales2
 )
 select 
 shift,
 count(*) as total_orders
 from  hourly_sales
 group by shift;
 
 #                                            ****END OF PROJECT****
 
 
 
 
 
 
 
 
 







