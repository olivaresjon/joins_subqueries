select * from customer;

select * from address a;

-- Question # 1
select customer.first_name, customer.last_name, district, customer.address_id 
from customer
full join address
on customer.address_id = address.address_id 
where district like 'Texas';
--Answer is Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

--Question #2
select payment.amount, first_name, last_name
from payment
full join customer
on payment.customer_id = customer.customer_id
where amount > 6.99;

--Question 3
select first_name, last_name
from customer
where customer_id  in(
	select customer_id
	from payment
	where amount > 175
	
);

--Question 4
select customer.first_name, customer.last_name, country
from customer
full join address
on customer.address_id = address.address_id 
full join city 
on city.city_id = address.address_id 
full join country
on country.country_id = city.city_id 
where country like 'Nepal';
--Answer: Joan Cooper


--Question 5
select staff.first_name, staff.last_name, count(payment.staff_id)
from staff
full join payment
on staff.staff_id = payment.staff_id
group by staff.staff_id
;
--Jon Stephens has the most with 7,304 trasactions

--Question 6
select rating, count(rating)
from film
group by rating
order by count(rating) desc;


--Question 7
select first_name, last_name
from customer
where customer_id  in(
	select customer_id
	from payment
	where amount > 6.99
	group by customer_id having count(distinct amount) = 1
	
);

--Question 8
select count(rental.rental_id) - count(payment.payment_id) as my_
from rental
full join payment
on rental.rental_id = payment.rental_id;
-- Total amount of rentals given minus the totals payments is the total of free rentals. 1,452

