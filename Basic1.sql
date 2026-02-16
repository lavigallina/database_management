SELECT booking.firstname, booking.country, booking.amount
FROM booking; --minimum clauses in a SQL 

SELECT *  -- * means show me all columns
FROM booking; 

SELECT DISTINCT booking.country --filters out repetitions, applies to individual column
FROM booking;

SELECT DISTINCT booking.country, booking.amount --filters out repetitions, doesn't show items twice (applies to combination of columns)
FROM booking;

SELECT booking.firstname, booking.country, booking.amount
FROM booking;
WHERE booking.country = "Germany"; --This applies a filter to rows (= or != or > or <); type exactly the name of the column as it is originally 

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Germany" AND booking.amount > 500; --we can use AND/OR 

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Germany" OR booking.country = "Spain" AND booking.amount > 500; --the booking.amount > 500 will only be applied to Spain passengers 

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE (booking.country = "Germany" OR booking.country = "Spain") AND booking.amount > 500;

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country IN ("Spain", "Germany") AND booking.amount > 500 --specify the columns (IN or NOT IN)
ORDER BY booking.country, booking.amount; --by default it is always ascending (both A-Z and 1-infinite)

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country IN ("Spain", "Germany") AND booking.amount > 500 
ORDER BY booking.country, booking.amount DESC; --we can specify the columns (IN or NOT IN). In this case it is ascending with the country and descending with the amount 

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Spain" 
ORDER BY booking.amount DESC
LIMIT 5; --limit the result to get the 5 most expensive tickets, usually we use limit but we order first

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Spain" 
ORDER BY booking.amount ASC;

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Spain" 
ORDER BY booking.amount ASC
LIMIT 2,4; --starting in the third position (because 2 is the offset) and I will take 4 rows. The first value is from which position (starting at index 0) and the second number is how many rows 

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.amount BETWEEN 500 AND 1000 
ORDER BY booking.amount; --This is to give a range of values (it words with strings and dates)

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE booking.country = "Spain" AND booking.bookingdate BETWEEN "2017-01-01" AND "2017-06-30"
ORDER BY booking.amount; --This shows the rows where the country is Spain and the date is in the specified range; all ordered descendent by amount

SELECT booking.firstname, booking.email
FROM booking
WHERE booking.email LIKE "%@yahoo.com"; --we have to use LIKE because we are looking for a part of the email. % means anything before "@yahoo.com", we are looking for any email that finishes with @yahoo.com

SELECT booking.firstname, booking.email, booking.amount
FROM booking
WHERE booking.amount IS NULL; 
--We don't want any null 
--this is to check if there is any null amounts. We can have a null amount when we have 

SELECT booking.firstname, booking.email, booking.amount
FROM booking
WHERE booking.amount IS NOT NULL; 