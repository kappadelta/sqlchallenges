use world;
SELECT * from city;
SELECT * from country;
SELECT * from countrylanguage;

#Question 1: Using COUNT, get the number of cities in the USA.

SELECT countrycode, COUNT(DISTINCT `name`) AS numberOfUSACities FROM city 
WHERE countrycode = 'USA';

#Question 2: Find out the population and life expectancy for people in Argentina.

SELECT Name, Population, LifeExpectancy From country
WHERE Code like 'ARG';

# Question 3: Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?

SELECT NAME, Population, LifeExpectancy FROM country
WHERE LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy DESC LIMIT 1;

# Question 4: Using JOIN ... ON, find the capital city of Spain.

Select * FROM city
JOIN country on city.CountryCode = Country.Code
Where ID = "653";

#Question 5: Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.

SELECT Language from countrylanguage
JOIN country on countrylanguage.countrycode = country.code
WHERE Region = 'Southeast Asia';

# Question 6: Using a single query, list 25 cities around the world that start with the letter F.

SELECT Name from country
WHERE Name like 'F%';


# Question 7: Using COUNT and JOIN ... ON, get the number of cities in China.

Select count(*) FROM city
JOIN country on city.CountryCode = Country.Code
WHERE country.Name='China';

SELECT countrycode, COUNT(DISTINCT `name`) AS numberOfUSACities FROM city WHERE countrycode = 'CHN';

#Question 8: Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.

SELECT * from country
WHERE Population IS NOT NULL and Population!='0' ORDER BY Population ASC LIMIT 1;

#Quesiton 9: Using aggregate functions, return the number of countries the database contains.

SELECT COUNT(*) from country;

#Question 10: What are the top ten largest countries by area?

SELECT * from country
where SurfaceArea ORDER BY SurfaceArea DESC Limit 10;

#Question 11: List the five largest cities by population in Japan.
 
SELECT * FROM city
where CountryCode='JPN' ORDER BY Population LIMIT 5;

#Question 12 : List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!

SELECT Name, Code, HeadOfState FROM country
where HEADOfState ='Elisabeth II';

#Question 13: List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.

SELECT Name, (population/surfacearea) AS Ratio 
FROM country where (population/surfacearea) != 0 ORDER BY Ratio ASC LIMIT 10;

# Question 14: List every unique world language.

SELECT DISTINCT(Language) from countrylanguage;

#Question 15: List the names and GNP of the world's top 10 richest countries.

SELECT NAME, GNP from country
ORDER BY GNP DESC LIMIT 10;


#Question 16: List the names of, and number of languages spoken by, the top ten most multilingual countries.

SELECT country.Name, COUNT(countrylanguage.language)
FROM country
JOIN countrylanguage ON country.code = countrylanguage.countrycode
GROUP BY country.name
ORDER BY COUNT(countrylanguage.language) desc
LIMIT 10 ;


#Question 17: List every country where over 50% of its population can speak German.

SELECT * from countrylanguage
JOIN country on countrylanguage.countrycode = country.code
WHERE Language ='German' AND Percentage > 50;


#Question 18: Which country has the worst life expectancy? Discard zero or null values.
SELECT * FROM country 
WHERE LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy ASC LIMIT 1;

#Question 19: List the top three most common government forms.

SELECT GovernmentForm, COUNT(governmentform)
FROM country
GROUP BY governmentform
ORDER BY COUNT(name) DESC
LIMIT 3;


#Quesiton 20: How many countries have gained independence since records began?

SELECT COUNT(IndepYear) from country
WHERE IndepYear IS NOT NULL;

