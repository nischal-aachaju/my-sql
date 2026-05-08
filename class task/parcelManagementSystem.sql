create database PMS;
use PMS;

create table customer (
customer_id int primary key,
name varchar(20),
address varchar(20),
phone char(10),
email varchar(30)

);
insert into customer values
(2,"Nischal Shrestha","Bratchowk","9800000002", "nischal@gmail.com"),
(3,"Samir DC","Chovar","9800000003", "samir@gmail.com");

select * from customer;

create table orders (
order_id int primary key,
customer_id int,
status enum("In Transit","Delivered","Cancelled"),
order_date date default(curdate()),
foreign key (customer_id) references customer(customer_id)
);
alter table orders modify status enum("In Transit","Delivered","Cancelled","Pending");
insert into orders (order_id,customer_id,status) values(1,1,"Pending");
insert into orders (order_id,customer_id,status) values(2,1,"In Transit"),(3,1,"Delivered");
select * from orders;

create table route(
route_id int primary key,
origin varchar(20),
destimation varchar(20),
distance int 
);
insert into route values(1,"Kathmandu","Pokhara",200);
select * from route;

create table shipment(
shipment_id int primary key,
order_id int,
route_id int,
status enum("In Transit","Delivered","Cancelled"),
shipment_date date default (curdate()),
foreign key (order_id) references orders(order_id),
foreign key (route_id) references route(route_id)
);

insert into shipment (shipment_id,order_id,route_id,status,shipment_date) values(4,2,1,"In Transit","2026-05-04");
select * from shipment;
delete from shipment where shipment_id=3;
create table tracking(
tracking_id int primary key,
shipment_id int,
location varchar(20),
timestamp date ,
foreign key (shipment_id) references shipment(shipment_id)
);

create table parcel (
parcel_id int primary key,
order_id int,
parcel_type varchar(20),
weight float,
dimensions varchar(20),
foreign key (order_id) references orders(order_id)
);
INSERT INTO parcel (parcel_id, order_id, parcel_type, weight, dimensions) VALUES 
(1, 1, 'Standard', 2.5, '30x20x15'), 
(2, 2, 'Express', 1.2, '20x15x10'), 
(3, 3, 'Fragile', 5.0, '40x30x25'), 
(4, 1, 'Standard', 3.8, '35x25x20'), 
(5, 2, 'Oversized', 12.4, '60x50x40'), 
(6, 3, 'Express', 0.8, '15x10x8'), 
(7, 1, 'Fragile', 4.2, '45x35x30'), 
(8, 2, 'Standard', 2.1, '28x18x12'), 
(9, 3, 'Express', 1.9, '22x16x11'), 
(10, 1, 'Oversized', 9.7, '55x45x35');
use pms;
select * from tracking;
select * from parcel order by weight desc limit 5;

select * from orders where status="Delivered";
select * from shipment order by shipment_date desc;

select * from customer where name like "a%";
select * from customer where email like "%@gmail.com";
alter table customer add column loyalty_points int;
select * from customer;

alter table `orders` rename column status   to order_status;
select * from orders;

alter table route modify distance float;
desc route;

delete from orders where order_status="cancelled";

update  orders set order_status="Delivered" where order_id=3;
set sql_safe_updates=0;

desc parcel;
select * from parcel;
update parcel set weight=0.5 where parcel_type="box";
select * from customer;
update customer set phone="9811223344" where customer_id=3;

select *,origin from shipment join route on shipment.route_id=route.route_id;

select *,name,email from orders join customer on orders.customer_id=customer.customer_id;
select * from orders;

select * from customer join orders on customer.customer_id=orders.customer_id where orders.customer_id is null;
SELECT *
FROM customer
LEFT JOIN orders ON customer.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL;