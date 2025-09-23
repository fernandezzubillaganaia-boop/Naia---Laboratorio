-- 2. Obtenga todos los datos de las tablas actor, film y customer.
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

-- 3. Obtener títulos de películas.
SELECT title 
FROM film;

-- 4. Obtén una lista única de idiomas de las películas bajo el alias language.
SELECT DISTINCT name AS language
FROM language;

-- 5.1 ¿Averigua cuántas tiendas tiene la empresa?
SELECT COUNT(*) AS total_stores
FROM store;

-- 5.2 ¿Averigua cuántos empleados tiene la empresa?
SELECT COUNT(*) AS total_staff
FROM staff;

-- 5.3 Devolver una lista solo con los nombres de los empleados.
SELECT first_name, last_name
FROM staff;

-- 1. Seleccione todos los actores con el nombre Scarlett.
SELECT * 
FROM actor
WHERE first_name = 'SCARLETT';

-- 2. Seleccione todos los actores con el apellido Johansson.
SELECT * 
FROM actor
WHERE last_name = 'JOHANSSON';

-- 3. ¿Cuántas películas están disponibles para alquilar?
-- (películas en el inventario)
SELECT COUNT(DISTINCT film_id) AS peliculas_disponibles
FROM inventory;

-- 4. ¿Cuántas películas se han alquilado?
-- (películas que aparecen en rental)
SELECT COUNT(DISTINCT inventory_id) AS peliculas_alquiladas
FROM rental;

-- 5. ¿Cuál es el período de alquiler más corto y más largo?
SELECT MIN(rental_duration) AS min_rental_period,
       MAX(rental_duration) AS max_rental_period
FROM film;

-- 6. ¿Cuál es la duración más corta y más larga de una película? Nombra los valores max_duration y min_duration.
SELECT MIN(length) AS min_duration,
       MAX(length) AS max_duration
FROM film;

-- 7. ¿Cuál es la duración media de una película?
SELECT AVG(length) AS avg_duration
FROM film;

-- 8. ¿Cuál es la duración promedio de una película expresada en formato (horas, minutos)?
SELECT 
    FLOOR(AVG(length) / 60) AS horas,
    ROUND(AVG(length) % 60) AS minutos
FROM film;

-- 9. ¿Cuántas películas duran más de 3 horas?
SELECT COUNT(*) AS peliculas_mas_3h
FROM film
WHERE length > 180;

-- 10. Formatee el nombre y el correo electrónico. 
-- Ejemplo: Mary SMITH - mary.smith@sakilacustomer.org
SELECT CONCAT(first_name, ' ', last_name, ' - ', email) AS formatted_contact
FROM customer;

-- 11. ¿Cuál es la duración del título más largo de una película?
SELECT MAX(CHAR_LENGTH(title)) AS max_title_length
FROM film;
