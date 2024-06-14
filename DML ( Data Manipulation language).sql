Insert into Gender
Values(default,'Male')
,(default,'Female');

Insert into Department(Department)
Values('IT')
,('HR')
,('Sales')
,('Finance');

Insert into City
Values(default,'Bengaluru')
,(default,'Chennai')
,(default,'Mumbai')
,(default,'Hyderabad') ;

Insert into Employee
Values(default,'Hitesh','2000-1-1',1,1,1,'7204370992','Hitesh.analyst2@gmail.com',90000,1);

Insert into Employee
Values(default,'Raj','2000-1-1',1,1,1,'7204370993','Hitesh.analyst3@gmail.com',90000,1);

Insert into Plan(Plan)
Values('A')
,('B')
,('C')
,('D');

Insert into Region (Region)
Values ('Asia')
,('Europe')
,('America')
,('Oceania');

Insert into Country
Values(default,'India',1)
,(default,'China',1)
,(default,'France',2)
,(default,'USA',3);

Insert into Users 							# insert ,update, delete is dealing with table to edit any data insiiide table
Values(default,'Hitesh','123abc','Hitesh2786!','Hitesh.analyst2@gmail.com',1,1,1);

Insert into Users
Values(default,'Mohan','123efe','Hitesh278*','Hitesh.analyst3@gmail.com',1,1,1);

set sql_safe_updates = 0 ;

Delete from Users
where UserName = 'Mohan' ;

Create table movies.Starfilms as
Select *
from movies.film
where Title like '%Star%' ;

Insert into starfilms
Select *
from movies.film
where Title like '%Dark%' ;

Select *
from starfilms ;

Drop table Starfilms ;

drop table filmcopy ;

Create table movies.filmcopy as
Select *
from movies.film ;

Select * from filmcopy ;

Create table employees.empcopy as
Select *
from employees.employees ;

Select *
from employees.empcopy ;

set sql_safe_updates = 0 ;

update employees.empcopy
set Department = Replace(Department,'/',' ');

select 
department
,left(Department,1) as 1f 
,mid(department,2,length(department)) as md
from employees.empcopy;

update employees.empcopy
set department=concat(replace(left(department,1),'M','A'),mid(department,2,length(department)));

Update employees.empcopy
set Status = 'Full Time'
,Salary = Salary * 1.1 
Where Status = 'Contract' ;

Select * from employees.empcopy ;

drop table employees.empcopy ;

Update employees.empcopy
set Salary = case 
when Status = 'Full Time' then Salary * 1.1
when Status = 'Contract' then Salary * 1.05
else Salary
end ; 
SELECT * FROM employees.empcopy;
# 1. Add new column Email to Empcopy table

Alter table employees.empcopy
add Email varchar(500);

# 2. Update Email column to FullName@gmail.com 

Update employees.empcopy
set Email = concat(First,'.',Last,'@gmail.com') ;

Select * from employees.empcopy ;

# 3. Update the Titles containing the word War to Peace (filmcopy table)

Update movies.filmcopy
set Title = Replace(Title,'War','Peace');

Select *
from movies.filmcopy ;

# 4. Update FullName in actor table to FirstName FamilyName

Update movies.actor
set FullName = case
when FamilyName is null then FirstName
else concat(FirstName,' ',FamilyName)
end ;

# 5. Update FullName in Director table to FirstName FamilyName

Update movies.Director 
set FullName = case
when FamilyName is null then FirstName
else concat(FirstName,' ',FamilyName)
end ;

# Update salary to salary + 10% if jobrating is divisible by 5
# Update salary to salary + 5% if jobrating is divisible by 4
# Update salary to salary + 2% if jobrating is divisible by 2
# Others no update

Update employees.empcopy
set Salary = case
when Jobrating mod 5 = 0 then Salary  * 1.1
when Jobrating mod 4 = 0 then Salary  * 1.05
when Jobrating mod 2 = 0 then Salary  * 1.02
else Salary
end ;