-- 6. Differentiate between truncate, delete, and drop with a suitable example.

-- delete example , truncate example , drop example

create table students (name varchar (40), age  int)

insert into students values ('ram',20),('shyam',26),('bheem',24),('sharath',18),('barath',19),('samarth',27) 

select * from students

delete from students where age < 20
truncate students
drop table students