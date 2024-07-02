# Dataset used: titanic_ds.csv
# Use subqueries for every question

USE InClass;

#Q1. Display the first_name, last_name, passenger_no , fare of the passenger who paid less than the  maximum fare. (20 Row)
SELECT first_name, last_name, passenger_no, fare 
FROM titanic_ds 
WHERE fare < (SELECT MAX(fare) FROM titanic_ds);


#Q2. Retrieve the first_name, last_name and fare details of those passengers who paid fare greater than average fare. (11 Rows)
SELECT first_name, last_name, fare 
FROM titanic_ds 
WHERE fare >= (SELECT AVG(fare) FROM titanic_ds);

select * from titanic_ds;

#Q3. Display the first_name ,sex, age, fare and deck_number of the passenger equals to passenger number 7 but exclude passenger number 7.(3 Rows)
 SELECT passenger_no, first_name,sex, age, fare, deck_number 
 FROM titanic_ds 
 WHERE   (sex,   deck_number  )IN (SELECT  sex,   deck_number  FROM titanic_ds WHERE passenger_no = 7) and passenger_no<>7;

#Q4. Display first_name,embark_town where deck is equals to the deck of embark town ends with word 'town' (7 Rows)
select  first_name,embark_town from titanic_ds where deck in(select deck from  titanic_ds where embark_town like '%town');


# Dataset used: youtube_11.csv

#Q5. Display the video Id and the number of likes of the video that has got less likes than maximum likes(10 Rows)
SELECT video_id, likes 
FROM youtube_11 WHERE likes < 
(SELECT MAX(likes) FROM youtube_11);

#Q6. Write a query to print video_id and channel_title where trending_date is equals to the trending_date of  category_id 1(5 Rows)
SELECT video_id, channel_title 
FROM youtube_11 
WHERE trending_date IN (SELECT trending_date FROM youtube_11 WHERE category_id=1);

#Q7. Write a query to display the publish date, trending date ,views and description where views are more than views of Channel 'vox'.(7 Rows))
SELECT publish_date, trending_date, description, channel_title ,views
FROM youtube_11
WHERE views > (SELECT views FROM youtube_11 WHERE channel_title = 'Vox');

select * from youtube_11;

#Q8. Write a query to display the channel_title, publish_date and the trending_date having category id in between 9 to Maximum category id .
# Do not use Max function(3 Rows)
SELECT publish_date, trending_date, channel_title, category_id
FROM youtube_11 
WHERE category_id between 9 and  (SELECT  category_id FROM youtube_11 order by category_id desc limit 1);

#Q9. Write a query to display channel_title, video_id and number of view of the video that has received more than  mininum views. (10 Rows)
SELECT video_id, channel_title, views 
FROM youtube_11 
WHERE views > (SELECT MIN(views) FROM youtube_11);

# Database used: db1 (db1.sql file provided)


#Q10. Get those order details whose amount is greater than 100,000 and got cancelled(1 Row))
select * from orders where status = "Cancelled"  And customerNumber IN (select customerNumber from payments where amount > 100000);

#Q11. Get employee details who shipped an order within a time span of two days from order date (15 Rows)
select * from employees where employeeNumber = 
Any (select salesRepEmployeeNumber from customers where customerNumber = 
Any(select customerNumber from orders where datediff(shippedDate,orderDate) <= 2));

#Q12. Get product name , product line , product vendor of products that got cancelled(53 Rows)
select productName,productLine,productVendor from products where productCode =
 Any(select productCode from orderdetails where orderNumber =
 Any(select orderNumber from orders where status = "Cancelled")) ;
 
#Q13. Get customer full name along with phone number ,address , state, country, who's order was resolved(4 Rows)
select concat(contactFirstName , " " , contactLastName) as FullName , phone , 
concat( coalesce(addressLine1 + " " + addressLine2 , addressLine1,addressLine2) , " , " ,city) as Address ,
 state , country from customers where customers.customerNumber = Any(select customerNumber from orders where status = "Resolved"); 
 

#Q14. Display those customers who ordered product of price greater than average price of all products(98 Rows)
select * from customers where customers.customerNumber IN
 (select orders.customerNumber from orders where orders.orderNumber IN (select orderNumber from orderdetails where productCode IN 
 (select products.productCode from products where products.buyPrice > (select avg(products.buyPrice) from products)))) ;
 
 

#Q15. Get office deatils of employees who work in the same city where their customers reside(5 Rows)
select * from offices where city = Any(select city from customers);