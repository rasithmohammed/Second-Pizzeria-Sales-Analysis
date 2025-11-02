Select * from pizza_sales
#KPI 
#Total_Revenue

Select Sum(total_price) as Total_Revenue from pizza_sales  

#Average_Order_Vlaue

Select sum(total_price)/count(Distinct order_id) as Avg_Orader_Value from pizza_sales

#Total_Pizzas_Sold

Select sum(quantity) as Total_Pizzas_Sold from pizza_sales

#Total_Orders

Select Count(Distinct order_id) as Total_Orders from pizza_sales

#Average_Pizzas_Per_Order

select cast(Cast(sum(quantity) as decimal(10,2)) / 
Cast(count(Distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzas_Per_Order from pizza_sales

--Daily Trend For Total Orders

Select datename(DW, order_date) as Order_Day, count(distinct order_id) as Total_Order
from pizza_sales
group by datename(DW, order_date)

--Hourly Trend for Total Orders 

Select DATEPART(HOUR, order_time) as Order_Hours, count(distinct order_id) as Total_Order
from pizza_sales
group by DATEPART(HOUR, order_time)
Order by DATEPART(HOUR, order_time)

--Percentage of Sales by Pizza Category 

Select pizza_category, sum(total_price) as Total_Sales, sum(total_price)*100/
(select sum(total_price) from pizza_sales where month(order_date)=1) as PCT
from pizza_sales
where month(order_date)=1
group by pizza_category;

--Total Pizza Sold by Pizza Category

Select pizza_size,cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(total_price)*100/
(select sum(total_price) from pizza_sales where datepart(quarter,order_date)=1) as decimal (10,2))as PCT
from pizza_sales
where datepart(quarter, order_date)=1
group by pizza_size
order by PCT DESC;

--Top 5 Best Sellers by Total Pizzas Sold

Select top 5 pizza_name,  sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_name
order by sum(quantity) desc;

--Bottom 5 Best Sellers by Total Pizza Sold

Select top 5 pizza_name,  sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_name
order by sum(quantity) asc;








 




