# DQL (Data Query Languages)

# Select (Used to read data from tables)

# Select
# From
# Where
# Group bys
# Having
# Order by
# Limit

Use movies;

Select 
ActorID
,FirstName
,FamilyName
from movies.actor ;

Select Title,RunTimeMinutes,BoxOfficeDollars,OscarWins from movies.Film ;

# Where (Used to Filter the number of rows returned)

#   >,<,>=,<=,!=,<>,and,or,in,not in, between, like, not like, is null, is not null, regexp, exists, not exists

Select 
Title
,BoxofficeDollars
from movies.film
Where BoxofficeDollars > 1e9 ;

Select
Title
,OscarWins
from movies.film
Where OscarWins >=5 ;

Select
Title
,BoxofficeDollars
,OscarWins
from movies.film
Where BoxofficeDollars > 1e9 and OscarWins > 0 ;

Select
Title
,CertificateId
from movies.Film
Where CertificateId = 1 or CertificateID = 2 ;

Select
Title
,CertificateId
from movies.Film
Where CertificateId in (1,2) ;                                                     # 'or' can also represented as 'in'

Select
Title
,OscarWins
from movies.film
Where OscarWins != 0;

Select
Title
,OscarWins
from movies.film
Where OscarWins <> 0;                                                                  # <> and != indicate not equal

Select
Title
,ReleaseDate
from movies.film
Where Title = 'King Kong' ;

Select
Title
,ReleaseDate
from movies.film 
Where ReleaseDate >= '2000-1-1' ;

Select
Title
,OscarWins
from movies.film
where OscarWins >=5 and OscarWins <=10 ;

Select
Title
,OscarWins
from movies.film
where OscarWins between 5 and 10 ;

Select
Title
,ReleaseDate
from movies.film 
Where ReleaseDate >= '2000-1-1' and ReleaseDate <= '2000-5-30' ;

Select																									
Title
,ReleaseDate
from movies.film 
Where ReleaseDate between '2000-1-1' and  '2000-5-30' ;

Select
Title
,CertificateID
,BoxofficeDollars
,OscarWins
from movies.film
Where BoxofficeDollars > 1e9 and OscarWins > 0 and CertificateID in (1,2);            # 'in' is used insted of 'or' function

Select
Title
,CertificateID
,BoxofficeDollars
,OscarWins
from movies.film
Where BoxofficeDollars > 1e9 and OscarWins > 0 and (CertificateId = 1 or CertificateId = 2);

# 1. Display the list of all full time employees but only those contract employees with jobrating 1

Select
First
,Last
,Status
,JobRating
from employees.employees
Where Status = 'Full Time' or (Status = 'Contract' and JobRating = 1);

# 2. Display the list of Hit films which has won oscars

Select 
Title
,BoxofficeDollars
,BudgetDollars
,OscarWins
from movies.film
Where BoxOfficeDollars > BudgetDollars and OscarWins > 0 ;

# 3. Display the list of employees hired in 2000 and received salary between 50000 to 80000

Select
First
,Last
,HireDate
,Salary
from employees.employees
Where HireDate between '2000-1-1' and '2000-12-31' and Salary between 50000 and 80000;

Select
First
,Last
,HireDate
,Salary
from employees.employees
Where HireDate >= '2000-1-1' and HireDate <= '2000-12-31' and Salary between 50000 and 80000;

# 4. Display the list of full time and contract employees with jobrating 1

Select
First
,Last
,Status
,JobRating
from employees.employees
Where Status in ('Full Time','Contract') and JobRating = 1;    

# 5. Display the list of all status employees except full time

Select 
First
,Last
,Status
from employees.employees
Where Status != 'Full Time' ;

# Like (Contains filter - Used to search for a pattern)
# % (Zero or any number of characters)
# _ (Single Character)

Select *
from movies.film
where Title like '%Star%' ;

Select *
from movies.film
where Title like 'Star%' ;

Select *
from movies.film
where Title like '%Stars' ;

Select *
from movies.film
where Title like '%Star%' or Title like '%Die%' or Title like '%King%' ;

Select *
from movies.film
Where Title like '_a%' ;

Select *
from movies.film
Where Title like '__a%' ;

Select *
from movies.film
where Title not like '%Star%' ;

Select *
from movies.film
Where Title not like '% 2%' and title like '%2%' ;

Select *
from movies.film
Where Title not like '% 2%';

# 1. Display the list of films which starts with c or h but ends with od

Select
Title
,BoxofficeDollars
from movies.film
Where Title like 'C%od' or Title like 'H%od' ;

Select
Title
,BoxofficeDollars
from movies.film
Where (Title like 'C%' or Title like 'H%') and Title like '%od' ;

# 2. Display the list of films starting and ending with E 

Select *
from movies.film
where Title like 'E%E' ;

Select *
from movies.film
where Title like 'E%' and Title like '%E' ;

# 3. Display the list of films which is second part of that movie series

Select *
from movies.film
where Title like '% 2%' or (Title like '% II%' and Title not like '% III%') ; 

# 4. Display the list of films which won oscars and not containing the words star, king or die in title

Select 
Title
,OscarWins
from movies.film
where OscarWins > 0 and Title not like '%Star%' and Title not like '%King%' and Title not like '%Die%';

# 5. Display the list of films ending with v,w,x,y,or z and having a in second letter 

Select
Title
from movies.film
Where (Title like '%V' or Title like '%W' or Title like '%X' or Title like '%Y' or Title like '%Z')
and Title like '_a%' ;
                                                      #or
 select
 title
 from movies.film
 where title regexp '[vwxyz]$'and title like '_a%' ;                  # find the ans for this in short
                                                         #or  
 select
 title
 from movies.film
 where title regexp 'v$|w$|x$|y$|z$'and title like '_a%' ; 
 
Select *
from movies.film
Where BoxOfficeDollars is null and BudgetDollars is null;

Select *
from movies.film
Where BoxOfficeDollars is not null ;

# regexp (contains filter)
# used for complex pattern matching

# ^ (Starts with)
# $ (Ends with)
# | (Or)
# [] (range of values)

Select *
from movies.film
Where Title regexp 'Star' ;

Select *
from movies.film
Where Title regexp '^Star' ;

Select *
from movies.film
Where Title regexp 'Stars$' ;

Select *
from movies.film
where Title regexp 'Star|King|Die';

Select *
from movies.film
where Title regexp 'Stars$|King|^Die';

Select *
from movies.film
where Title regexp '^[XYZ]' ;

Select *
from movies.film
where Title regexp '^X|^Y|^Z' ;

Select *
from movies.film
where Title regexp '^[VWXYZ]' ;

Select *
from movies.film
where Title regexp '^[V-Z]' ;

Select *
from movies.film
where Title regexp '[0-9]' ;

# 1. Display the list of films which contains only Text 

Select *
from movies.film
where Title not regexp '[0-9]' ;

# 2. Display the list of films starting with number but not ending with number

Select *
from movies.film
where Title regexp '^[0-9]' and Title not regexp '[0-9]$' ;

# 3. Display the list of films which has won oscars but review is null or not seen it. 

Select *
from movies.film
where OscarWins > 0 and (Review is null or Review = 'Not seen it.');

# 4. Display the list of films containing only four characters in the title

Select *
from movies.film
where Title like '____' ;

Select *
from movies.film
where Length(Title) = 4;

# 5. Display the list of films starting with c or h but ending with od (using regexp)

Select *
from movies.film
where Title regexp '^[CH]' and Title regexp 'od$' ;

Select *
from movies.film
where Title regexp '^C|^H' and Title regexp 'od$' ;

# 6. Display the list of films containing the word MAN or starting with number or ending with King

Select *
from movies.film
where Title regexp 'Man|^[0-9]| King$' ;

# Select 
# from 
# Where 
# Group by
# Having
# Order by
# Limit

# Order by (Used for Sorting)
# Ascending sort,Descending sort,multiple sort,custom sort

Select 
Title
,BoxofficeDollars
from movies.film
Order by BoxOfficeDollars desc
Limit 10;

Select 
Title
,RunTimeMinutes
from movies.film
Order by RunTimeMinutes;

Select 
Title
,BoxofficeDollars
from movies.film
where BoxofficeDollars is not null
Order by BoxOfficeDollars ;

Select 
Title
,BoxofficeDollars
from movies.film
where BoxofficeDollars is not null
Order by BoxOfficeDollars ;

Select 
First 
,Last
,Status
,Salary
from employees.employees
Order by Status asc,Salary desc ;

# 1. Display Top 5 full time employees list based on salary

Select 
First
,Last
,Status
,Salary
from employees.employees
Where Status = 'Full Time'
Order by Salary desc
Limit 5 ;

# 2. Display the Top 10 films list with longest runtime

Select 
Title
,RunTimeMinutes
from movies.film
Order by RunTimeMinutes desc 
Limit 10 ;

# 3. Display the Youngest 5 female actor details

Select *
from movies.actor
Where Gender = 'Female'
Order by Dob desc 
Limit 5 ;

# 4. Sort the employees list from earliest hired to most recent hired ,then sort by names in ascending order

Select *
from employees.employees
Order by HireDate asc,First asc;

Select 
Title as MovieName
,BoxofficeDollars as  Revenue
,BudgetDollars as Budget
,BoxOfficeDollars - BudgetDollars as 'Profit Loss'
from movies.film ;


Select
First
,Last
,Concat(First,' ',Last) as 'Full Name'
from employees.employees ;

Select
Title
,RunTimeMinutes
,RunTimeMinutes/60 as Hours
,Round(RunTimeMinutes/60) as RHours
,Floor(RunTimeMinutes/60) as CHours
,RunTimeMinutes mod 60 as Minutes
from movies.film ;

Select
Title
,RunTimeMinutes
,Concat(Floor(RunTimeMinutes/60),' Hours ',RunTimeMinutes mod 60 ,' Minutes') as Duration
from movies.film ;





                                     # Conditional Statements (If , case when)



Select
concat(First,' ',Last) as FullName
,Status
,If(Status = 'Full Time','Permanent','Temporary') as EmpType
from employees.employees ;

Select
concat(First,' ',Last) as FullName
,Status
,Salary
,If(Status = 'Full Time',Salary * 1.1,Salary) as NewSalary
from employees.employees ;

Select
concat(First,' ',Last) as FullName
,Status
,Jobrating
,Salary
,If(status = 'Full Time' or (Status = 'Contract' and JobRating = 1),Salary * 1.1,Salary) as NewSalary
from employees.employees ;

Select
Title
,BoxofficeDollars
,If(BoxofficeDollars > 1e9,'Blockbuster','Others') as MovieType
from movies.film ;

# 1. Hike the Salary by 10% for both full time and contract employees with jobrating 1

Select
concat(First,' ',Last) as FullName
,Status
,JobRating
,Salary
,If(status in ('Full Time','Contract') and Jobrating = 1,Salary * 1.1,Salary) as NewSalary
from employees.employees ;

Select
concat(First,' ',Last) as FullName
,Status
,JobRating
,Salary
,If((status ='Full Time' or Status ='Contract')  and Jobrating = 1,Salary * 1.1,Salary) as NewSalary
from employees.employees ;

# 2. Display as classic blockbuster if a film has won oscars and also collected more than 1e9,else others

Select
Title
,BoxofficeDollars
,OscarWins
,If(BoxofficeDollars > 1e9 and OscarWins > 0,'Classic Blockbuster','Others') as MovieType
from movies.film ;

# 3. Display as text title if title contains only text ,else alhanumeric title

Select
Title
,If(Title not regexp '[0-9]','Text title','Alphanumeric Title') as MovieType
from movies.film ;

# 4. Hike the salary by 10% for all full time employees but only those 
#         contract employees hired before 2003 year

Select
concat(First,' ',Last) as FullName
,Status
,HireDate
,Salary
,If(Status = 'Full Time' or (Status = 'Contract' and HireDate < '2003-1-1'),Salary * 1.1,Salary) as NewSalary
from employees.employees ;

# 5. Display the output in this format - Jurassic park is a hit film which won 5 oscars

Select
Concat(Title,' is a ',If(BoxofficeDollars > BudgetDollars,'Hit Film ','Flop Film '),'which won ',Oscarwins,' Oscars') as MovieDesc
from movies.film ;

Select
concat(First,' ',Last) as FullName
,Status
,Salary
,If(Status = 'Full Time',Salary * 1.1,If(Status = 'Contract',Salary * 1.05,Salary)) as NewSalary
from employees.employees ;

Select
Title
,OscarWins
,If(OscarWins = 0,'Average Film',If(OscarWins <= 5,'Great Film','Classic Film')) as OscarType
from movies.film ;

Select
Title
,RunTimeMinutes
,If(RunTimeMinutes < 100,'Short Film',If(RunTimeMinutes < 160,'Avg Length Film','Long Film')) as Length_Category
from movies.film ;

# 1. Display classic blockbuster if BO > 1e9 and oscars more than 0,Blockbuster if BO > 1e9 and oscars = 0 ,else others

Select
Title
,BoxofficeDollars
,OscarWins
,If(BoxofficeDollars > 1e9 and OscarWins > 0,'Classic Blockbuster',If(BoxofficeDollars > 1e9,'Blockbuster','Others')) as MovieType
from movies.film ;

# 2. Give 10% Hike for employees with jobrating 4 or more,5% hike if jobrating between 2 to 3,0% hike for others

Select
concat(First,' ',Last) as FullName
,Jobrating
,Salary
,If(Jobrating >= 4,Salary * 1.1,If(JobRating >=2 ,Salary * 1.05,Salary)) as NewSalary
from employees.employees ;

# 3. Display text title if title contains only text,alphanumeric title if it contains text and number,numeric title for others

Select
Title
,If(Title regexp '[A-Z]' and Title not regexp '[0-9]','Text title',If(Title regexp '[A-Z]','Alphanumeric Title','Numeric Title')) as MovieType
from movies.film ;

# 4. Display old movie if releasedate before 1980, middle aged movie if release date 1990-2008,recent movie for others

Select
Title
,ReleaseDate
,If(ReleaseDate < '1980-1-1','Old Movie',If(ReleaseDate < '2008-1-1','Middle Aged Movie','Recent Movie')) as MovieType
from movies.film ;

# 5. Give 10% hike for full time employees,5% hike for contract employees with jobrating 1,0% for others

Select
concat(First,' ',Last) as FullName
,Status
,JobRating
,Salary
,If(Status = 'Full Time',Salary * 1.1,If(Status = 'Contract' and Jobrating = 1,Salary * 1.05,Salary)) as NewSalary
from employees.employees ;

# Case
# when condition1 is true then result1
# when condition2 is true then result2
# when condition3 is true then result3
# else result4
# end

Select
concat(First,' ',Last) as FullName
,Status
,case
when status = 'Full Time' then 'Permanent'
when status = 'Contract' then 'Temporary'
else 'Terminated'
end as EmpType
from employees.employees ;

Select
Title
,OscarWins
,case
when OscarWins = 0 then 'Average Film' 
when OscarWins < 5 then 'Great Film'
else 'Classic Film'
end as MovieType
from movies.film ;

# 1. Display classic blockbuster if BO > 1e9 and oscars more than 0,Blockbuster if BO > 1e9 and oscars = 0 ,else others

Select
Title
,BoxofficeDollars
,OscarWins
,case
when BoxofficeDollars > 1e9 and OscarWins > 0 then 'Classic Blockbuster'
when BoxofficeDollars > 1e9 then 'Blockbuster'
else 'Others'
end as MovieType
from movies.film ;

# 2. Give 10% Hike for employees with jobrating 4 or more,5% hike if jobrating between 2 to 3,0% hike for others

Select
concat(First,' ',Last) as FullName
,Jobrating
,Salary
,case
when Jobrating >=4 then Salary * 1.1
when JobRating >=2 then Salary * 1.05
else salary
end as NewSalary
from employees.employees ;


# 3. Display text title if title contains only text,alphanumeric title if it contains text and number,numeric title for others

Select
Title
,case
when Title regexp '[A-Z]' and Title not regexp '[0-9]' then 'Text Title'
when Title regexp '[A-Z]' then 'AlphaNumeric Title'
else 'Numeric Title'
end as MovieType 
from movies.film ;

# 4. Display old movie if releasedate before 1980, middle aged movie if release date 1990-2008,recent movie for others

Select
Title
,ReleaseDate
,case
when ReleaseDate < '1980-1-1' then 'Old Movie'
when ReleaseDate < '2008-1-1' then 'Middle Aged Movie'
else 'Recent Movie'
end as MovieType
from movies.film ;

# 5. Give 10% hike for full time employees,5% hike for contract employees with jobrating 1,0% for others

Select
concat(First,' ',Last) as FullName
,Status
,Jobrating
,Salary
,case
when Status = 'Full Time' then Salary * 1.1
when Status = 'Contract' and Jobrating = 1 then salary * 1.05
else Salary
end as Newsalary
from employees.employees ;

# Sort Employees Data in order - Full Time,Contract,Half-Time,Hourly

Select
concat(First,' ',Last) as FullName
,Status
,Salary
from employees.employees
Order by case
when status = 'Full Time' then 1
when Status = 'Contract' then 2
when Status = 'Half-Time' then 3
else 4
end ,Salary desc ;

# Sort the movie data to display all text titles at the top ,then alphanumeric titles and then numeric titles
#    also title should be sorted in each group

# Avatar
# Avengers
# Jurassic Park
# Spider Man 2
# Star wars 2
# Terminator 2
# 300
# 2012

Select
Title
from movies.film
Order by case
when Title regexp '[A-Z]' and Title not regexp '[0-9]' then 1
when Title regexp '[A-Z]' then 2
else 3
end asc,Title asc;

# DQL-data query language
# 5. Display the list of films ending with v,w,x,y,or z and having a in second letter
Select
Title
from movies.film
Where (Title like '%V' or Title like '%W' or Title like '%X' or Title like '%Y' or Title like '%Z')
and Title like '_a%' ;
select
first
,last
,concat(first,' ',last) as 'full name'
from employees;
select *
from employees.employees;

select
title
,runtimeminutes
,runtimeminutes/60 as hours
,round(runtimeminutes/60,1) as Rhours
,floor(runtimeminutes/60) as Hhours
,RunTimeMinutes mod 60 as miinutes
,concat(floor(runtimeminutes/60) ,'H:',RunTimeMinutes mod 60 ,'M') as 'time'
from movies.film;

select
title
,runtimeminutes
,concat(floor(runtimeminutes/60) ,'H:',RunTimeMinutes mod 60,'M' ) as 'time'
from movies.film;

# conditional statement (if , case when)
select
concat(first,' ',last) fullname
,status
,salary
,if (status= 'full time',salary*0.1+salary, salary) empType
from employees.employees;

select
concat(first,' ',last) fullname
,status
,salary
,JobRating
,if(status = 'full time' or (status = 'contract' and jobrating = 1),salary*0.1+salary,salary) newsalary
from employees.employees;

select
title
,BoxOfficeDollars
,if ( boxofficedollars > 1e9,'blockbuster','other') as hitfilm
from movies.film;

select
concat(first,' ',last) fullname
,status
,salary
,jobrating
,if ((status= 'full time' and status='contract') and jobrating =1, salary*01+salary,salary) newsalary
from employees.employees;
select
title
,OscarWins
,BoxOfficeDollars
,if(oscarwins > 0 and boxofficedollars>1e9, 'classic blockbuster', 'other') hitfilm
from movies.film;
select
concat(first,' ',last) fullname
,status
,jobrating
,salary
,if(status in('full time','contract') and jobrating=1,salary*0.1+salary,salary) newsalary
from employees.employees;
select
title
,if(title not regexp '[0-9]', 'text title', 'alpanumeric title') as 'title type'
from movies.film;
select
concat(first,' ',last) fullname
,status
,hiredate
,salary
,if(status='fulltime' or (status='contract' and hiredate<'2003-1-1'),salary*0.1+salary,salary) newsalary
from employees.employees;
select
title
,oscarwins
,concat(title, ' is a ',if(boxofficedollars > budgetdollars,'hit film ', 'flopfilm '), 'which won ', oscarwins, ' oscars' ) as 'review'
from movies.film;
select*
from movies.film;
select
concat(first,' ',last)as fullname
,status
,salary
,IF(Status='FULL TIME',Salary*1.1,if(status= 'contract' ,salary*1.05,salary)) as newsalary
from employees.employees;
select
title
,oscarwins
,if(oscarwins=0,'averagefilm', if(oscarwins<5,'great film','classic film')) as oscARTYPE
from movies.film;
select
title
,runtimeminutes
,if(runtimeminutes<100,'shortfilm',if(runtimeminutes<160,'avg length film','long film'))as length_categoy
from movies.film;
select
title
,oscarwins
,boxofficedollars
,if(boxofficedollars>1e9 and oscarwins>0,'classic blockbuster',if(boxofficedollars>1e9 and oscarwins=0,'bolockbuster','others')) as movietype
from movies.film;
select
concat(first,' ',last) as 'full name'
,JobRating
,salary
,if(JobRating>=4,salary*1.1,if(jobrating between 2 and 3 ,salary*1.05, salary)) as'salary hike'
from employees.employees;
select
title
,if(title not regexp '[0-9]','text title',if(title regexp '[a-z]','alphanumerical title','numerical title')) as title 
from movies.film;
select
Title
,ReleaseDate
,if(ReleaseDate<'1990-01-01','old movie',if(ReleaseDate between'1990-01-01' and '2009-01-01','middle aged movie','recent movie')) as'type of movie'
from movies.film;
select
title
,ReleaseDate
from movies.film;
select
concat(first,' ',last) as sullname
,status
,jobrating
,salary
,if(status = 'full time', salary*1.1,if(status='contract' and jobrating =1, salary*1.05, salary))as newsalary
from employees.employees;

#case
#when condition 1 is true then result1
#when condition 2 is true then result2
#when condition 3 is true then result3
#else result 4 
#end 

select
concat(FIRST,' ',LAST)as fullname
,status
,case
when status='full time' then 'permanent'
when status='contract' then 'temporary'
else 'terminated'
end as emptype
from employees.employees;
select
title
,oscarwins
,case
when oscarwins=0 then 'average film'when oscarwins <5 then 'greatfilm'
else 'classic film'
end as filmtype
from movies.film;
select
title
,oscarwins
,boxofficedollars
,case
when boxofficedollars >1e9 and oscarwins>0 then 'classic blockbuster'
when boxofficedollars>1e9 and oscarwins =0 then 'blockbuster'
else 'other' 
end as filmtype
from movies.film;

select
concat(first,' ',last) as 'fullname'
,status
,jobrating
,salary
,case
when jobrating >=4 then salary*1.1
when jobrating between 2 and 4 then salary*1.05
else  salary
end as updatedsalary
from employees.employees;
select
title
,case
when title regexp '[a-z]' and title not regexp '[0-9]'then 'text title'
when title regexp '[a-z]' then 'alphanumerical'
else 'numeric title'
end as movietype
from movies.film;
select
title
,releasedate
,case
when ReleaseDate <'1980-1-1'  then 'old movie'
when releasedate <'2008-1-1' then 'middle aged'
else 'new movie'
end as movietype
from movies.film;
select
concat(first,' ',last) as fullname
,status
,jobrating
,salary
,case
when status = 'full time' then salary*1.1
when status ='contract' and jobrating =1 then salary*1.05
else salary
end as newsalary
from employees.employees;
 
 #sort employees data in order= fulltime contract halftime  hourly using      'order by'
 
 select
 concat(first,' ',last) as fullname
 ,Status
 ,Salary
 from employees.employees
 order by case
 when Status='full time' then 1
 when Status='contract'then 2
 when Status='half-time' then 3
 else 4
 end, salary desc;
 
 select
 Title
 from movies.film
 order by case
 when title regexp '[a-z]' and title not regexp '[0-9]' then 1
 when title regexp'[a-z]' then 2
 else 3
 end , title;
 
