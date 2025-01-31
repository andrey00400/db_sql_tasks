-- Отримання списку фільмів та їх категорій
SELECT f.title, f.length, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

-- Фільми, орендовані певним клієнтом
SELECT f.title, r.rental_date
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE c.first_name = 'John' AND c.last_name = 'Doe';  -- Замінити на потрібного клієнта

-- Топ-5 найпопулярніших фільмів на основі кількості оренд
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- Додавання нового клієнта
INSERT INTO customer (first_name, last_name, address, city)
VALUES ('Alice', 'Cooper', '123 Main St', 'San Francisco');

-- Оновлення адреси клієнта
UPDATE customer
SET address = '456 Elm St'
WHERE first_name = 'Alice' AND last_name = 'Cooper';

-- Видалення клієнта
DELETE FROM customer
WHERE first_name = 'Alice' AND last_name = 'Cooper';
