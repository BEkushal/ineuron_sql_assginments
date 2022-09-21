
-- 5. How to update data in a table using an inner join, write an example?


use functions;



create table student (
ID int,
name varchar (40),
age int)

alter table student add constraint primary key (ID)

insert into student values (001, 'ram' , 19),
(002, 'bheem' , 20),
(003, 'shyam' , 21)

create table course (
course_name varchar(60),
ID int,
foreign key (ID) references student (ID))
select * from course

insert into course values ('mern' , 001),('aws',002),('python',002),('data science',003),('block chain',001)
alter table course add primary key (course_name)
alter table course add column mentors int not null

-- updation by inner join

update course c
inner join student s on
    c.ID = s.ID
set c.mentors = s.ID