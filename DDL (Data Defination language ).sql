# DDL (Data Definition Language)

# Primary key - Its a key used to uniquely identify every record in your table 

Create database HR2 ;

Use HR2 ;

Create table Employee
(
EmployeeId int primary key auto_increment
,EmpName varchar(300)
,HireDate datetime
,GenderId int
,DepartmentId int
,CityId int
,Phone char(10)
,Email varchar(100)
,Salary double
) ;

Create table Gender
(
GenderId int primary key auto_increment
,Gender varchar(300)
) ;

Create table Department
(
DepartmentId int primary key auto_increment
,Department varchar(300)
);

Create table City
(
CityId int primary key auto_increment
,City varchar(300)
);

Alter table Employee
add Jobrating int ,
add SSN char(10) ;

Alter table Employee
Drop column SSN ;

Alter table Employee
Add constraint FK_Employee_GenderId
foreign key(GenderId) references Gender(GenderId) ;

Alter table Employee
Add constraint FK_Employee_DepartmentId
foreign key(DepartmentId) references Department(DepartmentId);

Alter table Employee
rename column Department to DepartmentId ;

Alter table Employee
Add constraint Fk_Employee_CityId
foreign key(CityId) references City(CityId);

Alter table employee
Drop constraint FK_Employee_CityId ;

Alter table Employee
Add constraint UK_Employee_Phone
Unique(Phone);

Alter table Employee
Add constraint UK_Employee_Email
Unique(Email);

Alter table employee
add constraint CK_Employee_Phone
Check(length(Phone)=10) ;

Alter table employee
add constraint CK_Employee_Phone2
Check(Phone not regexp '[A-Z]') ;

Alter table Employee
add constraint Ck_Employee_Email
Check(Email like '%@%');

# Create a database by name APP

Create Database App ;
Use app ;

# Create table Users (UserId,UserName,LoginId,Password,Email,CountryId,PlanId,Rating)

Create table Users
(
UserId int primary key auto_increment
,UserName varchar(300)
,LoginId char(6)
,Password varchar(300)
,Email varchar(300)
,CountryId int
,PlanId int
,Rating int
) ;

Alter table Users
Modify LoginId char(50);

# Create table Country(CountryId,Country,RegionId)

Create table Country
(
CountryId int primary key auto_increment
,Country varchar(500)
,RegionId int
) ;

# Create table Plan(PlanId,Plan)

Create table Plan
(
PlanId int primary key auto_increment
,Plan char(1)
);

# Create table Region(RegionId,Region)

Create table Region
(
RegionId int primary key auto_increment
,Region varchar(500)
);

# foreign key CountryId,PlanId 

Alter table Users
add constraint Fk_Users_CountryId
Foreign key(CountryId) references Country(CountryId) ;

Alter table Users
add constraint Fk_Users_PlanId
Foreign key(PlanId) references Plan(PlanId) ;

# Foreign key RegionId

Alter table Country
add constraint FK_Country_RegionId
Foreign key(RegionId) references Region(RegionId) ;

# LoginId should be unique and 6 character length

Alter table Users
add constraint UK_Users_LoginId
Unique(LoginId) ;

Alter table Users
add constraint UK_Users_Password
Unique(Password);

Alter table Users
add constraint CK_Users_LoginId
Check(Length(LoginId) = 6 and LoginId regexp '[0-9][0-9][0-9][A-Z][A-Z][A-Z]');

# Password should be unique
# LoginId should have numbers in first 3 characters and alphabets in next 3 characters
# password should contain atleast one alphabet,one number and one special character

Alter table Users                                                  # alter means changing table properties like adding colume removing colume adding constriens 
add constraint CK_Users_Password
Check(Password regexp '[A-Z]' and Password regexp '[0-9]' and 
(Password regexp '[!@#%&*()]' or Password like '%$%' or Password like '%^%'));

# Plan column in Plan table should be either A,B,C or D

Alter table Plan
add constraint Ck_Users_Plan
Check(Length(Plan) = 1 and Plan regexp '[A-D]');