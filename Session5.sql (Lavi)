SELECT SUM(booking.amount) as Total 
FROM booking 
WHERE booking.country = "Spain"; --This sums the amounts of those bookings in which the country is Spain. Total amount for Spanish passengers
--it returns a single value which corresponds to the sum of all amounts for those bookings made in Spain; returned under the alias total

--If I want to calculate in a single SQL query the total amount for every country: Sum for country Spain, sum for France, sum for Netherlands...
--We need to use the function GROUPBY and then the apply the aggregate function, which will work with these groups

SELECT booking.country, SUM(booking.amount) as Total 
FROM booking 
GROUP BY booking.country; --I want to list the name of the country and the corresponding total. 
--If you have in the groupby one column, this column must appear in the select (and vice versa: in the GROUP BY you must have all the columns that are also in the select)
--I could also round it, if I wanted to, by doing ROUND(SUM(booking.amount), 2)

SELECT booking.country, SUM(booking.amount) as Total 
FROM booking 
WHERE YEAR(booking.bookingdate) = 2017
GROUP BY booking.country; --in this case I want to return the country and the corresponding sum of the amounts of the bookings made in 2017
--all grouped by country. Since the condition of year = 2017 is applied per row and not to the group as a whole, I apply it in the WHERE
--and not in the HAVING. 
--the clause select is executed LAST. The first clause executed is the FROM (which table), then it looks at the ROWS filter (WHERE), only take into acocunt the rows in 2017, 
--third one is groupby (once rows are filtered, apply groupby)
--if in the select you have a column that you have not included in the groupby, then it will give an error (and vice versa)
--if you want to show an additional column in the select, you must include it in the gorupby
--if we were to EXCLUDE the grupby from this sentence, it wouldn't work, because we are showing many rows (many countries) but the sum is only a single value
--Without GROUP BY, SQL does not know how to combine a single total value (sum) with multiple country values. 
--GROUP BY defines how the rows should be grouped so that each country gets its own total.
  
SELECT booking.country, year(booking.bookingdate), SUM(booking.amount) as Total 
FROM booking 
GROUP BY booking.country, year(booking.bookingdate)
ORDER BY booking.country; --in this case we have the sum of amounts per country per year 
--we want to know the total amount per country and every year
--we can use a double gorup by (including all the columns that you have in the select)

SELECT booking.country, year(booking.bookingdate), round(SUM(booking.amount), 2) as Total 
FROM booking 
GROUP BY booking.country, year(booking.bookingdate)
ORDER BY booking.country; --this does the same thing but rounded to 2 decimal places

SELECT booking.country, year(booking.bookingdate), round(SUM(booking.amount), 2) as Total 
FROM booking 
GROUP BY booking.country, year(booking.bookingdate) 
HAVING Total > 35000
ORDER BY booking.country; --This query calculates the total booking amount per country per year.
--SUM(booking.amount) aggregates the total amount for each group.
--YEAR(booking.bookingdate) extracts the year to group results annually.
--GROUP BY creates one result row per country per year.
--HAVING filters the grouped results, keeping only those groups where the total exceeds 35,000 (this is a restriction of the groupby).
-- HAVING is used instead of WHERE because the condition applies to aggregated data.
-- WHERE filters rows before grouping; HAVING filters after grouping.
-- The alias assigned to columns cannot be used in WHERE, but it can be used in HAVING 
-- ORDER BY is evaluated last and sorts the final result by country.
-- If the HAVING clause is removed, the query will return all country-year totals, including those below 35,000.

SELECT booking.country, YEAR(booking.bookingdate), ROUND(SUM(booking.amount), 2) as Total
FROM booking; --this gives an error because the sum is a single value but you have many different countries
--SQL doesn't know how to execute it unless you tell it to group by countries

--It is not allowed to use aggregate functions in the WHERE clause.
-- The WHERE clause filters individual rows BEFORE grouping takes place.
-- Aggregate functions (such as SUM, COUNT, AVG, etc.) operate on groups of rows,
-- and grouping happens AFTER the WHERE clause is evaluated.
-- Therefore, you cannot compare a single row to a group total in the WHERE clause.
-- To filter based on aggregate function results, you must use the HAVING clause,
-- which is evaluated AFTER the GROUP BY step. 

--how many cities of more than 1M people there are in each continent. Show only the continent names with more than 25 cities
SELECT co.continent, COUNT(*) as Total_cities
FROM country as co INNER JOIN city as ci ON co.`Code` = ci.`CountryCode`
WHERE ci.`Population` > 1000000
GROUP BY co.`Continent`
HAVING Total_cities > 25
ORDER BY Total_cities DESC; --WHERE filters individual rows BEFORE grouping.
-- Here, we keep only cities with a population greater than 1,000,000.
-- After filtering, GROUP BY creates one group per continent.
-- COUNT(*) counts the number of rows (cities) in each group.
-- Since each row represents one city, COUNT(*) gives the number of cities per continent.
-- We use COUNT(*) instead of COUNT(column_name) because COUNT(column_name)
-- ignores NULL values, while COUNT(*) counts all rows.
-- HAVING filters the grouped results AFTER aggregation.
-- Here, it keeps only continents that have more than 25 cities with over 1M inhabitants.
-- ORDER BY sorts the final result by the number of cities in descending order.
-- Instead of ORDER BY Total_cities, we could also write ORDER BY COUNT(*).

SELECT co1.Name, co2.Name, COUNT (*) as TotalNum_regions_shared 
FROM country as co1 INNER JOIN country as co2 
WHERE co1.`Region` = co2.`Region` AND co1.`Code` < co2.`Code`
GROUP BY co1.Name, co2.Name 
HAVING COUNT(*) > 1
ORDER BY TotalNum_regions_shared DESC;
-- This query uses a SELF JOIN on the country table. A self join means joining a table with itself using different aliases (co1 and co2).
-- The condition co1.Region = co2.Region matches countries that belong to the same region.
-- The condition co1.Code < co2.Code prevents duplicate pairs. Without it, we would get both (Spain, France) and (France, Spain).
-- This condition keeps only one of the two possible permutations.
-- However, in the standard world database, each country belongs to only ONE region.
-- Therefore, no pair shares more than one region.
-- Because of that, the condition HAVING COUNT(*) > 1 returns no rows.
-- If you remove the HAVING clause, you will see that each valid pair has COUNT(*) = 1.


--List the countries that have at least 10 cities in total and at least 3 cities with more than 1M inhabitants 
--return the country name and the number of cities 
SELECT co.Name, COUNT(*) tot_num_cities
FROM country as co INNER JOIN city as ci ON co.`Code` = ci.`CountryCode`
GROUP BY co.Name
HAVING COUNT(*) >= 10 AND SUM(CASE WHEN ci.`Population` > 1000000 THEN  1 ELSE  0 END) >= 3
ORDER BY SUM(CASE WHEN ci.`Population` > 1000000 THEN  1 ELSE  0 END) DESC;
-- The INNER JOIN connects each country with its cities. Each row in the result represents one city belonging to a country.
-- GROUP BY co.Name creates one group per country.
-- COUNT(*) counts the total number of cities per country.
-- The first HAVING condition ensures the country has at least 10 cities.
-- The second condition uses SUM(CASE ...) to count only cities with more than 1 million inhabitants.
-- For each city:
--    • If Population > 1,000,000 → count 1
--    • Otherwise → count 0
-- The SUM adds these values per country, giving the number of large cities in each country. It filters the groups not only for those that have more than 10 cities,
--but also at least 3 cities with more than 1M inhabitants 
-- HAVING is used because both conditions depend on aggregated values.
-- ORDER BY sorts the results in descending order based on the number of cities with more than 1M inhabitants.
