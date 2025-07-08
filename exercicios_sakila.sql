use sakila;

-- Lista de todos os filmes
select * from film;

-- Lista do titulo de todos os filmes
select title from film;

-- Lista de filmes com duração menor do que 60 minutos
select * from film
where length < 60;

-- Lista dos clientes inativos
select * from customer
where active = 0;

-- Lista dos clientes ativos e respectivos endereços
select * from customer
join address on customer.address_id = address.address_id
where customer.active = 1;

-- Lista dos nomes dos clientes residentes no Brasil.
select customer.first_name, customer.last_name from customer
join address on customer.address_id = address.address_id
join city on city.city_id = address.city_id
join country on country.country_id = city.country_id
where country = 'Brazil';

-- Relação de filmes e atores que atuaram no mesmo
select film.title, actor.first_name, actor.last_name 
from film 
join film_actor on film.film_id = film_actor.film_id
join actor on actor.actor_id = film_actor.actor_id;

-- Relação de filmes e atores que atuaram no mesmo ordenada por filme
select film.title, actor.first_name, actor.last_name 
from film 
join film_actor on film.film_id = film_actor.film_id
join actor on actor.actor_id = film_actor.actor_id
order by film.title;

-- Relação de filmes e atores que atuaram no mesmo ordenada por ator
select film.title, actor.first_name, actor.last_name 
from film 
join film_actor on film.film_id = film_actor.film_id
join actor on actor.actor_id = film_actor.actor_id
order by actor.first_name, actor.last_name;

-- Relação de filmes com participação de um ator específico.
select * from film
join film_actor on film.film_id = film_actor.film_id
join actor on actor.actor_id = film_actor.actor_id
where actor.actor_id = 1;

-- Quantidade total de filmes
select count(*) from film;

-- Duração média dos filmes
select avg(length) as media
from film;

-- Lista de filmes por categoria.
select * from film
join film_category on film_category.film_id = film.film_id
join category on film_category.category_id = category.category_id
order by category.category_id;

-- Quantidade de filmes por categoria.
select category.name, count(*) from film
join film_category on film_category.film_id = film.film_id
join category on film_category.category_id = category.category_id
group by category.category_id;

-- Duração média dos filmes por categoria
select category.name, avg(length) from film
join film_category on film_category.film_id = film.film_id
join category on film_category.category_id = category.category_id
group by category.category_id;

-- Quantidade de filmes por categoria das categorias com menos de 57 filmes
SELECT category.name, COUNT(*) FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.category_id
HAVING COUNT(*) < 57;

-- Duração média dos filmes por categoria das categorias com menos de 57 filmes
SELECT category.name, avg(length) FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.category_id
HAVING COUNT(*) < 57;

-- Quantidade de filmes alugados por cliente
select customer.first_name, customer.last_name, count(rental.customer_id) 
from customer join rental on rental.customer_id = customer.customer_id
group by customer.customer_id;

-- Quantidade de filmes alugados por cliente em ordem decrescente de quantidade de filmes alugados
select customer.first_name, customer.last_name, count(rental.customer_id) as contagem
from customer join rental on rental.customer_id = customer.customer_id
group by customer.customer_id
order by contagem desc;

-- Relação de nomes dos clientes que possuem um filme alugado no momento
select distinct customer.first_name, customer.last_name
from customer join rental on rental.customer_id = customer.customer_id
where rental.return_date is null;

-- Relação de nomes dos clientes que não possuem um filme alugado no momento
SELECT distinct customer.first_name, customer.last_name
FROM customer
WHERE NOT EXISTS (
    SELECT 1
    FROM rental
    WHERE rental.customer_id = customer.customer_id
      AND rental.return_date IS NULL
);

