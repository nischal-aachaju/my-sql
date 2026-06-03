-- create database acid;
-- use acid;

-- create table inventory (
-- i_id int primary key auto_increment,
-- stock int default 0,
-- price decimal (10,2)
-- );

-- drop table inventory;

-- start transaction;
-- Insert into users()



use  acid;

create table accounts(
accound_id int primary key,
holder_name varchar(30),
balance decimal(10,2)
);

insert into accounts (accound_id,holder_name,balance)
values(1,'Ram',1200),
(2,'shyam',1500),
(3,'hari',2500),
(4,'Mohan',15000),
(5,'Anurag',15700);

alter table accounts rename column accound_id to account_id;
select * from  accounts;
start transaction;
UPDATE accounts set balance=balance-100 where account_id=1;
savepoint s1;
update accounts set balance=balance+100 where account_id=2;
rollback to s1;
commit ;

delimiter //
create procedure transcation (IN sender_id int,IN reciver_id int,IN amount decimal(10,2))
 proc:begin
 DECLARE is_available_sender INT;
  DECLARE is_available_reciver INT;
  

 select count(*)  into is_available_sender from accounts where account_id=sender_id;
  select count(*)  into is_available_reciver from accounts where account_id=sender_id;
start transaction;

if is_available_sender =0 then
	rollback;
    select "sender account is not valid" as "status";
    leave proc;
elseif is_available_reciver=0 then
	rollback;
    select "Reciver account is not valid" as "status";
    leave proc;
else 
	update accounts set balance=balance-amount where account_id=sender_id;
	update accounts set balance=balance+amount where account_id=reciver_id;
	commit;
    select "Transfered succesfully " as "status";
end if;
end //
delimiter ;


drop procedure transcation;



