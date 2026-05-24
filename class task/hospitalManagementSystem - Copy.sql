create database hospitalManagementSystem;
use hospitalManagementSystem;

create table patient (
patientID int primary key,
firstName varchar(20),
lastName varchar(20),
dateOfBirth date,
gender enum("male","female","others"),
contactInfo char(10)
);
INSERT INTO patient VALUES
(6, 'Aarav', 'Sharma', '1990-03-15', 'male', '9801234567'),
(2, 'Priya', 'Thapa', '1985-07-22', 'female', '9812345678'),
(3, 'Bikash', 'Rai', '2000-11-08', 'male', '9823456789'),
(4, 'Sita', 'Gurung', '1995-01-30', 'female', '9834567890'),
(5, 'Rohan', 'Magar', '1978-06-12', 'others', '9845678901');
select * from doctor;
create table doctor (
doctorID int primary key,
firstName varchar(20),
lastName varchar(20),
speciality varchar(20),
phone char(10),
email varchar(20)
);

INSERT INTO doctor VALUES
(2, 'Rajesh', 'Karki', 'Cardiology', '9851234567', 'rajesh@gmail.com'),
(3, 'Anita', 'Shrestha', 'Neurology', '9862345678', 'anita@gmail.com'),
(4, 'Suresh', 'Pandey', 'Orthopedics', '9873456789', 'suresh@gmail.com'),
(5, 'Mina', 'Tamang', 'Pediatrics', '9884567890', 'mina@gmail.com'),
(6, 'Dipak', 'Adhikari', 'Dermatology', '9895678901', 'dipak@gmail.com');
alter table doctor modify email varchar(50);
create table appointment (
appointment int primary key,
patientID int,
doctorID int,
appointmentDate date default(curdate() ),
reason varchar(50),
status varchar(20) check (status in ("Scheduled","Completed","Cancelled"))
);
alter table appointment rename column appointment to appointmentID;
create table prescription (
prescriptionID int primary key auto_increment,
patientID int,
doctorID int,
medication varchar(20),
dosage varchar(20),
startDate date,
endDate date,
foreign key (patientID) references patient(patientID),
foreign key (doctorID) references doctor(doctorID)
);
desc prescription;
alter table appointment add constraint patient_id_fk foreign key (patientID) references patient(patientID) ;
desc appointment;

alter  table appointment add constraint doctor_id_fk foreign key (doctorID) references doctor(doctorID);

insert into doctor (doctorID,firstName,lastName,speciality,phone,email) 
values( 1,"Dr. raman"," khatiwada","Cardiology","9812311222","khatiwada@hospital.com");

insert into patient (patientID,firstName,lastName, dateOfBirth, gender,contactInfo)
values (101,"Ram","Sharma","1990-05-10","male","9812345678");

create table billing (
billingID int primary key auto_increment,
patientID int,
amount decimal(10,2),
billindDate date default (curdate()),
status enum("Pending","Compledted")
);
alter table billing add constraint patientID_fk foreign key (patientID) references patient(patientID);

insert into billing (patientID, amount,status) values(101,5000,"Pending");
INSERT INTO billing (patientID, amount, billindDate, status) VALUES
(2, 1500.00, '2025-01-11', 'Compledted'),
(3, 2300.50, '2025-01-16', 'Compledted'),
(4, 1800.75, '2025-01-21', 'Pending'),
(5, 3200.00, '2025-02-02', 'Compledted'),
(6, 950.25,  '2025-02-11', 'Pending'),
(101, 4100.00, '2025-02-21', 'Compledted'),
(3, 1200.00, '2025-03-02', 'Pending'),
(4, 2750.50, '2025-03-11', 'Compledted'),
(5, 500.00,  '2025-03-16', 'Pending'),
(6, 3800.00, '2025-03-21', 'Pending');
select * from patient;
select * from patient;
select * from billing;
truncate billing;

create table medicalRecord(
recordID int primary key auto_increment,
patientID int,
diagnosis varchar(30),
treatment varchar(30),
recordDate date default (curdate()),
Notes text,
foreign key (patientID) references patient(patientID)
);
use hospitalmanagementsystem;
insert into medicalRecord (patientID, diagnosis,treatment, Notes)
values(101,"Hypertension","Medication","Follow the instruction");

insert into appointment (appointmentID,patientID,doctorID,reason,status) 
values(1,101,1,"All good","Scheduled");
update  appointment set status="COMPLETED" where patientID=101;

update doctor set email='ramankhatiwada@hospital.com' where doctorID=1;

INSERT INTO prescription (patientID, doctorID, medication, dosage, startDate, endDate) VALUES
(101, 1, 'Amoxicillin', '500mg twice', '2025-01-01', '2025-02-10'),
(2, 2, 'Ibuprofen', '400mg thrice', '2025-01-05', '2025-02-14'),
(3, 4, 'Metformin', '850mg twice', '2025-01-10', '2025-02-19'),
(4, 5, 'Atorvastatin', '20mg once', '2025-01-15', '2025-03-16'),
(5, 6, 'Cetirizine', '10mg once', '2025-01-20', '2025-03-01'),
(6, 3, 'Paracetamol', '650mg thrice', '2025-02-01', '2025-03-12');

update  prescription set endDate = DATE_ADD(endDate, INTERVAL 30 DAY) where prescriptionID=15;
select * from appointment;
set sql_safe_updates=0;
delete from appointment where status="cancelled";
INSERT INTO appointment VALUES
(2,  101, 2, '2025-01-10', 'Chest pain checkup',      'Completed'),
(3,  2, 3, '2025-01-15', 'Headache and dizziness',  'Completed'),
(4,  3, 4, '2025-01-20', 'Knee joint pain',         'Completed'),
(5,  4, 5, '2025-02-01', 'Child fever',             'Completed'),
(6,  5, 6, '2025-02-10', 'Skin rash treatment',     'Scheduled'),
(7,  101, 3, '2025-02-20', 'Follow up on headache',   'Cancelled'),
(8,  2, 4, '2025-03-01', 'Back pain review',        'Cancelled'),
(9,  3, 5, '2025-03-10', 'Vaccination checkup',     'Cancelled'),
(10, 4, 6, '2025-03-15', 'Allergy consultation',    'Cancelled'),
(11, 5, 2, '2025-03-20', 'Heart rate monitoring',   'Scheduled');

alter table patient add column BloodGroup varchar(5);
alter table patient rename column ContactInfo to Phone;
alter table patient modify Phone varchar(15);

desc billing;
alter table billing modify amount decimal(10,2) not null default 0;
SHOW CREATE TABLE billing;

select  concat(firstName," ",lastName ) as fullname from patient join appointment on patient.patientID = appointment.patientID ;

SELECT 
    CONCAT(p.firstName, ' ', p.lastName) AS patientName,
    CONCAT(d.firstName, ' ', d.lastName) AS doctorName,
    a.appointmentDate
FROM appointment a
JOIN patient p ON a.patientID = p.patientID
JOIN doctor d ON a.doctorID = d.doctorID;

delete from billing where patientID=4;
SELECT CONCAT(patient.firstName," ",patient.lastName) as patientName, 
CONCAT(doctor.firstName," ",doctor.lastName) as doctorName ,
 appointmentDate from appointment 
 join patient on patient.patientID=appointment.patientID  
 join doctor on doctor.doctorid=appointment.doctorID;
 select * from billing;
select * from prescription;

select patient.* ,billing.amount from patient left join billing on patient.patientID= billing.patientID ;

select prescription.* ,CONCAT(patient.firstName," ",patient.lastName) as patientName , 
CONCAT( doctor.firstName," ",doctor.lastName) as doctorName from prescription 
join patient on prescription.patientID= patient.patientID
join doctor on prescription.doctorid=doctor.doctorID;
select * from patient where dateOfBirth between "1980-01-01"  and "2000-01-01";
select * from doctor where speciality in ('Cardiology','Neurology');

set sql_safe_updates=0;

select 
	patientID, sum(amount) as total
from billing group by patientID;

select 
	concat(doctor.firstName," ",doctor.lastName) as Doctors,
    count(appointment.appointmentID) as appointments 
from doctor  
join appointment 
on doctor.doctorID=appointment.doctorID group by doctor.doctorID;

select avg(amount)
 as avg_amount
 from billing;

select max(amount) 
as max_bill_amount 
from billing;

select 
	concat(d.firstName," ",d.lastName) as Doctors, 
	count(p.prescriptionID) 
as prescription_count 
from prescription p join doctor d on d.doctorID=p.doctorID 
group by p.doctorID having count(p.prescriptionID) >1 ;

select * from prescription;
insert into prescription (patientID,doctorID,medication,dosage,startDate,endDate) values
(2,2,"Painkiller","50 mg twice",curdate(),addDate(curdate(),INTERVAL 20 day) );

select * from medicalrecord;
INSERT INTO medicalrecord (patientID, diagnosis, treatment, Notes) VALUES
(2, 'Diabetes',      'Insulin Therapy',   'Monitor blood sugar daily'),
(3, 'Hypertension',  'Medication',        'Reduce salt intake'),
(4, 'Asthma',        'Inhaler',           'Avoid dust and smoke'),
(5, 'Diabetes',      'Oral Medication',   'Check HbA1c monthly'),
(6, 'Flu',           'Rest and Fluids',   'Stay hydrated');
desc medicalrecord;

select diagnosis,count(diagnosis) as record_count
from medicalRecord 
group by (diagnosis);


select concat(p.firstName, " " ,p.lastName) as patientName, 
m.diagnosis from medicalRecord m 
join patient p on p.patientID=m.patientID;




select 
	a.appointmentID,concat(p.firstName," " ,p.lastName) as PatientName,
	concat(d.firstName, " " ,d.lastName) as DoctorName, a.reason,a.status 
from appointment a join patient p on p.patientID=a.patientID 
join doctor d on d.doctorID=a.doctorID ;


select concat(p.prescriptionID," ", p.medication,"  ",p.dosage,"  ",p.startDate,"  ",p.endDate )
 as prescriptions , concat(pt.firstName, " " ,pt.lastName) as patientName,
concat(d.firstName, " " ,d.lastName) as DoctorName
from prescription p join patient pt on pt.patientID= p.patientID 
join doctor d on d.doctorID=d.doctorID ;

select * from billing;

select * from patient  
left join billing  on 
patient.patientID=billing.patientID;

select * from doctor;
select * from appointment;
delete from appointment where doctorid=3;
select * from doctor d left join appointment a on d.doctorID=a.doctorID;

select concat(p.firstname," ",p.lastName) as Patient_name, 
sum(b.amount) as Total_bill
from patient p join billing b on p.patientID=b.patientID 
group by (p.patientID) ;

select concat( a.appointmentdate,a.reason,a.status) 
as appointment, p.gender as gender,p.phone as contact
from appointment a  join patient p on a.patientID=p.patientID;


select * from appointment 
where appointmentDate > "2026-01-01" and  status ="Scheduled";

select * from patient where firstName like "a%";

select * from billing where amount between 500 and 2000;

select * from prescription 
where medication in ( 'Paracetamol', 'Ibuprofen', 'Amoxicillin') ;

SELECT  * FROM medicalrecord 
WHERE treatment LIKE "%surgery%" OR treatment IS NOT NULL;
select * from patient;

desc patient;


alter table patient add column BloodGroup varchar(5);

ALTER TABLE doctor MODIFY COLUMN phone VARCHAR(20);
DESC doctor;

delimiter //
CREATE PROCEDURE doctorPhone(IN p_doctorID INT, out p_phone int)
BEGIN
    SELECT phone INTO p_phone FROM doctor WHERE doctorID = p_doctorID;
END //
delimiter ;

drop procedure  doctorPhone;
CALL doctorPhone(5,@doc_phone);

select @doc_phone as "Doctor Number";

select * from doctor;

select * from billing;

START TRANSACTION;
update  billing set amount=amount+500 where billingID=2;
savepoint  money_added;

update  billing set amount=amount+700 where billingID=3;
rollback to money_added;
commit;	


-- select * from patient;

delimiter //
create procedure searchName( in p_id int, sex varchar(20))
begin
	select * from patient where patientID=p_id and gender=sex;
end //
delimiter ;

drop procedure searchName;
set sql_safe_updates=0;
call searchName(1,female);

delimiter //
CREATE PROCEDURE doctorPhone(IN p_doctorID INT, out p_phone varchar(10), out f_name varchar(30))
BEGIN
    SELECT phone,firstName INTO p_phone,f_name FROM doctor WHERE doctorID = p_doctorID;
END //
delimiter ;

drop procedure  doctorPhone;
CALL doctorPhone(4,@doc_phone,@f_name);
select * from doctor;
select @f_name as first_name, @doc_phone as contact;
select * from doctor where phone=@doc_phone;

use hello;

select * from orders;

delimiter //
create procedure amount_fltr(IN amt int)
begin 
	if amt> 3000 then
    select "high";
    elseIf amt> 2500 then
    select "medium";
    else 
    select "low";
    end IF;
end //
delimiter ;

call amount_fltr(1000);

delimiter //
create procedure amount_fltr(IN amt int)
begin 
 
	if amt> 3000 then
    select "high";
    elseIf amt> 2500 then
    select "medium";
    else 
    select "low";
    end IF;
end //
delimiter ;

select *  from orders;

-- execption handeling
-- declare continue


-- Try catch 

use human_resources;

select * from customer;
use human_resources;
insert into customer values(11,"Norman singh","male","normansingh@gmail.com","9876543210","Kathmandu",curdate())

delimiter //
create procedure addrecords(IN c_id int,IN C_name varchar(100),IN sex varchar(8), IN email varchar(150),IN contact varchar(15),IN city varchar(100) )
    declare user_name varchar (30) ;
    set user_name="Samir";
    
    declare exit handler for 1146;
    begin
		select "Select query failed" as status ;
    end;
	declare exit handler for 10632;
    begin
		select "Insertion faild failed" as status ;
    end;
	insert into customer values(c_id,C_name,sex,email,contact,city,curdate());
    select "Insertion succeccfully" as status ;
	update  customer set customer_name="ram " where customer_id=c_id;
    select "Update succeccfully" as status ;
 delimiter //

drop procedure addrecords;
call addrecords(14,"Ram Kaji Shrestha ","male","ram12@gmail.com","9812345678","Biratnagar");

select * from customers;
update  customer set customer_name="ram " where customer_id=200;


