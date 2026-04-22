create database Developer;
use developer;

create table developers(
student_id int primary key ,
student_name varchar(30),
age int,
gender enum("Male","Female","Others"),
city varchar(30),
phone_number varchar(10)
);

truncate table developers;
drop table developers;
INSERT INTO developers (student_id, student_name, age, gender, city, phone_number) VALUES
(1, 'Aarav Sharma', 18, 'Male', 'Kathmandu', '9800000001'),
(2, 'Sita Karki', 19, 'Female', 'Pokhara', '9800000002'),
(3, 'Rohan Thapa', 20, 'Male', 'Lalitpur', '9800000003'),
(4, 'Anjali Gurung', 18, 'Female', 'Bhaktapur', '9800000004'),
(5, 'Bikash Rai', 21, 'Male', 'Dharan', '9800000005'),
(6, 'Pooja Shrestha', 19, 'Female', 'Biratnagar', '9800000006'),
(7, 'Suman Tamang', 22, 'Male', 'Chitwan', '9800000007'),
(8, 'Nisha Magar', 20, 'Female', 'Butwal', '9800000008'),
(9, 'Kiran Bhandari', 23, 'Male', 'Nepalgunj', '9800000009'),
(10, 'Ritika Adhikari', 18, 'Female', 'Hetauda', '9800000010');

select * from developers where age between 18 and 21; -- qn1

select * from developers where age  not between 20 and 22; -- qn2

select * from developers where student_id between 2 and 4 ; -- q3

select * from developers where 
phone_number like "980%" or
phone_number like "985%";
show create table developers;
select * from developers;
INSERT INTO developers (student_id, student_name, age, gender, city, phone_number) VALUES
(1, 'ram kc', 19, 'Male', 'ktm', '9801234567'),
(2, 'hari dc', 21, 'Male', 'dharan', '9812345678'),
(3, 'sita lama', 20, 'Female', 'butwal', '9823456789'),
(4, 'rita sah', 23, 'Female', 'dang', '9834567890'),
(5, 'gita rai', 18, 'Female', 'chitwan', '9845678901'),
(6, 'nischal shrestha', 22, 'Male', 'ktm', '9856789012'),
(7, 'bikash adhikari', 24, 'Male', 'pokhara', '9867890123'),
(8, 'suman thapa', 21, 'Male', 'dharan', '9809123456'),
(9, 'anita gurung', 19, 'Female', 'butwal', '9819988776'),
(10, 'roshan karki', 23, 'Male', 'ktm', '12345'),
(11, 'lila kc', 20, 'Female', 'dang', '9840000000'),
(12, 'dipa sharma', 22, 'Female', 'dharan', '9851111111');

select * from developers where city in ("ktm","dharan","butwal"); -- qn5

select * from developers where city not in ("dang","chitwan");

select * from developers where age in (19,21,23);

select * from developers where  student_name not like "%ram kc%" and student_name not like "hari dc";

select * from developers where gender in ("female");


select student_id,student_name,age, case 
when age <20 then "Teen"
when age between 20 and 22 then "Young"
when age >22 then "Adult"
end as status
from developers;

alter table developers add column status enum("adult","young","teen") after phone_number ;
select * from developers;
update developers set status=case
when age<20 then "teen"
when age between 20 and 22 then "young"
when age >22 then "adult"
end ;
set sql_safe_updates=0;

select student_id,student_name, age, gender,city,phone_number,status ,case
 when city="ktm" then "capital"
else "Other city"
end as label
from developers;

alter table developers add column isValid enum("valid","invalid") ;
update developers set isValid=case
when length(phone_number)=10 then "valid"
else "invalid"
end;
select * from developers where gender="male";
select * , case
when age<21 then "Junior"
else "Senior"
end as experience from developers;

select * from developers where city in ("ktm","butwal") and gender="female";
select * from developers;
select * from developers where age=20 and city="dharan" and gender="male";

select * from developers where age between 19 and 21 and city<>"dang";
select * from developers where age	>=20 and student_name like "r%";

select * from developers where city="ktm" or phone_number like "9809%";

select * from developers where student_name like "%sh%";
select * from developers where student_name like "r%";
select * from developers where student_name like "%a";
select * from developers where student_name like "_a%";
select * from developers where student_name not like "%a%";
select * from developers where length(SUBSTRING_INDEX(student_name," ",1 ))=4;
select * from developers where student_name like "% %";
select * from developers where city like "d%" and length(city)=5;
select * from developers where student_name like "__i%";

select * from developers where student_name not like "r%" and student_name not like "s%";
