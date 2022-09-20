-- 6. Create a table with a primary key, a column default value, and a column unique constraint in SQL.

create database ineuron_sql_assignment_1;
use  ineuron_sql_assignment_1;

create table key_constr_combo(
product_ID int,
availability varchar (20) not null default 'NA',
manufacturer varchar (50) unique,
primary key (product_ID));

insert into key_constr_combo values (1001, 'YES' , 'TATA'),
(1002, 'YES', 'MAHINDRA'),
(1003, 'NO', 'PATANJALI'),
(1004, 'YES', 'NANDINI'),
(1005, 'YES' ,'PARAGON'),
(1006, 'NO', 'IKEA'),
(1008, 'NO', 'UNILIVER')
insert into key_constr_combo(product_ID, manufacturer) values (1007,'MICROSOFT')

select * from key_constr_combo
