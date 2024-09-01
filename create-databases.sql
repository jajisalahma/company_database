create table newemp_table (
emp_id int primary key,
fname varchar (30),
lname varchar (30),
birth_date date,
sex varchar (1),
salary int,
super_id int,
branch_id int
);

create table newbranch_table (
branch_id int primary key,
branch_name varchar(30),
mgr_id int
);

create table newsup_table (
super_id int primary key,
sup_name varchar (20),
student_id int
);

alter table newemp_table
add foreign key(super_id)
references newsup_table(super_id) on delete set null;

alter table newemp_table
add foreign key(branch_id)
references newbranch_table(branch_id) on delete set null;


alter table newsup_table
add foreign key(student_id)
references newemp_table(emp_id) on delete set null;

alter table newbranch_table
add foreign key (mgr_id)
references newemp_table (emp_id) on delete set null;




insert into newemp_table values (100, 'David', 'Scott', '1993-1-2', 'M', 81200, null, null);
insert into newsup_table values ( 210, 'Jane Edward', 100);
insert into newbranch_table values ( 1, 'Downtown Central', 100);

update newemp_table 
set branch_id = 1
where emp_id = 100;

update newemp_table 
set super_id = 210
where emp_id = 100;

select * from newemp_table;
select * from newbranch_table;
select * from newsup_table;


insert into newemp_table values (101, 'Micheal', 'Martin', '1990-5-3', 'M', 47000, null, null);
insert into newsup_table values ( 211, 'Aliya Jarbita', 101);
insert into newbranch_table values ( 3, 'Downtown Central', 101);

update newemp_table 
set branch_id = 3
where emp_id = 101;

update newemp_table 
set super_id = 211
where emp_id = 101;

insert into newemp_table values (102, 'Daniel', 'Levinson', '1979-11-22', 'M', 59300, null, null);
insert into newsup_table values ( 212, 'Mike Oslo', 102);
insert into newbranch_table values ( 2, 'Downtown Central', 102);

update newemp_table 
set branch_id = 2
where emp_id = 102;

update newemp_table 
set super_id = 212
where emp_id = 102;

insert into newemp_table values (103, 'Henry', 'josh', '1999-10-20', 'M', 64700, null, null);
insert into newsup_table values ( 213, 'Divine Favor', 103);
insert into newbranch_table values ( 4, 'Maplewood', 103);

update newemp_table 
set branch_id = 4
where emp_id = 103;

update newemp_table 
set super_id = 213
where emp_id = 103;


insert into newemp_table values (104, 'David', 'Hudson', '1993-4-12', 'M', 45000, null, null);
insert into newsup_table values ( 214, 'Azeeza Osho', 104);
insert into newbranch_table values ( 5, 'Pine Valley', 104);

update newemp_table 
set branch_id = 5
where emp_id = 104;

update newemp_table 
set super_id = 214
where emp_id = 104;

insert into newemp_table values (105, 'Kelvin', 'Porter', '1970-8-13', 'M', 45000, null, null);
insert into newsup_table values ( 215, 'Savior Joy', 105);
insert into newbranch_table values ( 6, 'Pine Valley', 105);

update newemp_table 
set branch_id = 6
where emp_id = 105;

update newemp_table 
set super_id = 215
where emp_id = 105;

create table newclient (
client_id int primary key,
client_fname varchar (20),
client_lname varchar(20),
branch_id int
);

alter table newclient
add foreign key (branch_id)
references newbranch_table(branch_id) ;

insert into newclient values (400, 'Jos', 'Armstrong', 6);
insert into newclient values (401, 'Kendall', 'Libe', 5);
insert into newclient values (402, 'Smith', 'Elijah', 4);
insert into newclient values (403, 'Yunus', 'Ilyas', 2);
insert into newclient values (404, 'Kendall', 'Libe', 1);

select * from newclient;

create table sales_data (
emp_id int,
client_id int,
total_sales int,
primary key(emp_id, client_id) 
);

alter table sales_data
add foreign key(emp_id) 
references newemp_table(emp_id);

insert into sales_data values ( 103, 404, 5000);
insert into sales_data values ( 102, 403, 3400);
insert into sales_data values ( 100, 402, 2000);
insert into sales_data values ( 101, 405, 4300);
insert into sales_data values ( 104, 401, 5400);
insert into sales_data values ( 105, 406, 12000);

select * from sales_data;
select * from newemp_table ;
select * from newemp_table order by sex, fname, lname;

select count(emp_id), sex from newemp_table
group by sex;

select sum(salary) from newbranch_table;
select count(branch_id), branch_name from newbranch_table group by branch_name;

select total_sales, client_id from sales_data order by total_sales desc;