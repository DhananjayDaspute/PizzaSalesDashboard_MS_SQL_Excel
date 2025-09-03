use pizza_db;
select * from pizza_sales

-- total revenue
select SUM(total_price) as total_revenue from pizza_sales;

-- Average order values
select SUM(total_price)/count(distinct order_id) as  Average_order_values from pizza_sales;

--Total pizza sold
select sum(quantity) as total_pizza_sold from pizza_sales

--Total Orders
select count( distinct order_id) AS total_orders from pizza_sales;

-- Average pizzas per order
select cast(cast(sum(quantity)AS decimal(10,2))/count(distinct order_id) As decimal(10,2)) as Average_pizzas_per_order from pizza_sales

-- Daily trend for total order

select datename(DW,order_date) AS order_day,count(distinct order_id) as total_order
from pizza_sales
group by datename(DW,order_date);

--Hourly Trend for total order

select datepart(HOUR,order_time) as order_time,count(distinct order_id) as total_order 
from pizza_sales
group by  datepart(HOUR,order_time)
order by order_time  asc;

--percentage of sales by pizza category

select pizza_category ,sum(total_price)*100/(select sum(total_price) from pizza_sales) as per_of_sales
from pizza_sales
group by pizza_category

--percentage of sale by pizza size
select pizza_size ,sum(total_price)*100/(select sum(total_price) from pizza_sales) as per_of_sales
from pizza_sales
group by pizza_size

--total pizza sold by category

select pizza_category,sum(quantity) as total_piza from pizza_sales
group by pizza_category

--Top 5 best seller by total pizza sold

select top 5 pizza_name,sum(quantity) as total_pizza_sold from pizza_sales
group by pizza_name
order by total_pizza_sold desc

--Bottom 5 Worst seller by total pizza sold

select top 5 pizza_name,sum(quantity) as total_pizza_sold from pizza_sales
group by pizza_name
order by total_pizza_sold asc