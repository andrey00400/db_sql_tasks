-- 1. Загальна кількість фільмів у кожній категорії
SELECT c.name AS category, COUNT(f.film_id) AS film_count
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
LEFT JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

-- 2. Середня тривалість фільмів у кожній категорії
SELECT c.name AS category, AVG(f.length) AS average_length
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
LEFT JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

-- 3. Мінімальна та максимальна тривалість фільмів
SELECT MIN(f.length) AS min_length, MAX(f.length) AS max_length
FROM film f;

-- 4. Загальна кількість клієнтів
SELECT COUNT(*) AS total_customers
FROM customer;

-- 5. Сума платежів по кожному клієнту
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name;

-- 6. П'ять клієнтів з найбільшою сумою платежів
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_payments DESC
LIMIT 5;

-- 7. Загальна кількість орендованих фільмів кожним клієнтом
SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name;

-- 8. Середній вік фільмів у базі даних
SELECT AVG(YEAR(CURDATE()) - f.release_year) AS average_age
FROM film f;

-- 9. Кількість фільмів, орендованих за певний період
SELECT COUNT(r.rental_id) AS rented_count
FROM rental r
WHERE r.rental_date BETWEEN '2023-01-01' AND '2023-12-31';  -- замінити на потрібні дати

-- 10. Сума платежів по кожному місяцю
SELECT MONTH(p.payment_date) AS month, SUM(p.amount) AS total_payments
FROM payment p
GROUP BY MONTH(p.payment_date);

-- 11. Максимальна сума платежу, здійснена клієнтом
SELECT c.first_name, c.last_name, MAX(p.amount) AS max_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name;

-- 12. Середня сума платежів для кожного клієнта
SELECT c.first_name, c.last_name, AVG(p.amount) AS average_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name;

-- 13. Кількість фільмів у кожному рейтингу
SELECT f.rating, COUNT(f.film_id) AS film_count
FROM film f
GROUP BY f.rating;

-- 14. Середня сума платежів по кожному магазину
SELECT s.store_id, AVG(p.amount) AS average_payment
FROM store s
JOIN inventory i ON s.store_id = i.store_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY s.store_id;
