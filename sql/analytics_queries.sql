/*
=========================================================
AdventureWorks Fact_sales Analytics Project
Author : Divesh Singh

Description:
This SQL script contains business analysis queries used
to build an interactive Power BI dashboard.

Topics Covered
--------------
1. Overall Business KPIs
2. Customer Analysis
3. Product Analysis
4. Geographic Analysis
5. Time Analysis
6. Return Analysis
7. Advanced SQL Analysis
8. Business Insights

Database: MySQL
Dataset : AdventureWorks
=========================================================
*/

/*====================================================
1. OVERALL BUSINESS KPIs
====================================================*/

-- Total Revenue
select coalesce(round(sum(revenue),2),0)as total_revenue
from Fact_sales;

-- Total Orders
select count(distinct order_number)as total_orders
from Fact_sales;

 -- Total Customers
 select count(distinct customer_key)as total_customers
 from customers;
 
 -- Average Order value
 select round(sum(revenue) / count(distinct order_number),2) as average_order_value
 from Fact_sales;
 
 /*====================================================
 -- 2. Customer Analysis--
 ====================================================*/
 
 -- Top 10 Customers by Revenue
 select c.customer_key,concat(c.first_name," ",c.last_name)as full_name,
		round(sum(s.revenue),2)as revenue
from Fact_sales s 
join customers c
on s.customer_key = c.customer_key
group by c.customer_key, c.first_name, c.last_name
order by revenue desc 
limit 10;

-- Revenue by Gender

select c.gender , round(sum(s.revenue),2)as revenue
from Fact_sales s
join customers c 
on s.customer_key = c.customer_key
group by c.gender;
-- ---------------------------------------------------
-- Revenue by Age Group
select
case
when age<25 then 'Under 25'
when age between 25 and 34 then '25-34'
when age between 35 and 44 then '35-44'
when age between 45 and 54 then '45-54'
else '55+'
end as age_group,
round(sum(s.revenue),2)as revenue
from Fact_sales s
join customers c 
on s.customer_key = c.customer_key
group by age_group
order by revenue desc;

/*====================================================
-- 3.Product Analysis--
====================================================*/

-- Top 10 Products
select p.product_name, round(sum(s.revenue),2)as revenue
from Fact_sales s
join products p 
on s.product_key = p.product_key
group by p.product_name
order by revenue desc
limit 10;

-- Best Selling Categories
select ca.category_name, round(sum(s.revenue),2)as revenue
from Fact_sales s 
join products p 
on s.product_key = p.product_key
join subcategories sc
on p.product_subcategory_key = sc.product_subcategory_key
join categories ca 
on sc.product_category_key = ca.product_category_key
group by ca.category_name
order by revenue desc;

/*====================================================
-- 4.Geographic Analysis--
====================================================*/
select * from fact_sales;
--  Revenue by Country
select t.country , round(sum(s.revenue),2)as revenue
from Fact_sales s 
join territories t
on s.territory_key = t.sales_territory_key
group by t.country
order by revenue desc;

-- Revenue by Region 
select t.region ,  round(sum(s.revenue),2)as revenue
from Fact_sales s 
join territories t
on s.territory_key = t.sales_territory_key
group by t.region
order by revenue desc;

-- Percentage Contribution of Each Continent to Total Revenue
select t.continent , round(sum(s.revenue),2)as revenue,
round(sum(s.revenue) *100.0 /(select sum(revenue)from Fact_sales),2)  as revenue_percentage
FROM Fact_sales s
JOIN territories t
ON s.territory_key = t.sales_territory_key
GROUP BY t.continent
ORDER BY revenue DESC;

-- Average Order Value by Region
select t.region ,
	   round(sum(s.revenue) / count(distinct s.order_number),2) as average_order_value
from Fact_sales s 
join territories t 
on s.territory_key = t.sales_territory_key
group by t.region
order by average_order_value desc;
       
/*====================================================
-- 5.Time Analysis
====================================================*/

-- Monthly Revenue
select cl.month,
round(sum(s.revenue),2) as revenue
from Fact_sales s 
join calendar cl
on s.order_date = cl.date
group by date_format(cl.date, '%Y-%m-01'), cl.month;

-- Year Revenue
select cl.year,
round(sum(s.revenue),2) as revenue
from Fact_sales s 
join calendar cl
on s.order_date = cl.date
group by cl.year;


-- Monthly Order Trend
select cl.month,
count(distinct s.order_number)as total_orders
from Fact_sales s 
join calendar cl
on s.order_date = cl.date
group by date_format(cl.date, '%Y-%m-01'), cl.month;


-- Monthly Unit Sold
select cl.month,
sum(s.order_quantity)as total_orders
from Fact_sales s 
join calendar cl
on s.order_date = cl.date
group by date_format(cl.date, '%Y-%m-01'), cl.month;


-- Best Fact_sales Month
select cl.month,
round(sum(s.revenue),2) as revenue
from Fact_sales s 
join calendar cl
on s.order_date = cl.date
group by date_format(cl.date, '%Y-%m-01'), cl.month
order by revenue desc
limit 1 ;

   
-- Quarterly Revenue
select cl.quarter,
round(sum(s.revenue),2) as revenue
from Fact_sales s 
join calendar cl
on s.order_date = cl.date
group by cl.quarter;


-- Month over Month Growth       
with monthly_revenue as (
select date_format(cl.date,'%Y-%m-01')as month_start,cl.month,
round(sum(s.revenue),2) as revenue
from Fact_sales s 
join calendar cl
on s.order_date = cl.date
group by date_format(cl.date,'%Y-%m-01') ,cl.month

)
select * ,
lag(revenue) over(order by month_start)as previous_month_revenue,
round((revenue - lag(revenue) over(order by month_start))*100 /
lag(revenue) over(order by month_start),2) as mom_growth_pct
from monthly_revenue
order by month_start;


-- Running Total
with monthly_revenue as (
select date_format(cl.date,'%Y-%m-01')as month_start,cl.month,
round(sum(s.revenue),2) as revenue
from Fact_sales s 
join calendar cl
on s.order_date = cl.date
group by date_format(cl.date,'%Y-%m-01') ,cl.month
)
select month,
sum(revenue) over (order by month_start)as running_total
from monthly_revenue;


-- Moving Average(3-month)
with monthly_average as (
select date_format(cl.date,'%Y-%m-01')as month_start,cl.month,
round(sum(s.revenue) /  count(distinct s.order_number),2)as average_order_value
from Fact_sales s 
join calendar cl
on s.order_date = cl.date
group by date_format(cl.date,'%Y-%m-01') ,cl.month
)
select month_start, month,average_order_value,
round(avg(average_order_value) over (
	 order by month_start
     rows between 2 preceding and current row
     ),2)as moving_avg_3month
from monthly_average
order by month_start;

/*====================================================
-- 6. Return Analysis
====================================================*/

-- Return Rate
select round((select sum(return_quantity) from returns)*100.0
			/ sum(order_quantity),2) as return_rate_pct
from Fact_sales;
    

-- Returned Products
select p.product_key, p.product_name,
sum(r.return_quantity)as total_returns
from returns r 
join products p 
on r.product_key = p.product_key
group by p.product_key,p.product_name;


-- Returned Categories
select ca.category_name,
sum(r.return_quantity)as total_returns
from returns r 
join products p 
on r.product_key = p.product_key
join subcategories sc
on p.product_subcategory_key = sc.product_subcategory_key
join categories ca 
on sc.product_category_key = ca.product_category_key
group by ca.product_category_key,ca.category_name
order by total_returns desc;

/*====================================================
-- 7. Advanced SQL Analysis --
====================================================*/

-- Top 5 Products by Revenue in Each Category
with products_revenue as (
select ct.category_name, p.product_name, round(sum(s.revenue),2)as revenue
from Fact_sales s 
join products p
on s.product_key = p.product_key
join subcategories sc
on p.product_subcategory_key = sc.product_subcategory_key
join categories ct
on sc.product_category_key= ct.product_category_key
group by ct.category_name,p.product_key, p.product_name
),
ranking as (
select category_name , product_name, revenue,
		dense_rank() over (partition by category_name order by revenue desc)as rnk
from products_revenue
)
select * from ranking 
where rnk <=5;


-- Customer Lifetime Value (LTV)
select c.customer_key, concat(c.first_name, ' ', c.last_name)as customer_name,
round(sum(s.revenue),2)as revenue
from Fact_sales s 
join customers c 
on s.customer_key = c.customer_key
group by c.customer_key , customer_name
order by revenue desc;


-- Repeat Customers
select c.customer_key, concat(c.first_name, ' ', c.last_name)as customer_name,
count(distinct s.order_number) as total_orders
from Fact_sales s
join customers c 
on s.customer_key = c.customer_key 
group by c.customer_key, customer_name
having count(distinct s.order_number) >1
order by total_orders desc;


-- Customer Segmentation
select c.customer_key , concat(c.first_name,' ',c.last_name) AS customer_name,
	sum(s.revenue)as revenue,
	case
		when sum(s.revenue) >=3000 then 'High Value'
        when sum(s.revenue) >=1000 then 'Medium Value'
        else 'Low Value'
	end as customer_segment
from Fact_sales s
join customers c 
on s.customer_key = c.customer_key 
group by c.customer_key, customer_name
order by revenue desc;


-- Revenue Contribution %
select p.product_name, sum(s.revenue)as revenue,
round(sum(s.revenue)/ (select sum(revenue)from Fact_sales)*100.0,2)as revenue_contribution_pct
from Fact_sales s
join products p
on s.product_key = p.product_key
group by p.product_key, p.product_name 
order by revenue desc;


-- Top 10% Customers (NTILE)
with customer_Fact_sales as(
select c.customer_key , concat(c.first_name,' ',c.last_name) AS customer_name,
sum(s.revenue)as revenue
from Fact_sales s
join customers c 
on s.customer_key = c.customer_key 
group by c.customer_key, customer_name
)
select * ,
ntile(10)over(order by revenue desc)as customer_decile
from customer_Fact_sales;

/*====================================================
-- 8. Business Insights Queries--
====================================================*/

-- Which day of the week generates the highest revenue?
select cl.day_name, round(sum(s.revenue),2) AS revenue
from Fact_sales s
join calendar cl
on s.order_date = cl.date
group by cl.day_name
order by revenue desc;


-- Which country generates the highest revenue?
select t.country , round(sum(s.revenue),2)as revenue
from Fact_sales s 
join territories t
on s.territory_key = t.sales_territory_key
group by t.country
order by revenue desc;

-- Which occupation spends the most?
select c.occupation , round(sum(s.revenue),2)as revenue
from Fact_sales s 
join customers c
on s.customer_key = c.customer_key
group by c.occupation
order by revenue desc;


-- Which education level generates the highest revenue?
select c.education_level, round(sum(s.revenue), 2) as revenue
from Fact_sales s
join customers c
on s.customer_key = c.customer_key
group by c.education_level
order by revenue desc;

-- Average Order Value by Country
select t.country,
    round(sum(s.revenue) /count(distinct s.order_number),2) as average_order_value
from Fact_sales s
join territories t
on s.territory_key = t.sales_territory_key
group by t.country
order by average_order_value desc;


-- Which customers purchased the most different products?
select customer_key, count(distinct product_key) as unique_products
from Fact_sales
group by customer_key
order by unique_products desc;

-- Top 5 Country by Revenue
select t.country, round(sum(s.revenue), 2) as revenue
from Fact_sales s
join territories t
on s.territory_key = t.sales_territory_key
group by t.country
order by revenue desc
limit 5;

-- Products Never Sold
select p.product_name
from products p
left join Fact_sales s
on p.product_key = s.product_key
where s.product_key is null;

-- Customers Who Never Purchased
select c.customer_key, concat(c.first_name, ' ', c.last_name)as customer_name
from customers c
left join Fact_sales s
on c.customer_key = s.customer_key
where s.customer_key is null;

-- Average Revenue Per Customer
select round(sum(revenue) / count(distinct customer_key),2) as average_customer_revenue
from Fact_sales;

/*
====================================================
End of SQL Analysis
Dashboard built in Power BI
====================================================
*/