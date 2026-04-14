create database LMS;
use LMS;
create table library(
book_id int  primary key auto_increment,
title varchar(50),
author varchar(50),
price float,
gener enum("Science","History","Biography")
);

drop table library;
insert into library(title,author,price,gener)
values
("The Alchemist","Paulo Coelho",1200.00,"Science"),
("Atomic Habits","James Clear",501.99,"History"),
("1984","George Orwell",600,"Biography"),
("To Kill a Mockingbird","Harper Lee",550,"History"),
("The Hobbit","J. R. R. Tolkien",599.99,"History"),
("Rich Dad Poor Dad","Rich Dad Poor Dad",777.2,"Science"),
("The Great Gatsby","F. Scott Fitzgerald",799.44,"Biography"),
("Think and Grow Rich","Napoleon Hill",699.99,"Biography"),
("Harry Potter and the Sorcerer's Stone","J. K. Rowling",666.66,"Science"),
("The Psychology of Money","Morgan Housel",17.43,"History");
use LMS;
select * from library where gener="Biography" or gener= "Science";
select * from library where book_id IN (1,3,5);
select * from library where price BETWEEN 500 AND 800;
update library set title="Harry Potter" where book_id=2;
set sql_safe_updates=0;
update library set price=699.99 where title="Harry Potter";
update library set author="Ram kc" where book_id=3;
delete from library where book_id=4;
delete from library where price<600;
select * from library; 
truncate table library;
create table employee(
emp_id int primary key auto_increment,
name varchar(30) NOT NULL,
email varchar(20) unique,
phone int unique,
department varchar(30) default "general"
);
alter table employee add salary decimal(10,2) after email;
alter table employee rename column phone to mobile_number;
select * from staff;
RENAME TABLE employee to staff;
CREATE TABLE products(
product_id INT PRIMARY KEY auto_increment,
product_name VARCHAR(30),
stock int default 0,
price float ,
CONSTRAINT chk_price CHECK (price > 0),
status enum("Available","out of stock") default "Available"
);
select * from products;
truncate table products;
insert into products(product_name,stock,price)values
("Mobile",40,23),
("PC",10,23);

CREATE TABLE orders (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10, 2),
    qty INT,
    order_date DATE
);
INSERT INTO orders VALUES (1,  'Laptop',     55000.00,  2,  '2024-01-15');
INSERT INTO orders VALUES (2,  'Mouse',       1500.00,  5,  '2024-03-22');
INSERT INTO orders  (product_id,name,price,qty,order_date) values
(3,  'Keyboard',    2500.00,  3,  '2024-05-10'),
(4,  'Monitor',    18000.00,  1,  '2024-07-04'),
(5,  'Headphones',  3500.00,  4,  '2024-09-18'),
(6,  'Webcam',      2200.00,  2,  '2024-11-30'),
(7,  'USB Hub',      899.00,  6,  '2023-06-12'),
(8,  'Desk Lamp',   1200.00,  3,  '2023-11-05'),
(9,  'Charger',      750.00,  8,  '2025-02-14'),
(10, 'Speaker',     4500.00,  2,  '2025-03-01');

select * from  orders where order_date between '2024-01-01' and '2024-12-31';

CREATE TABLE employee (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50),
    department  VARCHAR(50),
    salary      DECIMAL(10, 2)
);
select * from employee;
INSERT INTO employee VALUES
(1, 'Nischal', 'IT',      50000.00),
(2, 'Aarav',   'HR',      40000.00),
(3, 'Sneha',   'Finance', 45000.00),
(4, 'Rohan',   'Sales',   35000.00),
(5, 'Priya',   'IT',      60000.00);

set sql_safe_updates=0;

UPDATE employee
SET 
    salary = CASE 
        WHEN department ='IT' THEN salary*1.2 
        WHEN department='HR' THEN salary*1.15
        WHEN department='Finance' THEN salary*1.1
        ELSE salary*1.05
    END;

