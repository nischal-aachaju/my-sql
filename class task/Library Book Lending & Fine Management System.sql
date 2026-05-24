create database LibraryBookLendingAndFineManagementSystem;
use LibraryBookLendingAndFineManagementSystem;

-- 1. Publishers (publisher_id PK, publisher_name, city, established_year)
create table publishers (
publisher_id int primary key ,
publisher_name varchar(30),
city varchar(30),
established_year year
);

drop table publishers;

--  2. Authors (author_id PK, author_name, country, birth_year)
create table authors(
author_id int primary key,
author_name varchar(30),
country varchar(30),
birth_year year
);

-- 3. Books (book_id PK, title, publication_year, pages, publisher_id FK → Publishers, author_id FK → Authors)
-- Use ON DELETE CASCADE for both FKs.
create table books (
book_id int primary key,
title varchar(50),
publication_year year,
pages int,
publisher_id int,
author_id int,
foreign key (publisher_id) references publishers(publisher_id) on delete cascade,
foreign key (author_id) references authors(author_id) on delete cascade
);
alter table books add constraint books_ibfk_1 foreign key (publisher_id) references publishers(publisher_id) on delete cascade;

-- 4. Members (member_id PK, full_name, join_date (DATE), membership_type for example 'Basic', 'Premium', phone)
create table members (
member_id int primary key ,
full_name varchar(30),
join_date date default (curdate()),
membership_type enum("Basic","Premium","Phone"),
phone varchar(10)
);

drop table members;

alter table borrowing add constraint borrowing_ibfk_2 foreign key (member_id) references members(member_id) on delete cascade;
-- 5. Borrowing (borrow_id PK, book_id FK  From Table Books, member_id FK  
-- From Table Members, borrow_date (DATE), due_date (DATE), return_date (DATE = can be NULL if not yet returned))
-- Use ON DELETE CASCADE for both FKs.

create table borrowing (
borrow_id int primary key auto_increment,
book_id int,
member_id int,
borrow_date date default (curdate()),
due_date date,
return_date date default null,
foreign key (book_id) references books(book_id) on delete cascade,
foreign key (member_id) references members(member_id) on delete cascade
);


 --  6. Fines (fine_id PK, borrow_id FK → Borrowing (UNIQUE = one fine per borrowing record if applicable),
-- fine_amount (DECIMAL), paid_status — BOOLEAN or 'Paid'/'Unpaid', paid_date (DATE = NULL if unpaid)) 
-- Use ON DELETE CASCADE for the FK.
 
create table fines(
 fine_id int primary key auto_increment,
 borrow_id int unique,
 fine_amount decimal(10,2),
 paid_status enum("Paid","Unpaid"),
 paid_date date default null,
 foreign key (borrow_id) references borrowing(borrow_id) on delete cascade
 );
 
 -- Insert cmd --

INSERT INTO publishers VALUES
(1,  'Sajha Prakashan',      'Kathmandu', 1964),
(2,  'Jagadamba Prakashan',  'Kathmandu', 1950),
(3,  'Ratna Pustak Bhandar', 'Kathmandu', 1945),
(4,  'Fine Print',           'Kathmandu', 2001),
(5,  'Bhundipuran Prakashan','Kathmandu', 1990),
(6,  'Nepalaya',             'Kathmandu', 1993),
(7,  'Akhil Nepal',          'Kathmandu', 1975),
(8,  'Shikha Books',         'Kathmandu', 1980),
(9,  'Educational Books',    'Kathmandu', 1970),
(10, 'Nepal Pragya Pratisthan','Kathmandu',1965),
(11, 'Himal Books',          'Kathmandu', 1995),
(12, 'Martin Chautari',      'Kathmandu', 1989);

 
INSERT INTO authors VALUES
(1,  'Laxmi Prasad Devkota', 'Nepal', 1909),
(2,  'Bishweshwar Prasad Koirala', 'Nepal', 1914),
(3,  'Lil Bahadur Chhetri',  'Nepal', 1933),
(4,  'Narayan Wagle',        'Nepal', 1971),
(5,  'Buddhisagar Chapain',  'Nepal', 1971),
(6,  'Nayan Raj Pandey',     'Nepal', 1972),
(7,  'Indra Bahadur Rai',    'Nepal', 1927),
(8,  'Parijat',              'Nepal', 1937),
(9,  'Guru Prasad Mainali',  'Nepal', 1907),
(10, 'Bhupi Sherchan',       'Nepal', 1936),
(11, 'Moti Ram Bhatta', 'Nepal', 1901);

INSERT INTO members VALUES
(1,  'Nischal Shrestha',  '2022-01-10', 'Premium', '9841000001'),
(2,  'Nirjal Shrestha',      '2022-03-15', 'Basic',   '9841000002'),
(3,  'Priya Poudel',      '2022-05-20', 'Premium', '9841000003'),
(4,  'Rohan Karki',       '2023-01-05', 'Basic',   '9841000004'),
(5,  'Sita Thapa',        '2023-02-14', 'Premium', '9841000005'),
(6,  'Bikash Rai',        '2023-04-18', 'Basic',   '9841000006'),
(7,  'Anita Gurung',      '2023-06-22', 'Premium', '9841000007'),
(8,  'Dipesh Magar',      '2023-08-30', 'Basic',   '9841000008'),
(9,  'Kamala Tamang',     '2024-01-11', 'Basic',   '9841000009'),
(10, 'Suresh Limbu',      '2024-02-25', 'Premium', '9841000010'),
(11, 'Bina Maharjan',     '2024-03-03', 'Basic',   '9841000011'),
(12, 'Prakash Shrestha',  '2024-04-17', 'Premium', '9841000012');
 

INSERT INTO books VALUES
(1,  'Muna Madan',           1936, 108, 1,  1),
(2,  'Sumnima',              1971, 224, 1,  1), 
(3,  'Paralu',               1966, 186, 2,  2),
(4,  'Seto Dharti',          1974, 312, 2,  2), 
(5,  'Basain',               1957, 142, 3,  3),
(6,  'Agni ko Katha',        1962, 198, 3,  3), 
(7,  'Palpasa Cafe',         2005, 280, 4,  4),
(8,  'Nabheko Manche',       2009, 264, 4,  4),  
(9,  'Karnali Blues',        2008, 296, 5,  5),
(10, 'Mayur Timse',          2015, 210, 6,  6),
(11, 'Alikhit',              2018, 188, 7,  7),  
(12, 'Pharkera Herda',       2010, 176, 8,  8),
(13, 'Swasni Manchhe',       1967, 152, 9,  9);

select * from borrowing;
INSERT INTO borrowing VALUES
(1,  1,  1,  '2024-01-01', '2024-01-15', '2024-01-10'),
(2,  3,  2,  '2024-01-05', '2024-01-19', '2024-01-14'),
(3,  5,  3,  '2024-02-01', '2024-02-15', '2024-02-10'),
(4,  7,  4,  '2024-02-10', '2024-02-24', '2024-02-20'),
(5,  2,  1,  '2024-03-01', '2024-03-15', '2024-03-28'),  
(6,  4,  2,  '2024-03-10', '2024-03-24', '2024-04-06'), 
(7,  6,  3,  '2024-04-01', '2024-04-15', '2024-04-30'), 
(8,  8,  5,  '2024-04-10', '2024-04-24', '2024-05-05'),
(9,  9,  6,  '2024-05-01', '2024-05-15', '2024-05-27'),
(10, 10, 7,  '2025-01-01', '2025-01-15', NULL),
(11, 12, 8,  '2025-01-10', '2025-01-24', NULL),
(12, 13, 9,  '2025-02-01', '2025-02-15', NULL),
(13, 1,  10, '2025-02-10', '2025-02-24', NULL);



INSERT INTO fines VALUES
(1, 5, 130.00, "unpaid", NULL),          
(2, 6, 220.00, "paid",  '2024-05-10'),   
(3, 7, 300.00, "unpaid", NULL),           
(4, 8, 105.00, "paid",  '2024-06-01'),   
(5, 9, 240.00, "unpaid", NULL); 
    

select count(book_id) as "Total books whose pages are more then 300" from books where  pages>300;



select p.publisher_id, ROUND(avg(b.pages), 0) AS avg_pages
from publishers p left join books b 
on p.publisher_id = b.publisher_id
and b.publication_year > 2000
GROUP BY p.publisher_id
HAVING COUNT(*) >= 2;


select m.member_id,count(m.member_id) as "Number of books borrowes" 
from members m join borrowing b on 
m.member_id=b.member_id group by m.member_id having count(m.member_id) >3;


select * from publishers;
select * from authors;
select * from books;
select * from borrowing;
select * from members;
select * from fines; 

select count(*) as "total_books_borrowed", 
sum(f.fine_amount) as "total_fines_incurred" 
from borrowing b join fines f 
on b.borrow_id=f.borrow_id where b.borrow_date between"2024-01-01" and "2024-12-30"; 

select m.member_id,m.full_name,count(b.borrow_id) as total_books_borrowed,
sum(coalesce(f.fine_amount, 0)) as total_fines_incurred
from members m join borrowing b on m.member_id = b.member_id
left join fines f on b.borrow_id = f.borrow_id
where year(b.borrow_date) = 2024
group by m.member_id, m.full_name
having sum(coalesce(f.fine_amount, 0)) > 15
and count(b.borrow_id) >= 2;