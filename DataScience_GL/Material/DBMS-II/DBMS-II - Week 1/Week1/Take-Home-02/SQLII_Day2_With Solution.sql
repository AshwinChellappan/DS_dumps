CREATE SCHEMA IF NOT EXISTS Video_Games;
USE Video_Games;
SELECT * FROM Video_Games_Sales;

# 1. Display the names of the Games, platform and total sales in North America for respective platforms.
SELECT Name,Platform, SUM(NA_Sales) Over (Partition by Platform) FROM VIdeo_Games_Sales;

# 2. Display the name of the game, platform , Genre and total sales in North America for corresponding Genre as Genre_Sales,total sales for the given platform as Platformm_Sales and also display the global sales as total sales .
# Also arrange the results in descending order according to the Total Sales.

SELECT Name, Platform,Genre,
	SUM(NA_Sales) OVER(Partition by Genre) AS Genre_Sales,
    SUM(NA_Sales) OVER(PARTITION BY Platform) AS  Platformm_Sales,
	SUM(Global_Sales) OVER() AS  Total_Sales
    FROM VIdeo_Games_Sales
    ORDER BY Total_Sales DESC;

# 3. Use nonaggregate window functions to produce the row number for each row 
# within its partition (Platform) ordered by release year.
SELECT
	Name, Platform, Year_of_Release, Genre,
	ROW_NUMBER() OVER(PARTITION BY Platform ORDER BY Year_of_Release DESC) AS row_num
FROM Video_Games_Sales;

# 4. Use aggregate window functions to produce the average global sales of each row within its partition (Year of release). Also arrange the result in the descending order by year of release.
SELECT Name, Platform, Year_of_Release, 
	AVG(Global_Sales) OVER(PARTITION BY Year_of_Release) AS AvgGlobalSales_In_Millions
    FROM Video_Games_Sales
    ORDER BY Year_of_Release DESC;
   

# 5. Display the name of the top 5 Games with highest Critic Score For Each Publisher. 

Select * 
from 
(SELECT Name, Platform, DENSE_RANK()(PArtition by Publisher Order BY Critic_Score desc) AS Critic_Rank,
FROM VIdeo_Games_Sales)a
Where Critic_Rank<=5;



------------------------------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
------------------------------------------------------------------------------------
# 6. Write a query that displays the opening date two rows forward i.e. the 1st row should display the 3rd website launch date

select * from web;
SELECT name, launch_date,
	LEAD(launch_date,2) OVER(ORDER BY launch_date) third_website_launch_date
FROM web;


# 7. Write a query that displays the statistics for website_id = 1 i.e. for each row, show the day, the income and the income on the first day.
SELECT day, income,
	FIRST_VALUE(income) OVER(ORDER BY day) income_on_first_day
FROM website_stats
WHERE website_id = 1;


-----------------------------------------------------------------
# Dataset Used: play_store.csv 
-----------------------------------------------------------------
# 8. For each game, show its name, genre and date of release. In the next three columns, show RANK(), DENSE_RANK() and ROW_NUMBER() sorted by the date of release.
select name, genre, released, 
	rank() over(order by released),
	dense_rank() over(order by released),
	row_number() over(order by released)
from game