#Inner join: it will only write the matching records
select
title
from tblauthor a inner join tblbook b on a.authorID = b.authorID;

# left outer join: it will write all the records from left table even thier is no match in right table
select
title
from tblauthor a left join tblbook b on a.authorID = b.authorID;

# right outer join:it will write all the records from right table even thier is no match in left table
select
title
from tblauthor a right join tblbook b on a.authorID = b.authorID;

# fulljoin: all the records are combined
select
title
from tblauthor a full join tblbook b on a.authorID = b.authorID;

# cross join : its a cartetion prduct of 2 table ,will get all possible combination 
select
title
from tblauthor a cross join tblbook b ;



select
Title
,FullName as director
from movies.film f inner join movies.director d on f.directorID=d.directorID;

# display genre name of every film
select
title
,genre
from movies.film f inner join movies.genre g on f.GenreID=g.GenreID;

# display language name of every film
select
title
,language
from movies.film f inner join movies.language l on l.LanguageID=f.LanguageID;

# display studio name of every film
select
Title
,studio
from movies.film f  inner join movies.studio s on f.StudioID=s.StudioID;

# display certificat name of every film
select
title
,certificate
from movies.film f inner join movies.certificate c on c.CertificateID=f.CertificateID;

# display country name of every film
select
title,country
from movies.film f inner join movies.country c on c.CountryID=f.CountryID;

select
fullname as director
,count(*) as no_of_films
,sum(OscarWins) as totaloscars
,avg(BoxOfficeDollars)as avgBOD
from movies.film f inner join movies.director d on f.directorid=d.directorid
group by fullname;

describe film;

select
studio
,count(*) as no_of_film
from movies.film f inner join movies.studio s on s.studioid=f.studioid
group by studio
order by no_of_film desc;

#group by : to remove duplicity and also to group the combinaton ,agrigate column and alsotocombine multipale column

select 
FullName
,studio
,count(*) as no_of_film
from movies.film f 
inner join movies.director d on f.directorid=d.DirectorID
inner join movies.studio s on f.studioid=s.studioid
group by FullName,studio;

select
count(*) as no_of_film
from movies.film;

select
count(*) as no_of_film
,count(boxofficedollars) as no_of_bOD #it will cout less as their are null in the column
from movies.film;

select
count(*) as no_of_film
,count(boxofficedollars) as no_of_BOX
,count(filmid) as countfilm
from movies.film;
select
Department,count(*) as no_of_emp
from employees.employees
group by Department;

#aggregate functions (sum,count,avg,max,min)
# apart from aggrigate column , any other column is select list has to be in group by 

select 
department
,status 
,count(*) as no_of_emp
from employees.employees
group by Department,Status
order by Department;

#display the count of film which won ocscars 0,1...,sort the oscar in descending order
select
OscarWins
,count(*) as no_of_oscar
from movies.film
group by OscarWins
order by OscarWins desc;

# display the avg runtime of movies by genre and also no. of film by genre ,sort the list by highest to lowest avg 
select
genre
,avg(RunTimeMinutes) as avgruntime
,count(*) as no_of_film
from movies.film f inner join movies.genre g on f.GenreID=g.GenreID
group by genre
order by avgruntime desc;

# display the no. of film by certificate and max boxofficedollars of movies by certificate
select
certificate 
,count(*) as no_of_film
,max(boxofficedollars) as maxBOX
from movies.film f inner join movies.certificate c on c.CertificateID=f.CertificateID
group by certificate;

#display the maxsalary of employees by status
select
status
,max(Salary)as maxsalary
from employees.employees
group by status ;

#display country wise avgboxofficedollars
select
country
,avg(boxofficedollars) as avgBOX
from movies.film f inner join movies.country c on c.CountryID=f.CountryID
group by country;

select
Player_Name
,count(*) as MOM
from ipl.match m inner join player p on m.man_of_the_match=p.Player_Id
group by Player_Name
order by MOM desc;
select 
distinct department   # which is used toavoid duplicate 
from employees.employees;
select
Venue_Name
, count(*) as no_of_match
from ipl.match m inner join ipl.venue v on m.venue_id= v.Venue_Id
group by Venue_Name
order by no_of_match desc;
select
Country_Name
,count(*) as noofmatch
from ipl.match m inner join ipl.venue v on m.venue_Id=v.venue_id
inner join ipl.city c on  v.city_id=c.city_id
inner join ipl.country co on co.Country_Id= c.country_id
group by Country_Name
order by noofmatch;
select
Season_Year
,count(*) as noofseason
from ipl.match m inner join ipl.season s on m.season_ID=s.season_Id
group by Season_Year
order by noofseason desc;

select
title
,fullname
,genre
,studio
,Country
,certificate
,language
from movies.film f inner join movies.director d on d.directorid=d.directorid
inner join movies.genre g on f.genreid=g.genreid
inner join movies.studio s on f.studioid
inner join movies.certificate c on f.certificateid=c.certificateid
inner join movies.country co on f.countryid=co.countryid
inner join movies.language l on f.languageid=l.languageid;

select
case
when boxofficedollars>budgetdollars then 'hit film'
else 'flop film'
end as movietype
,count(*) as nofilms
from movies.film
group by movietype;

select
genre
,count(case when BoxOfficeDollars> BudgetDollars then 'hit film' end) as hitcount
,count(case when boxofficedollars< budgetdollars then 'flopfilm' end ) as flopcount
from movies.film f inner join movies.genre g on f.GenreID=g.GenreID
group by genre;

# display the no of venues in each city,which city has more stadium
select
city_name
,count(*) as nofvenues
from ipl.venue v inner join ipl.city c on v.City_Id=c.City_Id
group by City_Name
order by nofvenues desc;
select
city_name
,count(*) as nofvenues
,group_concat(venue_name)as venuelist                                                         # to see the name of the venue
from ipl.venue v inner join ipl.city c on v.City_Id=c.City_Id
group by City_Name
order by nofvenues desc;

# display the no of classic film(oscar>5) ,greAT FILM(oscar1-40 and average film in each genre 
select
genre
,count(case when oscarwins>=5 then 'classic film' end ) as no_of_classicfilms
,count(case when oscarwins regexp '[1-4]' then 'great film' end )as no_of_greatfilm
,count(case when oscarwins =0 then 'averagefilm' end) as no_of_averagefilm
from movies.film f inner join movies.genre g on f.GenreID= g.GenreID
group by genre ;
                                       #or
select
genre
,count(case when oscarwins>=5 then 1 end ) as no_of_classicfilms
,count(case when oscarwins regexp '[1-4]' then 1 end )as no_of_greatfilm
,count(case when oscarwins =0 then 1 end) as no_of_averagefilm
from movies.film f inner join movies.genre g on f.GenreID= g.GenreID
group by genre ;

#display the no of matches won by each team iin ipl , sort in desc by wins
select 
Team_Name
,count(*) as nofmatchwon
from ipl.match m inner join ipl.team t on m.Match_Winner=t.Team_Id
group by Team_Name
order by nofmatchwon desc;

# display the count of tie matches in each season 
select 
Season_Year
,count(*) as noftie
from ipl.match m inner join ipl.season s on m.season_ID=s.season_ID
inner join ipl.win_by wb on m.Win_Type=wb.Win_Id
group by Season_Year;                                                   # mistake in whixh their is no mention of tie match its just include all match

select 
Season_Year
,count(*) as noftie
from ipl.match m inner join ipl.season s on m.season_ID=s.season_ID
inner join ipl.win_by wb on m.Win_Type=wb.Win_Id
where wb.win_type='tie'                                         
group by Season_Year;

# to display the team name 
# if multipal column of table is connected to same table have to use diff allias...alter

select 
Match_Date
,t.team_name as team1
,t2.Team_Name as team2
,t3.Team_Name as team_tosswinner
,t4.Team_Name as team_wins
from ipl.match m inner join ipl.team t on m.team_1=t.team_ID
inner join ipl.team t2 on m.team_2=t2.team_ID
inner join ipl.team t3 on m.toss_winner=t3.team_id
inner join ipl.team t4 on m.match_winner=t4.team_ID;

select
Season_Year
,p.Player_Name as man_of_match
,p2.Player_Name as orangecap
,p3.Player_Name as purplecap
from ipl.season s inner join player p on s.man_of_the_series=p.player_ID
inner join player p2 on s.orange_cap=p2.player_ID
inner join player p3 on s.purple_cap= p3.player_ID;

# no of matches played by teams 
select
team_name
,count(*) as no_of_match
from ipl.match m inner join ipl.team t on m.team_1= t.team_ID or m.team_2=t.team_ID               # as the  team may be in team1 or team 2 so no.of match played by a team maybe as team1 or team2
group by Team_Name 
order by no_of_match desc;

select
Player_Name
,count(*) as noomatch
from ipl.ball_by_ball b inner join ipl.batsman_scored bs on
b.match_ID =bs.match_ID and b.over_ID=bs.over_ID and b.ball_ID =bs.ball_ID and b.innings_no=bs.innings_no
inner join player p on b.striker=p.player_ID
group by Player_Name
order by noomatch desc;

select
Player_Name
,sum(Runs_Scored) as totlerun
from ipl.ball_by_ball b inner join ipl.batsman_scored bs on
b.match_ID =bs.match_ID and b.over_ID=bs.over_ID and b.ball_ID =bs.ball_ID and b.innings_no=bs.innings_no
inner join player p on b.striker=p.player_ID
group by Player_Name
order by totlerun desc;

select 
Player_Name
,sum(Runs_Scored) as totlerun
from ipl.ball_by_ball b inner join ipl.batsman_scored bs on
concat(b.match_ID,b.over_ID,b.ball_ID,b.innings_no)=concat(bs.match_ID,bs.over_ID,bs.ball_ID,bs.innings_no)
inner join player p on b.striker=p.player_ID									
where Runs_Scored=6
group by Player_Name
order by totlerun desc;

# display the top 5 heighest scoring matches in ipl ,also display the team name
select
Match_Date
,t.Team_Name
,t2.Team_Name
,sum(Runs_Scored) as totlerun
from ipl.match m inner join ipl.batsman_scored bs on m.match_ID=bs.match_ID
inner join team t on m.Team_1= t.Team_Id
inner join team t2 on m.Team_2= t2.Team_Id
group by Match_Date,t.Team_Name,t2.Team_Name
order by totlerun desc;

# display the top 10 PAlYERS LIST WITH MOST NO. OF 3 RUNS SCORED
select 
Player_Name
,count(Runs_Scored) as totlerun
from ipl.ball_by_ball b inner join ipl.batsman_scored bs on
concat(b.match_ID,b.over_ID,b.ball_ID,b.innings_no)=concat(bs.match_ID,bs.over_ID,bs.ball_ID,bs.innings_no)
inner join player p on b.striker=p.player_ID
where Runs_Scored=3
group by Player_Name
order by totlerun desc;

# display the bowler list with most no. of maiders (0 runs given in an over)
select
Player_Name
,b.Match_Id
,b.Innings_No
,b.Over_Id
,sum(Runs_Scored) as totlerun
from ball_by_ball b inner join batsman_scored bs on 
concat(b.match_ID,b.over_ID,b.ball_ID,b.innings_no)=concat(bs.match_ID,bs.over_ID,bs.ball_ID,bs.innings_no)
inner join player p on b.bowler=p.player_ID
group by Player_Name, b.Match_Id,b.Innings_No,b.Over_Id
having totlerun=0 ;                 # we can not use 'where' class as we can use colume allias in 'where' class and can not filter the aggrigate column in 'where' class, filtering aggregaton column can done by 'having ' class

# display the players 

select
Player_Name
,Match_Id
,Role_Desc
from ipl.player_match pm inner join ipl.rolee r on pm.role_ID =r.role_ID
inner join player p on pm.player_ID=p.player_ID;
select
Player_Name
,count(*) as nofmatchascaptain
from ipl.player_match pm inner join ipl.rolee r on pm.role_ID =r.role_ID
inner join player p on pm.player_ID=p.player_ID
where Role_Desc like 'captain%'
group by Player_Name;

select
Match_Id
,Team_Name
,Player_Name
,Role_Desc
from ipl.player_match pm inner join ipl.rolee r on pm.role_ID =r.role_ID
inner join team t  on pm.Team_Id=t.Team_Id
inner join player p on p.Player_Id=pm.Player_Id
where Role_Desc like 'captain%';

select
Team_Name
,count(distinct Player_Name) as no_of_captain
from ipl.player_match pm inner join ipl.rolee r on pm.role_ID =r.role_ID
inner join team t  on pm.Team_Id=t.Team_Id
inner join player p on p.Player_Id=pm.Player_Id
where Role_Desc like 'captain%'
group by Team_Name
order by no_of_captain desc;

# also to display the name of all captain 
select
Team_Name
,count(distinct Player_Name) as no_of_captain
,group_concat(distinct Player_Name)as captainname
from ipl.player_match pm inner join ipl.rolee r on pm.role_ID =r.role_ID
inner join team t  on pm.Team_Id=t.Team_Id
inner join player p on p.Player_Id=pm.Player_Id
where Role_Desc like 'captain%'
group by Team_Name
order by no_of_captain desc;
