use hello;
create table emp (
emp_id int primary key auto_increment,
emp_name varchar(50),
department varchar(50),
salary decimal(10,2),
age int,
hire_date date
);

insert into emp (emp_name,department,salary,age,hire_date) values
("Nischal Shrestha","IT", 55000,28,"2025-05-15"),
("Nirjal Shrestha", "HR",60000,32,"2025-01-12");

insert into emp (emp_name, department, salary, age, hire_date) values
("Riya Gupta","HR",62000,30,"2023-11-05"),
("Suman Karki","Finance",58000,29,"2022-07-18"),
("Anjali Verma","Marketing",54000,27,"2024-01-22"),
("Rahul Mehta","IT",70000,35,"2021-09-14"),
("Pooja Singh","HR",56000,28,"2023-06-30"),
("Kiran Thapa","Sales",52000,25,"2024-05-12"),
("Sneha Joshi","Finance",61000,31,"2022-12-01"),
("Rohit Pandey","IT",75000,36,"2020-08-20"),
("Neha Adhikari","Marketing",53000,26,"2024-02-15");

create table date_time(
id int primary key,
user_name varchar(30),
hire_date timestamp
);
select * from emp;
select 10 div 3 as division;
select * from emp where salary> 40000 and department="HR";
select emp_id,salary, salary*1.10 as increased_salary from emp;
select * from emp where emp_name  like '%r_i%';
select * from emp where length(emp_name)=11;