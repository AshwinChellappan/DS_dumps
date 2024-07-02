use hr;
show tables;
-- Operators
-- Alias Diff/nick security / easy to access
-- Computed column/calculation / alias
-- any calculation with Null  is null
-- Order by arrange asc/desc
-- distinct duplicacy column/com colum
-- Update/delete
-- Limit extract few no of rows top
#######################################
-- schema+database
-- MySql schema+database same
-- Schema logical structure 
-- DBA + documentation + Blue print 
####################################
-- Schema + ER Diagram 
-- Entity Relationship 
-- Database
###################################
-- DB ABC 
/*
HR - emp,dept
Fin - F1,F1,emp
Acc - A1,A2,emp,company
Logistics - L1,L2 
Create database abc;
create table hr.emp;
select * from hr.emp;-- path
create table Acc.A1;
DCL -- Grant/revoke
Grant select,Update on hr.emp
to userid;
Grant select on acc.emp to namrata
schema logictics; 
MS SqlServer*/
-- Operators
-- Python 
/*Airth
+,-,/,*,MOD-- (% In other db)
2/3 division (2//3 not in sql)
Logical 
and,or,not (Not In MySql &&,||)
Comparison
>,<,(!=,<>),a=90,
(a==90 not available) 
(assignment a:=90 don't use )
Relational
>=,<=
Boolean
between 
Is 
in
Like */
select 2=3 from dual;
select 2=2 from dual;
select * from employees;
use hr;
select * from employees
where  salary>8000 
and department_id=90  ;
-- filter rows+operators
-- all cond true  NULL end the table 
-- in MySql
-- 32 logical older
select * from employees
where  salary>8000 
and (department_id=90 or 
    department_id=50);
-- BODMAS priority AND>or
-- 90 / 50 >8000
select * from employees
where (department_id=90 or 
department_id=50)  and 
salary>8000 ;
select * from employees
where salary>8000
and department_id = 50 
or department_id = 90;

select * from employees
where department_id=90
or department_id=50 or
department_id=80;
-- In list 
-- Must one column 
select * from employees
where department_id 
in (90,50,80);
select * from employees
where department_id 
in (90,50,80,10,20);
select * from employees;
/*job_id 'ST_MAN',
depti=50
salary>6000*/
select * from employees
where job_id='ST_MAN'
and 
department_id=50
and salary>6000;

create table t2 
(sno int,Name varchar(20));
insert into t2 values
(1,'namrata'),(2,'Namrata'),(3,'NAMRATA'),
(4,'namRATA');
select * from t2
where binary(name)='namrata';
-- Every db is case sensitive
-- salary 9000 19000 
select * from employees where
salary >=9000 and salary<=19000;

select * from employees where
salary between 9000 and 19000;
select * from employees
where (salary >=9000 and salary
<=19000);
-- is NULL
select * from employees
where commission_pct is not null;
-- is (null); 
-- null is not nothing anything
select * from employees
where commission_pct = null;
select * from employees;
####################################
select distinct (comm) from table;
/*comm 500000000
0
0
null
null
0
null
null
90000
89000
78
78888
*/
select * from table
where commission_pct =0 
or commission_pct is null;
###################################
-- like pattern matching
-- wild card characters (_,%)
-- 'A' 
select * from employees
where first_name like 'a%';

select * from employees
where first_name like 'T%';

select * from employees
where first_name like '%T';
select * from employees
where first_name like '%T';
select * from employees
where first_name like 
'%i_';
-- i 
-- z first_name
select * from employees where
first_name like'%z%';
select * from employees 
where first_name like 'a%a';
select * from t2;
insert into t2 values
(8,'Namrata%');
-- '3rd _'
select * from t2
where name like '___%';
-- escape \ suppress the pre defined 
select * from t2
where name like '%\%';
select * from t2
where name like '%\ %';
select * from t2
where name like '%\%';
select * from t2;
-- rule to most symbols suppress \
select * from employees
where first_name like 'aaaa%';
-- regexp function
-- ^,[],{},()
-- Link understand study  dev.sql
####################################
-- Inclass 1 
-- Saturday
####################################
-- functions
/*string
number
date time
if else,case
null functions+Group By 
Joins*/
-- extra 
##############################3








