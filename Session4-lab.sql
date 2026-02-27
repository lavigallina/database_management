SELECT city.`Name`, city.`Population`
FROM city INNER JOIN country ON city.`CountryCode` = country.`Code`
WHERE country.`Name` = "Denmark"
ORDER BY city.`Population` DESC;

SELECT city.`Name`, city.`Population`
FROM city INNER JOIN country ON city.`ID` = country.`Capital`
WHERE country.`Name` = "Australia";

SELECT city.`Name`, city.`Population`
FROM country INNER JOIN city ON country.`Code` = city.`CountryCode`
WHERE country.`Continent` = "Europe"
ORDER BY city.`Population` DESC;

SELECT country.`Name`, city.`Name`
FROM country INNER JOIN city ON country.`Capital` = city.`ID`
WHERE country.`Continent` = "Africa"
ORDER BY country.`Name`;

SELECT languages.language, country.`Name`
FROM country INNER JOIN countrylanguage on country.`Code` = countrylanguage.`CountryCode` 
INNER JOIN languages ON countrylanguage.languageid = languages.languageid
WHERE country.`Continent` = "Europe" AND countrylanguage.`IsOfficial` = "T"
ORDER BY country.`Name` ASC; 

SELECT ci.`Name`, ci.`Population`, co.`Name`
FROM city as ci INNER JOIN country as co ON ci.`CountryCode` = co.`Code`
WHERE ci.`Population` > 1000000
ORDER BY ci.`Name`;

SELECT co.Name, ci.Name
FROM city as ci INNER JOIN country as co ON ci.ID = co.Capital
WHERE co.Continent = "Europe";

SELECT la.language
FROM country as co INNER JOIN countrylanguage as cl ON co.Code = cl.CountryCode
INNER JOIN languages as la ON cl.languageid = la.languageid
WHERE co.Name = "Afghanistan";

SELECT co.Name
FROM country as co LEFT JOIN city as ci ON co.Code = ci.`CountryCode`
WHERE ci.Name IS NULL;