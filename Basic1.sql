SELECT booking.firstname, booking.country, booking.amount 
FROM booking; --minimum clauses in a SQL 

SELECT *  -- * means show me all columns
FROM booking; 

SELECT DISTINCT booking.country 
FROM booking; --filters out repetitions, applies to individual column. Only shows each country once

SELECT DISTINCT booking.country, booking.amount 
FROM booking; --filters out repetitions, doesn't show items twice (applies to combination of columns) (shows UNIQUE combos of columns)

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Germany"; --This applies a filter to rows (= or != or > or < or <>); type exactly the name of the column as it is originally 

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Germany" AND booking.amount > 500; --we can use AND/OR. This outputs the bookings in Germany that have an amount of more than 500

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Germany" OR booking.country = "Spain" AND booking.amount > 500; --the booking.amount > 500 will only be applied to Spain passengers. In this case it will only output Spanish passengers who paid more than 500 and ALL German passengers regardless of amount. The AND condition only applies to Spanish passengers 

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE (booking.country = "Germany" OR booking.country = "Spain") AND booking.amount > 500; --This will apply the AND condition to both Spanish and German passengers. Putting the parenthesis enables us to make the AND condition applied to both countries. The output will show all Spanish AND German passengers who have spent more than 500

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country IN ("Spain", "Germany") AND booking.amount > 500 
ORDER BY booking.country, booking.amount; --In the line above you specify the columns (IN or NOT IN) in which your country has to be and the amount; in other words, it will output the firstname, country and amount for all those bookings that are made either in Spain or Germany and with an amount above 500. Order by is always ascending (both A-Z and 1-infinite) by default. It will first show all Germany bookings (alphabetical order), starting from cheapest to most expensive.

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country IN ("Spain", "Germany") AND booking.amount > 500 
ORDER BY booking.country, booking.amount DESC; -- In this case it is ascending with the country (alphabetical order, Germany is shown first) and descending with the amount(from most to least expensive)

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Spain" 
ORDER BY booking.amount DESC
LIMIT 5; --In this case the output will show the name, country and amount of all those bookings made in Spain. They will be ordered from most to least expensive and by using LIMIT we limit the result to get the 5 most expensive tickets, usually we use limit but we order first. So, we will only see the 5 first ones

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Spain" 
ORDER BY booking.amount ASC; --In this case we are doing the same thing as above: output will show the name, country and amount of all those bookings made in Spain. They will be ordered in ASCENDING ORDER, which means from least to most expensive. (default)

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Spain" 
ORDER BY booking.amount ASC
LIMIT 2,4; --We are doing the same thing as above BUT we are not going to see all of the bookings in the output. We will see those starting from offset 2 and take 4 rows . In other words, we are starting in the third position (because 2 is the offset) and I will take 4 rows. The first value is from which position we will start taking values (starting at index 0) and the second number is how many rows we will be showing (including the offset's row)

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.amount BETWEEN 500 AND 1000 
ORDER BY booking.amount; --In this case we are showing name, country and amount of those bookings where the amount is between 500 and 1000. This is to give a range of values (it works with strings and dates). And then we will order the output by these amounts, IN ASCENDING order (cheapest to most expensive)

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Spain" AND booking.bookingdate BETWEEN "2017-01-01" AND "2017-06-30"
ORDER BY booking.amount; --In this case we are showing name, country and amount of those bookings that were done in Spain and between a specified date range.This shows the rows where the country is Spain and the date is in the specified range; all ordered ASCENDING by amount

SELECT booking.firstname, booking.email
FROM booking
WHERE booking.email LIKE "%@yahoo.com"; --In this case we are showing name and email of those bookings whose email ends with @yahoo.com. We have to use the LIKE clause because we are looking for a part of the email. % means anything before "@yahoo.com", i.e. we are looking for any email that finishes with @yahoo.com

SELECT booking.firstname, booking.email, booking.amount
FROM booking
WHERE booking.amount IS NULL; --in this case we are showing name, email and amount of all the bookings where the amount is null. Theoretically, we don't want any null values (except FK which can be null). Output is 0 rows which means no booking has a null amount

SELECT booking.firstname, booking.email, booking.amount
FROM booking
WHERE booking.amount IS NOT NULL; --this outputs the same thing as above but for all the bookings where the amount IS NOT null. Given that no booking had a null amount, in this output we will have all 1000 rows, all bookings have an amount NOT NULL  

SELECT  booking.bookingid
FROM booking
WHERE booking.airline = "EasyJet"; --this shows those bookings where the airline is EasyJet

SELECT booking.bookingid
FROM booking
WHERE booking.airline IN ("Iberia", "EasyJet"); --this shows those bookings where the airline is EasyJet OR Iberia

SELECT booking.bookingid
FROM booking
WHERE booking.airline = "EasyJet" AND booking.country = "Germany"; --this shows those bookings where the airline is EasyJet and the country is Germany 

SELECT booking.bookingid
FROM booking
WHERE booking.airline = "EasyJet" AND year(booking.bookingdate) = 2015; --This shows those bookings where the airline is EasyJet and the year of booking is 2015

SELECT *
FROM booking
WHERE booking.airline = "Iberia"
ORDER BY booking.amount DESC; --this shows all columns of the table and all rows where the airline is Iberia and the rows will be ordered by their amount in descending order (from most to least expensive)

SELECT booking.bookingdate
FROM booking
WHERE booking.airline IN ("Iberia", "Vueling", "EasyJet"); --this shows those bookings where the airline is either Iberia, Vueling or Easyjet

SELECT booking.bookingid
FROM booking
WHERE year(booking.bookingdate) = 2015 AND month(booking.bookingdate) BETWEEN 01 AND 12 AND day(booking.bookingdate) BETWEEN 1 AND 31; --this shows those bookings that were made between 1/01/2015 and 31/12/2015

SELECT booking.bookingid
FROM booking
WHERE booking.email LIKE "%.com"; --This shows those bookings where the email ends in .com

SELECT booking.bookingid 
FROM booking
WHERE booking.bookingdate IS NULL; --this shows those bookings where the booking date is null. It shows no rows which means that there's no booking with a NULL bookingdate







