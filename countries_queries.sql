USE world;
/*
1. ¿Qué consulta harías para obtener todos los países que hablan esloveno? Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. 
Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente. (1)
*/

SELECT c.name, l.language, l.percentage FROM countries as c
JOIN languages as l ON c.code=l.country_code
WHERE l.language='Slovene'
ORDER BY l.percentage DESC;
/*
2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? Su consulta debe devolver el nombre del país y el número total de ciudades. 
Tu consulta debe organizar el resultado por el número de ciudades en orden descendente.
*/

SELECT c.name, count(cities.country_id) as ctdad_cities FROM countries as c
JOIN cities ON c.code=cities.country_code
GROUP BY c.name
ORDER BY ctdad_cities DESC;

/*
3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? 
Tu consulta debe organizar el resultado por población en orden descendente. (1)
*/

SELECT c.name as country, cities.name as city,cities.population FROM countries as c
JOIN cities ON c.code=cities.country_code
WHERE c.name = 'Mexico' AND cities.population >500000
ORDER BY cities.population DESC;

/*
4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? 
Tu consulta debe organizar el resultado por porcentaje en orden descendente. (1)
*/
SELECT c.name, l.language, l.percentage FROM countries as c
JOIN languages as l ON c.code=l.country_code
WHERE l.percentage>89
ORDER BY l.percentage DESC;
/*
5. ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000? (2)
*/
SELECT code, name, population,surface_area FROM countries
WHERE population>100000 AND surface_area<501;
/*
6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años? (1)
*/
SELECT name,government_form,life_expectancy,capital FROM countries
WHERE government_form='Constitutional Monarchy' AND life_expectancy>75 AND capital>200;

/*
7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000?
 La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población. (2)
*/

SELECT c.name, cities.name, district,cities.population FROM countries as c
JOIN cities ON c.code=cities.country_code
WHERE c.name='Argentina' AND cities.district='Buenos Aires' and cities.population>500000;
/*
8. ¿Qué consulta harías para resumir el número de países en cada región? 
La consulta debe mostrar el nombre de la región y el número de países. Además, 
la consulta debe organizar el resultado por el número de países en orden descendente. (2)
*/
SELECT region, count(code) as paises FROM countries
GROUP BY region
ORDER BY paises DESC;