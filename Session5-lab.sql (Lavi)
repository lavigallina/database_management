SELECT SUM(ci.`Population`) as total_population 
FROM city as ci INNER JOIN country as co ON ci.`ID` = co.`Capital`
WHERE co.`Continent` = "Europe";

SELECT co.Name, COUNT(*) as NumberOfficialLanguages
FROM country as co INNER JOIN countrylanguage as cl ON co.`Code` = cl.`CountryCode`
INNER JOIN languages as la ON cl.languageid = la.languageid
WHERE cl.`IsOfficial` = True
GROUP BY co.`Name`
HAVING COUNT(*) >= 3
ORDER BY COUNT(*) DESC;

SELECT co1.`Continent`, COUNT(*) as NumberOfMonarchies
FROM country as co1
WHERE co1.`GovernmentForm` LIKE "%Monarchy%"
GROUP BY co1.`Continent`
ORDER BY COUNT(*) DESC;

SELECT country.`HeadOfState`, COUNT(*) as Countries_as_head
FROM country
GROUP BY country.`HeadOfState`
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

SELECT country.Region
FROM country
GROUP BY country.`Region`
HAVING AVG(country.`LifeExpectancy`) < 60;

SELECT co.`Name`, SUM(country.`Population`)
FROM country as co INNER JOIN countrylanguage as cl ON co.`Code` = cl.`CountryCode`
INNER JOIN languages as la ON cl.languageid = la.languageid
WHERE la.language = "Japanese"
GROUP BY co.`Name`; --this exercise is not the level of the exam, we can try to solve it but it is no required to know how to
