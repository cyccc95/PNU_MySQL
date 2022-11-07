-- SQL Basic 1.pdf

-- Login
-- mysql -u -root -p;
-- mysql -h ip주소 -u 계정 -p;

-- Show Users
select Users, Host from mysql.user;

-- Create User
create user 'someuser'@'localhost' identified by 'somepassword';

-- Delete User
drop user 'someuser'@'localhost';

-- Grant All Privileges On All Databases
grant all privileges on *.* to 'someuser'@'localhost';
flush privileges;

-- Show Grants
show grants for 'someuser'@'localhost';

-- Remove Grants
revoke all privileges, grant option from 'someuser'@'localhost';

-- Show Databases
show databases;

-- Create Databases
create database dbname;

-- Delete Database
drop database dbname;

-- Select Database
use dbname;

-- Create Table
create table users(
	id INT AUTO_INCREMENT,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(50),
	password VARCHAR(20),
	location VARCHAR(100),
	dept VARCHAR(100),
	is_admin TINYINT(1),
	register_date DATETIME,
	PRIMARY KEY(id)
);

-- Add New Column
alter table users add age varchar(3);

-- Modify Column
alter table users modify column age int(3);

-- Delete Table
drop table tablename;

-- Show Tables
show tables;

-- Insert Row / Record
insert into users (first_name, last_name, email, password, location, dept, is_admin, register_date) values ('Brad', 
'Traversy', 'brad@gmail.com', '123456','Massachusetts', 'development', 1, now());

-- Insert Multiple Rows
insert into users (first_name, last_name, email, password, location, dept, is_admin, register_date) values ('Fred', 
'Smith', 'fred@gmail.com', '123456', 'New York', 'design', 0, now()), ('Sara', 'Watson', 'sara@gmail.com', '123456', 'New 
York', 'design', 0, now()),('Will', 'Jackson', 'will@yahoo.com', '123456', 'Rhode Island', 'development', 1, now()),('Paula',
'Johnson', 'paula@yahoo.com', '123456', 'Massachusetts', 'sales', 0, now()),('Tom', 'Spears', 'tom@yahoo.com', 
'123456', 'Massachusetts', 'sales', 0, now());

-- Update Row
update users set email = 'freddy@gmail.com' where id = 2;

-- Select문 형식
-- select select_expr 
-- 		[from table_references]
--		[where where_condition]
--     	[group by {col_name | expr | position}]
--     	[having where_condition]
--     	[order by {col_name | expr | position}]

select * from users;
select first_name, last_name from users;

-- where Clause
select * from users where location = 'Massachusetts';
select * from users where location = 'Massachusetts' and dept = 'sales';
select * from users where is_admin = 1;
select * from users where is_admin > 0;

-- Order By (Sort)
select * from users order by last_name ASC; -- ASC는 default
select * from users order by last_name DESC;

-- Concentrate Columns
select concat(first_name,' ',last_name) as 'name', dept from users;

-- Select Distinct Rows
select distinct location from users;

-- Between (Select Range)
select * from users where age between 20 and 25;

-- Like (Searching)
select * from users where dept like 'd%';
select * from users where dept like 'dev%';
select * from users where dept like '%t';
select * from users where dept like '%e%';

-- select * from users where name like '_길동';
-- 길동이란 이름 다 찾음(3글자만)

-- Not Like
select * from users where dept not like 'd%';

-- IN (OR)
select * from users where dept in ('design','sales');

-- Create & Remove Index
create index idx_location on users(location);
drop index idx_location on users;

-- New Table With Foreign Key (Posts)
create table posts(
	id int auto_increment,
    user_id int,
    title varchar(100),
    body text,
    publish_date datetime default current_timestamp,
    primary key(id),
    foreign key (user_id) references users(id)
);

-- Add Date to Post Table
Insert into posts(user_id, title, body) values (1, 'Post One', 'This is post one'),(3, 'Post Two', 'This is post two'),(1, 
'Post Three', 'This is post three'),(2, 'Post Four', 'This is post four'),(5, 'Post Five', 'This is post five'),(4, 'Post Six', 'This 
is post six'),(2, 'Post Seven', 'This is post seven'),(1, 'Post Eight', 'This is post eight'),(3, 'Post Nine', 'This is post 
none'),(4, 'Post Ten', 'This is post ten');

-- Insert Join
select u.first_name, u.last_name, p.title, p.publish_date
	from users u	-- 첫번째 테이블 
    inner join posts p	-- 두번째 테이블
    on u.id = p.user_id		-- 조인 조건
    order by p.title;
    
-- New Table With 2 Foriegn Keys
create table comments(
	id int auto_increment,
    post_id int,
	user_id int,
    body text,
    publish_date datetime default current_timestamp,
    primary key(id),
    foreign key(user_id) references users(id),
    foreign key(post_id) references posts(id)
);

-- Add Date to Comments Table
insert into comments(post_id, user_id, body) values (1, 3, 'This is comment one'),(2, 1, 'This is comment two'),
(5, 3, 'This is comment three'),(2, 4, 'This is comment four'),(1, 2, 'This is comment five'),
(3, 1, 'This is comment six'),(3, 2, 'This is comment six'),(5, 4, 'This is comment seven'),(2, 3, 'This is comment seven');

-- Left Join
select
	c.body, p.title
    from comments c
    left join posts p 
    on p.id = c.post_id
    order by p.title;

-- Left Join과 Join 비교
select u.first_name, u.last_name, p.title, p.publish_date
	from users u	-- 첫번째 테이블 
    left join posts p	-- 두번째 테이블
    on u.id = p.user_id		-- 조인 조건
    order by p.title;
    
-- posting 안한 사람 찾아보기
select u.first_name, u.last_name, p.title, p.publish_date
	from users u
    left join posts p
    on u.id = p.user_id
	where p.user_id is null;
--    where p.title is null;
    
-- Join Multiple Tables
select
	comments.body,
    posts.title,
    users.first_name,
    users.last_name
    from comments
    inner join posts on posts.id = comments.post_id
    inner join users on users.id = comments.user_id
    order by posts.title;
    
-- Aggregate Functions
select count(id) from users;
select max(age) from users;
select min(age) from users;
select sum(age) from users;
select ucase(first_name),lcase(last_name) from users;

-- Group By / having
select age from users group by age;
select age from users where age > 20 group by age;
select age, avg(age) from users group by age having avg(age) >= 2;

-- Sub Query
select * from users where location = 
	(select location from users where email = 'sara@gmail.com');