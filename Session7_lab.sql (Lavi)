SELECT country.`Continent`, country.`Name` as CountryName, city.`Name` as Capital, city.`Population`,
    RANK () OVER(PARTITION BY country.`Continent` ORDER BY city.`Population` DESC) as CapitalRank
FROM country INNER JOIN city ON country.`Capital` = city.`ID`
ORDER BY country.`Continent`, city.`Population` DESC;

SELECT country.`Continent`, country.`Name`, country.`GNP`, 
    RANK () OVER(PARTITION BY country.`Name` ORDER BY country.`GNP` DESC)
FROM country
ORDER BY country.`Continent`, country.`GNP` DESC;

SELECT country.`Code`, languages.language, countrylanguage.`Percentage`, 
    RANK () OVER(PARTITION BY country.`Code` ORDER BY countrylanguage.`Percentage` DESC)
FROM country INNER JOIN countrylanguage ON country.`Code` = countrylanguage.`CountryCode`
INNER JOIN languages ON countrylanguage.languageid = languages.languageid
ORDER BY country.`Code`, countrylanguage.`Percentage` DESC;

SELECT country.Continent, languages.Language, SUM((country.Population * countrylanguage.Percentage) / 100) AS Total_speakers,
    RANK() OVER (PARTITION BY country.Continent ORDER BY SUM((country.Population * countrylanguage.Percentage) / 100) DESC) AS Ranking
FROM country
INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
INNER JOIN languages ON countrylanguage.LanguageID = languages.LanguageID
GROUP BY country.Continent, languages.Language
ORDER BY country.Continent, Total_speakers DESC;

SELECT *
FROM 
(SELECT country.Continent, languages.Language, SUM((country.Population * countrylanguage.Percentage) / 100) AS Total_speakers,
    RANK() OVER (PARTITION BY country.Continent ORDER BY SUM((country.Population * countrylanguage.Percentage) / 100) DESC) AS Ranking
FROM country
INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
INNER JOIN languages ON countrylanguage.LanguageID = languages.LanguageID
GROUP BY country.Continent, languages.Language
ORDER BY country.Continent, Total_speakers DESC) as t
WHERE Ranking <= 3;

