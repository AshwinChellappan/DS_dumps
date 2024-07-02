use inclass;

-- --------------------------------------------------------------
# Dataset Used: wine.csv
-- --------------------------------------------------------------

SELECT * FROM wine;

# Q1. Rank the winery according to the quality of the wine (points).-- Should use dense rank
SELECT winery, points,
	RANK() OVER(ORDER BY points DESC) AS RNK
    FROM wine;


# Q2. Give a dense rank to the wine varities on the basis of the price.
SELECT variety, price,
	DENSE_RANK() OVER(ORDER BY price DESC) AS RNK
    FROM wine;
    


# Q3. Use aggregate window functions to find the average of points for each row within its partition (country). 
-- -- Also arrange the result in the descending order by country.

SELECT country, province, winery, variety, 
	AVG(points) OVER(PARTITION BY country) AS AvgPoints_CountryWise
    FROM wine
    ORDER BY country DESC;


-----------------------------------------------------------------
# Dataset Used: students.csv
-- --------------------------------------------------------------

# Q4. Rank the students on the basis of their marks subjectwise.
SELECT student_id , subject , name , marks ,RANK()
OVER (PARTITION BY subject ORDER BY marks DESC)
AS 'rank' FROM students;


# Q5. Provide the new roll numbers to the students on the basis of their names alphabetically.
SELECT DISTINCT(name), RANK ()
OVER (ORDER BY name ) AS 'Roll_Number' FROM students;-- should use row_number


# Q6. Use the aggregate window functions to display the sum of marks in each row within its partition (Subject).
SELECT *, SUM(marks) OVER (PARTITION BY subject) 'total_marks' FROM students;


# Q7. Display the records from the students table where partition should be done 
-- on subjects and use sum as a window function on marks, 
-- -- arrange the rows in unbounded preceding manner.
SELECT *, SUM(marks) OVER (PARTITION BY subject ORDER BY marks ROWS UNBOUNDED PRECEDING) AS 'new' FROM  students;


# Q8. Find the dense rank of the students on the basis of their marks subjectwise. Store the result in a new table 'Students_Ranked'
CREATE TABLE Students_Ranked AS
SELECT *, DENSE_RANK ()
OVER(PARTITION BY subject ORDER BY marks DESC)
AS 'dense_RNK' FROM students;


-----------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
-----------------------------------------------------------------
select * from website_stats;
# Q9. Show day, number of users and the number of users the next day (for all days when the website was used)
SELECT day, no_users,
	LEAD(no_users) OVER(ORDER BY day) no_user_next_day
FROM website_stats
WHERE website_id = 1;


# Q10. Display the difference in ad_clicks between the current day and the next day for the website 'Olympus'
SELECT day, ad_clicks,
	LEAD(ad_clicks) OVER(ORDER BY day) as ad_clicks_next_day, 
	ad_clicks - LEAD(ad_clicks) OVER(ORDER BY day) as difference
FROM website_stats
WHERE website_id = 1;


# Q11. Write a query that displays the statistics for website_id = 3 such that for each row, show the day, the number of users and the smallest number of users ever.
SELECT day, no_users,
	FIRST_VALUE(no_users) OVER(ORDER BY no_users) smallest_num_of_users
FROM website_stats
WHERE website_id = 3;

# Q12. Write a query that displays name of the website and it's launch date. The query should also display the date of recently launched website in the third column.
SELECT name, launch_date,
	LAST_VALUE(launch_date) OVER
    (ORDER BY launch_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM web;


-----------------------------------------------------------------
# Dataset Used: play_store.csv and sale.csv
-----------------------------------------------------------------
# Q13. Write a query thats orders games in the play store into three buckets as per editor ratings received  

SELECT name, genre, editor_rating,
  NTILE(3) OVER (ORDER BY editor_rating DESC) bucket
FROM play_store;

# Q14. Write a query that displays the name of the game, the price, the sale date and the 4th column should display 
# the sales consecutive number i.e. ranking of game as per the sale took place, so that the latest game sold gets number 1. Order the result by editor's rating of the game

select ps.name, s.price, s.date,
	row_number() over(order by date desc) as latest_game_sold_rank
from play_store ps, sale s
where s.game_id=ps.id
order by editor_rating;

# Q15. Write a query to display games which were both recently released and recently updated. For each game, show name, 
#date of release and last update date, as well as their rank
#Hint: use ROW_NUMBER(), sort by release date and then by update date, both in the descending order

select name, released, updated,
	row_number() over(order by released desc, updated desc)
from play_store;


-----------------------------------------------------------------
# Dataset Used: movies.csv, customers.csv, ratings.csv, rent.csv
-----------------------------------------------------------------
# Q16. Write a query that displays basic movie informations as well as the previous rating provided by customer for that same movie 
# make sure that the list is sorted by the id of the reviews.
SELECT r.id, m.title, r.rating,
  	LAG(r.rating) OVER(PARTITION BY m.id ORDER BY r.id) by_customer
FROM ratings r, movies m
WHERE r.movie_id = m.id;


# Q17. For each movie, show the following information: title, genre, average user rating for that movie 
# and its rank in the respective genre based on that average rating in descending order (so that the best movies will be shown first).

WITH subquery AS(
    SELECT m.title, m.genre, AVG(r.rating) as avg
    FROM ratings r, movies m
    WHERE r.movie_id = m.id
    GROUP BY m.title, m.genre
  )
SELECT title, genre, AVG, 
	RANK() OVER(PARTITION BY genre ORDER BY AVG DESC) rank_
FROM subquery;

# Q18. For each rental date, show the rental_date, the sum of payment amounts (column name payment_amounts) from rent 
#on that day, the sum of payment_amounts on the previous day and the difference between these two values.

WITH subquery AS(
    SELECT rental_date, SUM(payment_amount) AS payment_amounts
    FROM rent
    GROUP BY rental_date
  	ORDER BY rental_date
  )
SELECT rental_date, payment_amounts, LAG(payment_amounts) OVER(), payment_amounts-LAG(payment_amounts) OVER() as difference
FROM subquery;