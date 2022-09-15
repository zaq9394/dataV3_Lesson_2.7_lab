use sakila;
-- 1.How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.category_id,count(distinct f.film_id) as 'number of film' from sakila.category c
INNER JOIN sakila.film_category f
ON c.category_id=f.category_id
GROUP BY c.category_id;

-- 2.Display the total amount rung up by each staff member in August of 2005.
SELECT staff_id,count(amount) from sakila.payment
WHERE payment_date between '2005-08-01' and '2005-08-31'
group by staff_id;

SELECT * from film_actor; 
-- 3.Which actor has appeared in the most films?
SELECT concat(a.first_name,' ',a.last_name) as 'Name', count(f.film_id)   from sakila.actor a
INNER JOIN sakila.film_actor f 
ON a.actor_id=f.actor_id
GROUP BY a.actor_id
ORDER BY count(distinct f.film_id) DESC
LIMIT 1;

-- 4.Most active customer (the customer that has rented the most number of films)
SELECt customer_id,count(rental_id)from rental
group by customer_id
order by count(rental_id) desc;
SELECT customer_id,count(rental_id)from payment
group by customer_id
order by count(rental_id) desc;

-- 5.Display the first and last names, as well as the address, of each staff member.
SELECT staff_id,first_name,last_name,address_id from staff
where first_name is not NULL;

-- 6.List each film and the number of actors who are listed for that film.
SELECT f.film_id,f.title, count(actor_id) AS 'Number of actors' from sakila.film_actor a
INNER JOIN sakila.film f
ON a.film_id=f.film_id
group by f.film_id;

-- 7.Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT p.customer_id,c.last_name,count(p.amount) AS 'Total paid' from sakila.payment p
INNER JOIN sakila.customer c 
ON p.customer_id=c.customer_id
group by p.customer_id
order by c.last_name asc;

-- 8.List number of films per category. 
SELECT * from film_category;
SELECT c.category_id,c.name, count(f.film_id) AS 'Number of films' from sakila.category c
JOIN sakila.film_category f
ON f.category_id=c.category_id
group by c.category_id;