-- user 1
create table product (
product_id int primary key ,
product_name varchar(20),
stock int default 0,
price decimal(10,2)
);

insert into product (product_id,product_name,stock,price) values(101,"Pen",12,20),(102,"Eraser",5,5);
insert into product (product_id,product_name,stock,price) values(103,"Scale",6,15),(104,"Copy",10,120);

select * from product;
select * from users;
create table users (
user_id int primary key,
username varchar(30),
product_id int,
qnty int default 0,
foreign key (product_id) references product(product_id)
);

start transaction;
insert into users (user_id,username,product_id) values (1,"Nischal",101);
insert into users (user_id,username,product_id) values (2,"Norman",102);
insert into users (user_id,username,product_id) values (3,"Anurag",103);
insert into users (user_id,username,product_id) values (4,"Samir DC",104);

commit ;

drop table users;
-- consistency , Isolation ,
start transaction;
update users set qnty=qnty+1 where user_id=1;
update product set stock=stock-1  where product_id=101;
commit;

select * from product;
select * from users;

delimiter //
create procedure orders(IN u_id int,IN p_id int, IN quantity int)
begin
DECLARE IsInStock INT ;
DECLARE Stocks INT ;
select stock into stocks from product where product_id=p_id;
IF Stocks!=0 then 
	set IsInStock=1;
	start transaction;
	update users set qnty=qnty+quantity where user_id=u_id;
	update product set stock=stock-quantity  where product_id=p_id;
	commit;
	select "Order placed successfully" as "Message";
else set IsInStock=0;
	rollback;
	select "Out of stock" as "Message";
end if;

end //
delimiter ;

drop procedure orders;

 -- user 2
use acid;


select * from product;
select * from users;


start transaction;
update users set qnty=qnty+1 where user_id=2;
update product set stock=stock-1  where product_id=102;
commit;