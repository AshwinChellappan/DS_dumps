-- DDL 
-- Create/Alter/Drop/Truncate/Rename
-- DML
-- Insert/Update/Delete
#########################################
-- DQL questions data 
-- SELECT (view data - Print)
-- temporary
Set Sql_Safe_updates=0;
-- dual + operation + table
use hr;
show tables;
-- employees
select * from employees;
-- departments
select * from departments;
-- jobs
select * from jobs;
select * from job_history;
select * from locations;
select * from countries;
select * from regions;
######################################
select * from employees;
-- * ,all data 
-- column,rows
select employee_id,salary
from employees;
select salary,employee_id
from employees;
select * from employees;
select employee_id,
salary,
salary+2000 net  from employees;
-- computed columns temporary
-- alias/nick / temporary
-- loan statement 
-- EMI 
-- Formula
-- bidding
-- 9000/7000
select salary,salary+1000 net_Sal,
salary+1000 as netsal,
salary+1000 "net sal#",
salary+1000 'net sal#'
from employees;
-- ""alias
-- ''data insert
create table `table 1`
(sid int);
-- table names / column name ``
select * from book3;
select * from `book 3`;
rename table `book 3` to book3;
#################################
select * from employees;
select employee_id,
first_name,salary,commission_pct,
salary+salary*commission_pct net
from employees;-- problem function
-- any calculation with null
-- is null 
select first_name,
last_name,
concat(first_name,' ',last_name) 
fullname from employees;
select concat(first_name,
' u works in ',department_id,
' department') output
from employees; 
select first_name||last_name
from employees;-- || concatenation
select first_name,
last_name ,concat(first_name,last_name) 
fullname from employees;
select first_name||' '||last_name
from employees;-- good to know
select * from employees;
-- alias,computed,concat
create table t1 
(sid int ,salary int);
insert into t1 values
(1,2000),
(1,3000),
(1,2000),
(2,6000);
select distinct * from t1;-- unique 
-- distint
select distinct sid from t1;
select  distinct sid,salary 
from t1;
select distinct 
(sid,salary) from t1;-- incorrect 
-- select distinct (sid),* from t1;
select distinct job_id,
hire_date,phone_number
from employees;
-- distinct data 
#################################
-- order by - arranging the date
-- descending/ascending
select distinct first_name,salary 
from employees
order by first_name desc,salary ;
select * from employees;
select salary,first_name 
from employees
order by 2 desc;
-- not good practice (more time)
select distinct c1,c2
from emp
order by c1,c2;
select distinct sid,salary 
from t1
order by sid desc,salary;
select last_name,
concat(first_name,last_name)
full1
from employees
order by last_name; 
-- Execution
select salary,salary+1000 net
from employees
order by net;
-- limit limited no of rows
select * from employees
limit 5;-- top
-- from bottom is not key(top/bottom ) 
select * from employees
order by employee_id desc limit 5;
-- sampling 
-- column,data
select * from t1
limit 1000;-- 5M

select first_name,salary
from employees 
order by salary -- 2nd 
limit 1; -- last

select distinct salary
from employees
order by salary desc 
limit 2,1;
################################
select salary from employees
order by salary desc limit 2,1;

select distinct 
first_name,salary from employees
order by salary desc,first_name ;
#####################################
-- alias,calcu,concat,
-- distinct,order,limit
-- schema+database 
-- Thursday+Practice (extra)
###################################
-- Friday- Takehome1 upload
###################################
select distinct sid,salary from t1;
select distinct sid from t1;
select distinct(sid) from t1;














