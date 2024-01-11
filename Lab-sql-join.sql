-- LAB JOIN SQL
-- List the number of films per category
select c.name AS category_name, COUNT(f.film_id) as film_count
from film f
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
group by c.name;

-- Display the first and the last names, as well as the address, of each staff member.
select staff.first_name, staff.last_name, address.address
from staff
join address on staff.address_id = address.address_id;

-- Display the total amount rung up by each staff member in August 2005.
select staff.staff_id, staff.first_name, staff.last_name, SUM(payment.amount) AS total_amount
from payment
join staff on payment.staff_id = staff.staff_id
where DATE_FORMAT(payment.payment_date, '%Y-%m') = '2005-08'
group by staff.staff_id, staff.first_name, staff.last_name;

-- List all films and the number of actors who are listed for each film.
select film.film_id, film.title, COUNT(film_actor.actor_id) as actor_count
from film
join film_actor on film.film_id = film_actor.film_id
group by film.film_id, film.title;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select c.customer_id, c.last_name, c.first_name, SUM(p.amount) as total_amount_paid
from customer c
join payment p on c.customer_id = p.customer_id
group by c.customer_id, c.last_name, c.first_name
order by c.last_name asc;