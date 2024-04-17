#--Q1

create schema Travego;
use Travego;

create table passenger(passenger_id int,
passenger_name varchar(20),
Category varchar(20),
gender varchar(20),
boarding_city varchar(20),
destination_city varchar(20),
distance int,
bus_type varchar(20));

create table price(id int,
bus_varchar varchar(20),
distance int,
price int);


insert into passenger(passenger_id ,passenger_name ,Category ,gender,boarding_city ,destination_city ,distance,bus_type )
 values
(1,	'Sejal','AC','F','Bengaluru','Chennai',	350,'Sleeper'),
(2,'Anmol',	'Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper'),
(6,	'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,	'Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');
select * from passenger;

insert into price values
(1,'Sleeper',350,770),
(2,'Sleeper',500,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);
select * from price;

#--Q2
 #a.How many females and how many male passengers traveled a minimum distance of 600 KMs?
select * from passenger
where distance >=600  and gender = 'm';

#b.	Find the minimum ticket price of a Sleeper Bus. 
select * from passenger
where bus_type= 'sleeper' ;

#--c.	Select passenger names whose names start with character 'S' 
select * from passenger
where passenger_name like's%';
#d.	Calculate price charged for each passenger displaying Passenger name, Boarding City, 
#Destination City, Bus_Type, Price in the output
select passenger_name,boarding_city,destination_city,p.bus_type,price
from passenger p 
left join price p1 on p.passenger_id = p1.id;

#--e.	What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  
select passenger_name,price
from passenger p join price p1 on p.passenger_id = p1.id
where p.distance = 1000 and p.bus_type =  'sitting';

#--f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select price ,count(p.bus_type)
from passenger p join price p1 on p.passenger_id =p1.id
where boarding_city ='bengluru' and destination_city = 'panaji'
group by 1;

#--g.	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. 
select distinct distance
from passenger
order by 1 desc;
#--h.	Display the passenger name and percentage of distance traveled by that passenger from the total distance traveled by all passengers without using user variables .
select passenger_name,distance,distance / (select sum(distance) from passenger)* 100 pct_travelled
from passenger;


