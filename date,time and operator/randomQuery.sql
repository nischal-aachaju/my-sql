create database hello;
use hello;

create table employeess(
id int primary key ,
name varchar(25),
age int,
department varchar(20),
salary decimal(10,2),
email varchar(25)
);
desc employeess;
insert into employees (id,name,age,department,salary,email) values
(1,"Nischal",18,"IT",20000,"n@gmail.com"),
(2,"Norman",22,"Finance",22000,"no@gmail.com"),
(3,"Nirjal",14,"SE",25000,"ni@gmail.com");
insert into employees (id,name,age,department,salary,email) values(6,"Ambika",29,"IT",23000,"amb@gmail.com");
insert into employees (id,name,age,department,salary,email) values
(4,"Samir DC",19,"Flutter",25000,"sdc@gmail.com"),
(5,"Anurag",23,"React Dev",24000,"A@gmail.com");
select name, department,salary from employees where salary< 24000;
update employeess set email="email@gmail.com" where id=3;
select * from employeess;
delete from employeess where id=5;
alter table employeess add column status boolean;

set sql_safe_updates=0;
update employees set status=false;

desc employees;
alter table employees modify column salary decimal(15,2);
select * from employees;
update employees set salary= case
when id=2 then 20000
when id=3 then 30000
else salary
end;

create table hello(
id int primary key ,
name varchar(25),
age int,
department varchar(20),
salary decimal(10,2) check(salary >0),
email varchar(25)
);
select * from hello;

insert into hello values (1,"hello",18,"it",12,"dsfd@gdf.c");

