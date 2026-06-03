create database CollegeNoticeBoardManagementSystem;
use CollegeNoticeBoardManagementSystem;


 -- users table with columns: user_id, username, user_password, role

create table users(
user_id int primary key auto_increment,
username varchar(30) not null,
user_password varchar(30) not null,
role enum ("teacher","student") default "student"
);

 --  notices table with columns: notice_id, title, content, created_by, created_at
create table notices(
notice_id int primary key auto_increment,
title varchar(50) not null,
content text not null,
created_by int not null, 
created_at date default (curdate()),
foreign key (created_by) references users(user_id)
); 

-- 1. registeruser : to register new users who are either student or teacher
delimiter //
create procedure registerUser(IN u_name varchar(30), in u_password varchar(30),in u_role varchar(10))
begin
	insert into users (username,user_password,role) values(u_name,u_password,u_role);
end //
delimiter ;
call registerUser('nischal Shrsetha', '1234', 'teacher');
select * from users;

-- 2. userlogin : to login and get user details
delimiter //
create procedure login(IN u_name varchar(30),IN u_password varchar(30))
begin
	DECLARE nam varchar(30);
	DECLARE pasword VARCHAR(30);
  --   select * from users-- 
	select username, user_password into nam,pasword from users where username=u_name;
    if nam is null then
    select "User does not exist" as "user";
    elseif u_name=nam and u_password!=pasword then
    select "Invalid password" as "user";
    elseif u_name=nam and u_password=pasword then
    select "Login succesfully" as "user";
    end if;
end //
delimiter ;
drop procedure login;
select * from users;

-- 3. checkpermission : to check if the user has permission as he is a teacher or not
delimiter //
create procedure checkpermission(IN u_name varchar(30),out isAllowed boolean)
begin 
DECLARE u_role varchar(30);

select `role` into u_role from users where username=u_name;
if u_role!="teacher" then
	select "Does not nas permission to create update delete and view ";
    select false into isAllowed;
else
	select true into isAllowed;
end if;

end //
delimiter ;
drop procedure checkpermission;

-- 4. createnotice : to create a new notice 
delimiter //
create procedure createnotice (in n_title varchar(50), IN n_content text, in u_id int )
begin
DECLARE nam varchar(30);
select username into nam from users where user_id=u_id;
 call checkpermission(nam,@isAllowed);
 if @isAllowed then
	Insert into notices (title,content,created_by) values(n_title,n_content, u_id);
    select "Notice posted successfully" as "User";
    end if;
end //
delimiter ;
drop procedure createnotice;

-- 5. viewnotices : to view all notices

delimiter //
create procedure viewnotices()
begin 
select n.title,n.content,u.username from notices n join users u on u.user_id= n.created_by;
end //
delimiter ;

drop procedure viewnotices;

-- 6. updatenotice : to update a notice
delimiter //
create procedure updatenotice (IN id int,IN u_title varchar(50),IN u_content text, IN u_id int)
begin

declare nam varchar(30);
select username into nam where user_id=u_id;
call checkpermission(nam,@isAllowed);
if @isAllowed then
	update  notices set title=u_title, content=u_content where notice_id=id;
	select "notice updates successfully" as "User";
end if;
end //
delimiter ;
drop procedure updatenotice;

-- 7. deletenotice : to delete a notice

delimiter //
create procedure deletenotice (IN n_id int, IN u_id int)
begin
DECLARE nam varchar(30);
select username into nam from users where user_id=u_id;
 call checkpermission(nam,@isAllowed);
 if @isAllowed then
	delete from notices where notice_id=n_id;
    select "notice deleted successfully" as "User";
end if;
end //
delimiter ;

drop procedure deletenotice;
use test;
create table users(
u_id int primary key auto_increment,
username varchar(30),
password varchar(14)
);
select * from users;

drop table users;
