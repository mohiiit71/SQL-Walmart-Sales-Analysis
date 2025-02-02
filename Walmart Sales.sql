-- Creating Feature columns --
-- Time of Day
SELECT 
    Time,
    (CASE
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:00:01' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END) AS Time_of_Date
FROM sales;

alter table sales add column Time_of_Day varchar(20);
Update sales set Time_of_Day = (CASE
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:00:01' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END);
-- Day Name -- 
select 
date, dayname(date)
 from sales;
 alter table sales add column Day_Name varchar(20); 
 update sales set Day_Name = dayname(date)

-- Month_Name --
select date,
monthname(date)
from sales;
alter table sales add column Month_Name varchar(20);
UPDATE sales 
SET 
    Month_Name = MONTHNAME(date)






-- Generic Questions --
-- How many unique cities does the data have?
-- In which city is each branch?
Select distinct city,branch from sales;


-- Product Questions -- 
-- How many unique product lines does the data have?
select count(distinct `Product line`) from sales;

-- What is the most common payment method? --
select payment,count(payment)
 from sales group by payment order by count(payment) desc;
 
 -- What is the most selling product line? --
 select `Product line`,count(`Product line`) from sales
 group by `Product line` order by count(`Product line`) desc;
 
 -- What is the total revenue by month? --
 select Month_Name,sum(Total) from sales
 group by Month_Name
 order by sum(Total) desc;
 
 -- What month had the largest COGS? --
 select Month_Name, sum(cogs)
 from sales
 group by Month_Name 
 order by sum(cogs) desc;
 
 -- What product line had the largest revenue? --
 select `Product Line`,sum(Total) from sales
 group by `Product line`
 order by sum(Total) desc;
 
 -- What is the city with the largest revenue? --
 SELECT 
    City, SUM(Total)
FROM
    sales
GROUP BY City
ORDER BY SUM(Total) DESC;

-- What product line had the largest VAT? --
SELECT 
    `product line`, AVG(`Tax 5%`)
FROM
    sales
GROUP BY `product line`
ORDER BY AVG(`Tax 5%`) DESC;

-- Which branch sold more products than average product sold? --
select branch,city,sum(quantity) from sales
group by branch,city
having sum(quantity) > (select avg(quantity) from sales);

-- What is the most common product line by gender? --
select gender,`Product line`,count(gender) from sales
group by gender,`Product line`
order by  count(gender) desc; 

-- What is the average rating of each product line? --
SELECT 
    `Product line`, AVG(rating)
FROM
    sales
GROUP BY `Product line`
ORDER BY AVG(rating) DESC;

-- Sales Questions --
-- Number of sales made in each time of the day per weekday -- 
SELECT 
    Time_of_Day, COUNT(*)
FROM
    sales
GROUP BY Time_of_Day;

-- Which of the customer types brings the most revenue? --
SELECT `Customer type`, SUM(total) 
FROM sales 
GROUP BY `Customer type` 
ORDER BY SUM(total) DESC;

-- Which city has the largest tax percent/ VAT (Value Added Tax)? --
select city,avg(`Tax 5%`) FROM SALES
group by city
order by avg(`Tax 5%`) desc;     

-- Which customer type pays the most in VAT? --
select `Customer type`,avg(`Tax 5%`) FROM SALES
group by `Customer type`
order by avg(`Tax 5%`) desc; 

-- Customer Questions --
-- How many unique customer types does the data have? --
select distinct `Customer type` from sales;

-- How many unique payment methods does the data have? --
select distinct payment from sales;

-- What is the most common customer type? --
select `Customer type`,count(`Customer type`) from sales
group by `Customer type`
order by count(`Customer type`) desc;

-- Which customer type buys the most? --
 select `Customer type`,count(*) from sales
 group by `Customer type`;
 
 -- What is the gender of most of the customers? --
 select gender,count(*) from sales
 group by gender;
 
 -- What is the gender distribution per branch? --
 select gender,count(branch),branch from sales
 group by gender,branch
 order by branch desc;
 
 -- Which time of the day do customers give most ratings? --
 select Time_of_Day,avg(rating) from sales
 group by Time_of_Day
 order by avg(rating) desc;
 
 -- Which time of the day do customers give most ratings per branch? --
 select Time_of_Day,avg(rating),branch from sales
 group by Time_of_Day,branch
 order by avg(rating),branch desc;
 
 -- Which day of the week has the best avg ratings? --
 select day_name,avg(rating) from sales
 group by day_name
 order by avg(rating) desc;
 
 -- Which day of the week has the best average ratings per branch? --
 select day_name,avg(rating) from sales
 where branch="c"
 group by day_name
 order by avg(rating) desc;
 
 





















 


