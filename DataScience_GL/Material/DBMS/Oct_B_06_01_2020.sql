use hr;
select * from employees;
-- Functions+Group By 
-- Joins 
-- Inclass 3/ Takehome3
###########################################
-- Types 
-- Predefined(Built in ) - User Defined
-- Single Row 1 row=1 output
-- String / Numeric / Date
-- Substr/substring,Instr,Lpad,Rpad
-- trim,upper,lower,replace,left,right
-- Round,ceil,floor,truncate,MOD
-- Datediff,adddate,subdate,current_date
-- now(),Date_format
#####################################
-- 'Namrata Thukral'
create table func
(name varchar(30));
insert into func values
('Namrata thukral'),
('ABC XYZ'),
('Anis Ahamed');
select * from func;
select 
substr('Namrata thukral',1,
instr('Namrata thukral',' ')) fn;


select 
substr('NAMRATA THUKRAL',1,
instr('NAMRATA THUKRAL',' ')),
substr('NAMRATA THUKRAL',
instr('NAMRATA THUKRAL',' '),
length(substr('NAMRATA THUKRAL',1,
instr('NAMRATA THUKRAL',' '))));
select substr('Namrata Thukral',instr('Namrata Thukral',' ')) from dual;
select substr('Namrata Thukral',1,instr('Namrata Thukral',' ')) from dual;


select * from func;
select 
substr(name,1,instr(name,' '))fn,
substr(name,instr(name,' '))ln
from func;

select 
RIGHT('NAMRATA#THUKRAL',
instr('NAMRATA#THUKRAL','#'))
='Thukral';


select substr('Tushar abc',1,
instr('Tushar abc',' ')),
substr('Tushar abc',
instr('Tushar abc',' '));
select left('Tushar abc',
instr('Tushar abc',' '));
select right('Tushar abc',
instr('Tushar abc',' '));

select left('megha rani',
instr('megha rani',' ')),
right('megha rani',
(instr('megha rani',' ')-1));
select substr('namrata#thukral',
1,instr('namrata#thukral','#')-1);
select 
Lpad('Namrata6565r65r6',10,'*'),
Rpad('Namrata',10,'*');
select LTRIM('    Namrata   '),
 RTRIM('    Namrata      '),
 TRIM('   Namrata  '),'    Namrata  '; 
/*
Namrata
NAMRATA
 namrata
NAMrata
NamRaTa
*/
select * from emp
where trim(lower(ename))='namrata';

use hr;
select employee_id,
hire_date,
round(datediff(current_date,hire_date)/365,2) tenure
from employees;-- yrs decimal DOB
-- age ,tenure 
SELECT EMPLOYEE_ID,
abs(year(HIRE_DATE)-year(current_date())) 
FROM employees;
###################################
select sum(salary),
sum(commission_pct),
avg(commission_pct),
sum(commission_pct)/107 ,
count(*),count(employee_id-- unique - pk not null
count(commission_pct) from employees;
/*c1  c2  c3 
1  3    5 - 1
null null 7 - 1
null null null - 0 */
select department_id,job_id,count(*)
from employees 
group by department_id,job_id;-- 107 
select * from employees
where department_id=20;
-- MySql , Postgres
select department_id,job_id,count(*)
from employees 
group by department_id;-- 107 
set sql_mode=only_full_group_by;-- help
/*
20 man 1
20 rep 1
20 null 2
*/
select department_id,job_id,count(*)
from employees 
group by department_id,job_id with rollup;
#########################################
-- where ,having
select department_id,count(*) 
from employees
where department_id in (50,80)
group by department_id;
-- 5050505050
select department_id,count(*) 
from employees
group by department_id
having department_id in (50,80)
and count(*)>40;
#########################################
-- Joins Intro 
-- Joins, means value,type,syntax
-- Joins - connect physically logically
-- syntax (pk,fk) good to have integrity
-- extract the data from table 
-- columns good compulsory common ant tables
Create table j1 
(sno int);
insert into j1 values
(2);
Create table j2 
(sno int);
insert into j2 values
(1),(1),(1);
select * from j1;
select * from j2;
select distinct * from j1 join j2 
on j1.sno=j2.sno;-- 1st Inner 
-- 100 10 100000
select * from j1 left outer join j2 
on j1.sno=j2.sno;

select * from j1 right outer join j2 
on j1.sno=j2.sno;

select * from j1 cross join j2 ;
#####################################
-- 1. all employees 107 + deparment_name 
-- justify
-- Identify employee_id,department_name 
-- 2.employee_id,department_name,city 
#######################################
-- syntax 8 + examples 
#######################################



























-- Multiple Row no rows=1 output






