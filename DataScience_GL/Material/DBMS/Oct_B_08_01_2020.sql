use hr;
-- Joins
set @a=10;
select * from employees
where department_id=@a;
-- procedure/function
-- shell
########################################
show tables;
-- Inner/Outer(Left/Right/Full)
-- Cross/Self
-- Natural
#################################
select * from employees;
select * from departments;
###################################
-- Inner 107 
select e.employee_id,e.first_name,
e.last_name,d.Department_name 
from employees e join departments d 
on e.department_id=d.department_id;
-- 106 
select e.employee_id,e.first_name,
e.last_name,d.Department_name 
from employees e , departments d 
where e.department_id=d.department_id;
-- 107 -- inner base table 
###################################
-- n-1 no of tables - 1= No of joins
-- outer left,right,full
###################################
-- n-1, no of table -1 = no of join
########################################
-- employees  deptid departments
-- locationid countries;
select * from locations;
select * from departments;
select employee_id,first_name,
department_name,d.location_id,city 
from employees join 
departments d
on  employees.department_id=
d.department_id
join locations l
on d.location_id=l.location_id;

select employee_id, department_name,city from employees join departments join locations
on employees.department_id = departments.department_id and departments.location_id = locations.location_id 
order by employee_id;

select employee_id,first_name,city,
department_name,d.location_id 
from employees e ,departments d,
locations l 
where e.department_id=d.department_id
and l.location_id=d.location_id;
###################################
-- t1 left t2 left t3 left t4 
-- t2 right t1 right t3 right t4 
##################################
select e.employee_id,e.first_name,
e.last_name,d.Department_name,city 
from employees e 
left outer join departments d 
on e.department_id=d.department_id 
left join locations l
on l.location_id=d.location_id;
-- BK BA 
-- t1 name 
-- t1 id alter sno insert ,t2 name
-- alter sno insert
################################
select employee_id,first_name,
department_name,d.department_id
from employees e right join departments d
on e.department_id=d.department_id;
select * from departments;
###############################3
-- Full union/union all
-- emp  / dept 
select employee_id,department_name
from employees e left join departments d
on e.department_id=d.department_id
union  -- remove duplicate
select employee_id,department_name
from employees e right join departments d
on e.department_id=d.department_id;

-- Oracle
select * from employees e full join 
departments d on e.deptid=d.deptid;
-- inner / outer
################################
-- cross 
select employee_id,department_name
from employees 
cross join departments;
-- banking ,empl
select employee_id,
department_name
from employees 
cross join departments; 

select employee_id,department_name
from employees e left join departments d
on e.department_id=d.department_id
union
select employee_id,department_name
from employees e right join departments d
on e.department_id=d.department_id ;

use hr;
show tables;
-- e-commerce/dba optimaztion
create table p1 
(pname varchar(20),price int);
insert into p1 values
('AC',30000),('WM',9000);
create table p2 
(pname varchar(20),price int);
insert into p2 values
('Stab',3000),('Keyboard',1000);
select *,p1.price+p2.price net from p1,p2;
-- join big tables 10000,20000
-- 10 min 1 hrs
-- IT join max cross 
-- pick table 5 hrs 
-- 1m cross join 7m time 3 hrs 
########################################
-- self 
create table city
(sno int,city varchar(30));
insert into city values
(1,'Delhi'),(2,'Delhi'),(3,'Bangalore');
select * from        -- self 
city c1 join city c2
where c1.city=c2.city 
and c1.sno<>c2.sno;
##############################
select * from employees;
-- employee_id,hire_date 
-- same date 

select distinct 
e1.employee_id,e1.hire_date 
from employees e1,employees e2 
where e1.employee_id<>e2.employee_id
 and e1.hire_date=e2.hire_date
 order by hire_date;
select 
distinct e1.employee_id , e1.hire_date from employees e1 join employees e2
where e1.hire_date = e2.hire_date  and
e1.employee_id <> e2.employee_id;
###################################
-- Inclass + Take home challenging
select employee_id,
department_name from 
employees e join departments d
on e.department_id=d.department_id;

-- (Natural) - Inner - Equi
select employee_id,
department_name from 
employees e natural
join departments  d;
 -- deptid=deptid inner join 
 -- deptid=deptno inner join  never 
 -- all whatever in column
-- Big never possible
##################################
-- Release it Sunday 
-- Tough 
#################################
-- Extra + challenging
#################################
select * from city;
insert into city values
(1,'Delhi');
select distinct c1.sno,c1.city from city c1 
join city c2 on c1.sno<>c2.sno and 
c1.city=c2.city; 
##################################
-- joins sql1
##################################




