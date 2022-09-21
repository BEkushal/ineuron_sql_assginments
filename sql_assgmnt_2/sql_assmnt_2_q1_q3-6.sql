-- 1. For an online purchasing database, create entity relationship diagrams. Create a database object from your entity diagram.
			-- &      
-- 5. With an example, describe how to join in SQL.


create database online_purchasing;
use online_purchasing;

create table if not exists customer_details(
customer_ID int not null,
customer_name varchar (70),
customer_city varchar (70),
primary key (customer_ID))

insert into customer_details values ( 001, 'Gagan' , 'mysore'),
(002, 'veeksha', 'bengaluru'),
(003, 'pooja' , 'ahemadabad'),
(004, 'miran', 'pune'),
(005, 'kushal' , 'mumbai')

create table if not exists order_details(
order_num int not null,
item_name varchar (80),
cost int,
primary key (order_num))

insert into order_details values (01, 'trimmer',1200),
(02, 'nail polish' , 180),
(03, 'frying pan', 90 ),
(04, 'puma sneakers', 2500),
(05, 'jacket', 3000)

create table if not exists operations(
operation_id int,
operation_num int,
operation_date varchar (90),
foreign key (operation_id) references customer_details (customer_ID),
foreign key (operation_num) references order_details (order_num))

insert into operations values (001, 05 , '09/09/22'),
(002,03,'09/05/22'),
(002,02,'19/09/22'),
(005,04,'09/03/22'),
(004,01,'09/09/22')


select op.operation_id, op.operation_num, o.item_name, o.cost from operations op   
left join order_details o on op.operation_num = o.order_num

-- 4. In SQL, create a pivot query.

create table piv_order(
orderid int ,
employeeid int ,
vendorid int );

insert into piv_order values (1, 258, 1580),
(2, 254, 1496),
(3, 257, 1494),
(4, 261, 1650),
(5, 251, 1654),
(6, 253, 1664);

select * from piv_order

select orderid,
if(employeeid = 258,1,NULL) as emp258 ,
if(employeeid = 254,1,NULL) as emp254 ,
if(employeeid = 257,1,NULL) as emp257 ,
if(employeeid = 261,1,NULL) as emp261 ,
if(employeeid = 251,1,NULL) as emp251 ,
if(employeeid = 253,1,NULL) as emp253 from 
piv_order ;


-- 3. List the SQL aggregate function and demonstrate how to utilize it.
          -- &  
-- 6. How to locate the 4th highest value in a column in a row. Create your table.

create table surv_of_fit(
`name` varchar (80),
experience int,
age int,
bank_balance int,
health varchar (40))

insert into surv_of_fit values ('guru', 6 , 36 , 7000000, 'good'),
('vijay', 2 , 31 , 60000, 'very good'),
('rihan', 4 , 29 , 90000, 'very good'),
('rohit', 3 , 37 , 6800000, 'bad'),
('sana', 7 , 39 , 56000000, 'bad'),
('roy', 6 , 44 , 74000000, 'good'),
('ravi', 9 , 55 , 78000000, 'bad'),
('vicky', 2 , 34 , 4300000, 'good'),
('lucy', 5 , 31 , 745000000, 'very good'),
('nancy', 7 , 54 , 9000000, 'bad'),
('ashsa', 10 , 66 , 800000, 'very good'),
('nikhil', 3 , 37 , 40000, 'bad'),
('shambhu', 4 , 26 , 7000, 'very good'),
('radha', 6 , 56 , 897000000, 'bad')

select count(*) as records from surv_of_fit;
select max(bank_balance) from surv_of_fit;
select min(bank_balance) from surv_of_fit;
select avg(age) from surv_of_fit;
select count(*), health from surv_of_fit group by health;


-- for the 6th question

select name, bank_balance, health from surv_of_fit order by bank_balance desc 
select name, bank_balance, health from surv_of_fit order by bank_balance desc limit 3,1
