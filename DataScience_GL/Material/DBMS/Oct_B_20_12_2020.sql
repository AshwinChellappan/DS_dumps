-- DDL 
-- Create/Alter/Drop/Rename/Truncate 
-- Table name,column,datatype
-- Char/Varchar/Text/TinyText/MediumText
-- Int/Float/Double/Decimal(p,s)
-- Date 'YYYY-MM-DD'
-- DATE/DATETIME/TIMESTAMP
-- DATETIME 
-- 'yyyy-mm-dd 00:00:00'
-- 'yyyymmdd000000'+Timezone
use oct_b;
Create table tab1
(sid int,name varchar(20),
DOB date,DOJ datetime);
desc tab1;
insert into tab1 values
(1,'Namrata','1998-09-01',
'2020-01-02 11:12:13');
select * from tab1;
insert into tab1 values
(2,'Nasssmrata','1998-09-01',
'2020-01-02');
-- Constraints / Rules
insert into tab1 values
(-2,'Nnmn','1998-09-01',
'2020-01-02');
Create table tab2
(sid int unsigned);
insert into tab2 values(-9);
select * from tab2;
-- char
-- 'Namrata','Namrata123','123'
-- varchar
-- 'Namrata','Namrata123','123'
select 90+100 from Dual;-- official
-- pseudocoulmn
-- datadictionary
select 90+100 ;-- error in others db
select 90+100 ;-- exceptional 
select 'Namrata' from dual;
select 10+20+30 from dual;
select '9'+9 from dual;-- implicit conversion
-- '78494' read number
desc tab1;
select sid,sid+9 from tab1;
create table t1
(sid char(10));
insert into t1 values('123nm4');
select sid,sid+9 from t1;
select * from tab1;
select dob,doj,dob+90,dob-doj 
from tab1;
-- internally date numerical
-- number of days,hrs,sec,week
-- sas,r,python,big,db
###############################
-- Create/Alter/Drop/Rename/truncate
drop table t1;-- str+data+everything
Rename table tab1 to tab_1;
select * from tab_1;
truncate tab_1;-- str/skel
#####################################
-- Create/Alter - Constraint Rule
Create table t1
(sid int unique not null check 
(sid>0),Sname varchar(20) not null,
age int check(age between 20 and 50),
email VARCHAR(30) default 'NA');
desc t1;
-- Command ,
-- Data in MySql not casesensitive
-- Data is casesensitive
insert into t1 values
(5,'Nsggsata',24,default);-- user
select * from t1;
insert into t1(sname,age,sid)values
('ababa',35,7);

create TABLE TAB_CONSTRAINS
(
ST_ID INT unique NOT null 
CHECK (ST_ID > 0),
ST_NAME VARCHAR(15) NOT NULL,
ST_AGE INT CHECK(ST_AGE BETWEEN 20 AND 50),
EMAIL VARCHAR(30) DEFAULT 'NA');
desc TAB_CONSTRAINS;
insert into TAB_CONSTRAINS values
(1,'aha',34,'A@a.com');
INSERT INTO TAB_CONSTRAINS VALUES
(7,'SDF',2,DEFAULT);
select * from TAB_CONSTRAINS;
####################################
create table t2
(id int,city varchar(20) 
check (city in ('D','M')));
insert into t2 values
(1,'D');
select * from t2;
##################################
Create table dept
(deptid int primary key,
dname varchar(20) );
insert into dept values
(30,'log');
Create table emp
(empid int ,salary int,
deptid int,
foreign key (deptid) references
dept (deptid));
insert into emp values
(103,2535,null);
select * from dept;
delete from dept where deptid=10;
#########################################
-- DDL 
-- LAB 
-- DDL 
-- create/alter/drop/rename/truncate
-- LAB Inclass Breakout 
#############################
CREATE DATABASE bank;
use bank;
Create table Bank_Inventory(
Product CHAR(10) , 
Quantity INT,
Price INT unsigned,
purchase_cost Decimal(6,2),
estimated_sale_price  Float); 
Describe Bank_Inventory;
Insert into Bank_Inventory values 
( 'PayCard' , 2 , 300.45, 8000.87,
 9000.56 );
Insert into Bank_Inventory values
 ( 'PayPoints' , 4 , 200.89 , 
 7000.67, 6700.56);
Desc t1;-- str
select * from t1; -- str+data  
Alter table Bank_Inventory 
add Geo_Location Varchar(20);
desc t2;
insert into t2 values
(1,'D'),(10,'M');
Select Geo_Location from
Bank_Inventory where Product
= 'PayCard';
-- DATE
-- DATETIME/TIMESTAMP
select length(Product) from 
Bank_Inventory where Product 
= 'PayCard';
set sql_safe_updates=0;-- MySql
Update Bank_inventory 
set Geo_Location 
= 'Delhi-City' where 
Geo_Location is NULL;
##################################
Alter table Bank_Inventory
modify PRODUCT varchar(10);
Alter table Bank_Inventory 
modify product varchar(6);
Create table Bank_Holidays (
Holiday  date ,
Start_time datetime ,
End_time timestamp);
insert into BANK_HOLIDAYS 
values('2020-12-20',
'2020-12-20 12:08:00',
'2020-12-20 12:08:00');
select current_timestamp()
from dual;
Insert into Bank_holidays 
values ( current_date(), 
current_date(), 
current_date());
##############################
-- DML
desc Bank_Holidays;
#############################
-- Insert/Update/delete
desc emp;
insert into emp values
(1,222,20);
insert into emp values
(2,242,20),(3,37373,30);
insert into emp values
(4,3838,Null);
insert into emp (empid,salary)values
(5,3838);
select * from emp;
set sql_safe_updates=0;
update emp 
set salary=50000 
where empid=101;
-- Rownum Oracle
update emp 
set deptid=30
where deptid is null;-- NAN identify
-- Unknown 
-- nothing = something operator
select * from emp;
insert into emp values
(104,44664,null);
update emp
set salary=8000  
where empid =4 or empid=5;
####################################
-- SQL rows output answers-- 
-- something  
-- Data right 3-3
####################################
select * from emp;
delete from emp
where empid=101; 
delete from emp -- row
where empid=4 or empid=5;
update emp
set deptid=null where 
empid=4 or empid=5;
###################################
-- DDL/DML
-- DQL 
##################################
-- Inclass 
-- Tuesday  
-- Monday takehome


 

















