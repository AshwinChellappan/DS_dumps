-- DDL - Structure / Tables 
-- Create/Alter/Drop/Rename/Truncate
CREATE DATABASE OCT_B;
USE OCT_B;-- Oracle oct_b -- Capital
-- --,#,/**/
-- table name,column/attribute,datatype
-- Constraints optional rules 
Create table Student 
(Sname char(6));
describe student;-- str table
desc student;
create table std2
(Sname Varchar(50));-- not wasted
desc std2;
Create table std3
(sid int,sname varchar(1));
desc std3;
create table std 
(ss char);
desc std;
-- Numerical
-- int
-- float,double,decimal
create table tt1 (sid float(9,2));
-- warning
desc tt1;
create table tt2
(sid decimal(6,2));
-- 897.23
-- decimal(p,s)
-- decimal (6,2);1234.56
-- char faster varchar
-- Empid pattern
-- 278393,737378,424246,262629 
-- 'Namrata'
-- Int,Boolean,Float,double,
-- Char, fixed length
-- String datatype range of datatype
-- Char 
-- Varchar Variable length / (Varchar2 -- not mysql)
-- text comment 6500
-- Tinytext
-- MediumText
desc std3;
insert into std3 values
(1,'N');
insert into std3 values
(2,null);-- NAN
insert into std3 (sname,sid) values
('m',2);-- 100 ,95
insert into std3 (sname,sid)values
('p',4),('r',5),('y',8);-- MySql
select * from std3;
create table sush
(sid int,pp int);
desc sush;
insert into sush(pp,sid)values
(3,null);
#####################################
-- 'Namrata'
-- Sunday DDL+lab inclass+takehome 
insert into tt5 values(87.34);
desc std2;
alter table std2 add sid int;
-- scenario str 
alter table std2
modify sname char(50);
alter table std2 rename column 
sid to s_id;
alter table std2 drop column s_id;
desc std2;
alter table std2 add sid int first; 
alter table std2 add fees int 
after sid;
alter table std2 add xyz int ;  
select * from std2;
desc std2;
alter table std2 
rename column sno to sid;
-- Create/Alter
-- insert new rows
-- DDL
-- DDL/DML insert/delete/delete
-- Lab  

-- DQL SELECT 
-- TCL/DCL SQL2