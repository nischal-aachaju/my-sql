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