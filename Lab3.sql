# Lab | SQL Queries 3
#How many distinct (different) actors' last names are there?
select * from sakila.actor; 
select distinct first_name from sakila.actor;
#In how many different languages where the films originally produced? (Use the column language_id from the film table)
select * from sakila.film; #Just 1?
select * from sakila.language;
#How many movies were released with "PG-13" rating?
select * from sakila.film
where rating = 'PG-13';
select count(*) from film
where  rating = 'PG-13';
#Get 10 the longest movies from 2006.
select * from sakila.film
where release_year = '2006'
order by length desc limit 10;  
# How many days has been the company operating (check DATEDIFF() function)?
select * from sakila.rental;
Select  datediff(max(rental_date), min(rental_date)) as DaysOperating 
from  sakila.rental; 
#Show rental info with additional columns month and weekday. Get 20.
select * from sakila.rental;
select *, date_format(convert(rental_date,date), '%m') as month , weekday(rental_date) as weekday from sakila.rental limit 20;
# where 0 = Monday, 1 = Tuesday, 2 = Wednesday, 3 = Thursday, 4 = Friday, 5 = Saturday, 6 = Sunday.

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, case when weekday(rental_date) in (5,6) then 'Weekend' else 'Weekday' end as day_type 
from sakila.rental;

#How many rentals were in the last month of activity?         
select * from sakila.payment;
select *, date_format(convert(payment_date,date), '%m') as month 
from sakila.payment; 
select count(rental_id)
from sakila.payment
WHERE date_format(convert(payment_date,date), '%m')>07;


 


