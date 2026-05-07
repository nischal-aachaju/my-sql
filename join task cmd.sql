
create table cutomers(
customer_id int primary key ,
customer_name varchar(20),
contact_number char(10),
country varchar(20)
);

create table orders(
order_id int primary key ,
order_date date default(curdate()),
amount decimal(10,2),
customer_id int,
foreign key(customer_id) references	cutomers(customer_id)
);

INSERT INTO cutomers VALUES (1, "Nischal Shrestha", "9876543211", "Nepal");
INSERT INTO cutomers VALUES (2, "Aarav Sharma", "9812345678", "India");
INSERT INTO cutomers VALUES (3, "Priya Patel", "9823456789", "India");
INSERT INTO cutomers VALUES (4, "Rohan Thapa", "9834567890", "Nepal");
INSERT INTO cutomers VALUES (5, "Emily Johnson", "9845678901", "USA");
INSERT INTO cutomers VALUES (6, "Sita Gurung", "9856789012", "Nepal");
INSERT INTO cutomers VALUES (7, "James Carter", "9867890123", "UK");
INSERT INTO cutomers VALUES (8, "Anita Rai", "9878901234", "Nepal");
INSERT INTO cutomers VALUES (9, "Rahul Verma", "9889012345", "India");
INSERT INTO cutomers VALUES (10, "Sophia Williams", "9890123456", "Australia");

INSERT INTO orders (order_id,amount,customer_id) VALUES 
(2,  2300.50, 1),
(3, 750.75, 3),
(5, 980.25, 6);

select * from cutomers;
select * from orders;

update cutomers set customer_name ="laxmi parshad" where customer_id=3;
update orders set amount=999.99 where order_id=2;

delete from cutomers where customer_id=5;

select * from cutomers;
alter table orders drop constraint orders_ibfk_1;
alter table orders add constraint new_foreign_key
foreign key(customer_id) references cutomers(customer_id) on delete cascade;
set sql_safe_updates=0;
select * from orders where amount<1000;
delete from orders where amount<1000;
select * from orders order by amount desc;

select * from  orders order by amount desc limit 5;

select * from cutomers order by customer_name;
