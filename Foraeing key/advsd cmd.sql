use hello;
create table customer(
c_id int primary Key,
c_name varchar(30),
c_address varchar(30),
c_email varchar(30),
c_phone_number char(10)
);

create table transactions(
transaction_id int primary key,
c_id int,
amount decimal(10,2),
transaction_type varchar(20),
transaction_date date default (curdate())
-- , foreign key(c_id) references customer(c_id); 
);

alter table transactions add constraint fk_customer_id foreign key(c_id) references customer(c_id);

show create table transactions;
insert into customer values(1,"Nischal Shrestha","BiratChowk","nischal@gmail.com","9876543210");
insert into customer values(2,"Nirjal Shrestha","BiratChowk","nirjal@gmail.com","9876543211"),
(3,"Ambika Shrestha","BiratChowk","ambika@gmail.com","9876543212");

select * from customer;
select * from transactions;
insert into transactions values(1,1,29,"credit",default);

alter table transactions drop constraint fk_customer_id;
alter table transactions add constraint new_fk_customer_id foreign key (c_id) references customer(c_id) on delete cascade;

DELETE FROM transactions WHERE transaction_id = 1;
select * from transactions;
