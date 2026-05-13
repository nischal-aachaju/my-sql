create database human_resources;
use human_resources;

create table department(
d_id int primary key auto_increment,
d_name varchar(30),
location varchar(30),
manager_name varchar(30),
created_at timestamp default(current_timestamp())
);

INSERT INTO department (d_name, location, manager_name) VALUES
('Engineering',     'New York',     'Alice Johnson'),
('Marketing',       'Los Angeles',  'Bob Smith'),
('Finance',         'Houston',      'David Brown'),
('Sales',           'Phoenix',      'Eva Martinez'),
('IT Support',      'San Antonio',  'Grace Lee');

truncate table department;
alter table employee drop constraint employee_ibfk_1;
create table employee(
e_id int primary key auto_increment,
e_name varchar(30),
phone_number char(10),
email varchar(50),
city varchar(30),
salary decimal(10,2),
d_id int,
foreign key (d_id) references department(d_id)
);

INSERT INTO employee (e_name, phone_number, email, city, salary, d_id) VALUES
('Nischal Shrestha',   '9801234567', 'nischal@email.com',  'Kathmandu', 85000.00, 1),
('Anurag Sharma',   '9812345678', 'anurag@email.com',   'Pokhara',   72000.00, 1),
('Priya Patel',     '9823456789', 'priya@email.com',    'Lalitpur',  91000.00, 3),
('Rohan Gurung',    '9834567890', 'rohan@email.com',    'Bhaktapur', 67000.00, 3),
('Sita Rai',        '9845678901', 'sita@email.com',     'Chitwan',   78000.00, 2),
('Bikash Limbu',    '9856789012', 'bikash@email.com',   'Butwal',    95000.00, 5),
('Anita Karki',     '9867890123', 'anita@email.com',    'Dharan',    62000.00, 5),
('Suraj Magar',     '9878901234', 'suraj@email.com',    'Biratnagar',88000.00, 4),
('Kamala Tamang',   '9889012345', 'kamala@email.com',   'Hetauda',   74000.00, 4),
('Dev Shrestha',    '9890123456', 'dev@email.com',      'Janakpur',  69000.00, 5);

select * from employee;
select * from department;

select count(*) from employee;
select count(d_id) from department;
select sum(salary) from employee;
select avg(salary) as avg_salary from employee;
select max(salary) as max_salary from employee;
select min(salary) from employee;
select count(*) from employee group by (d_id);

SELECT 
    department.d_id,
    department.d_name,
    COUNT(employee.e_id) AS employees,
    SUM(employee.salary) AS total_salary
FROM employee
JOIN department ON department.d_id = employee.d_id
GROUP BY department.d_id, department.d_name;

select d_name,count(e_id) as total_employees from employee join department on department.d_id=employee.d_id group by d_name;

select e.d_id,d.d_name,sum(salary) from employee e  join department d on d.d_id=e.d_id   group by e.d_id,d.d_name; -- 1 qn

select e.d_id,d.d_name,avg(salary) as average from employee e  join department d on d.d_id=e.d_id   group by e.d_id,d.d_name; -- 2 qn

select d_id, count(d_id) as employes from employee group by d_id; -- 3qn

select employee.d_id,department.d_name,max(salary) as max_salary ,min(salary) as min_salary 
from employee join department on department.d_id=employee.d_id group by employee.d_id, department.d_name ; -- 4qn

select employee.d_id,department.d_name,sum(salary) as total_salary 
from employee join department on department.d_id=employee.d_id group by employee.d_id, department.d_name having sum(salary)>100000 ; -- 5qn

select e.d_id,d.d_name,avg(salary) as average_salary from employee e 
join department d on d.d_id=e.d_id group by e.d_id having avg(salary) >60000 ; -- 6qn; 

select count(e.d_id ),d.d_name from employee e join department d on d.d_id=e.e_id where salary>60000  group by e.d_id having count(e.d_id) >1;

select * from employee;
