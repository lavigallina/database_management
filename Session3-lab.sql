SELECT booking.bookingid
FROM booking
WHERE booking.bookingdate < DATE_SUB(NOW(), INTERVAL 4015 DAY);

SELECT booking.bookingid
FROM booking
WHERE DATEDIFF(booking.flightdate, DATE(booking.bookingdate)) <= 10;

SELECT booking.bookingid,
    CASE 
        WHEN booking.amount < 1000 THEN "Low"  
        WHEN booking.amount BETWEEN 1001 AND 1750 THEN "Medium"
        ELSE "High"
    END AS category_amount
FROM booking;

SELECT booking.email,
    CASE 
        WHEN booking.email LIKE "%.com" THEN "com"  
        ELSE "not com"
    END AS email_category
FROM booking;

SELECT booking.bookingdate,
    CASE 
        WHEN YEAR(booking.bookingdate) > 2016 THEN "Recent"
        ELSE "Old"
    END AS date_category
FROM booking;

SELECT booking.firstname, LEFT(booking.firstname, 3) AS first_3
FROM booking;

SELECT booking.postalcode, RIGHT(booking.postalcode, 4) AS last_4
FROM booking;

SELECT booking.email, SUBSTRING_INDEX(booking.email, "@", 1) AS emailName
FROM booking;

SELECT CONCAT(LEFT(booking.country, 2), RIGHT(booking.postalcode, 3)) AS combination_city_code
FROM booking
ORDER BY booking.country;



SELECT (
    SELECT avg(booking.amount) 
    FROM booking
    WHERE booking.origin = "Japan" AND booking.destination = "Mexico") AS Japan_Mexico,

    (SELECT avg(booking.amount)
    FROM booking
    WHERE booking.origin = "Japan" AND booking.destination = "Peru") AS Japan_Peru;

SELECT (
    SELECT MIN(booking.amount)
    FROM booking
    WHERE booking.country IN ("Spain", "Germany") AND YEAR(booking.bookingdate) = 2017) AS minimum,

    (SELECT MAX(booking.amount)
    FROM booking
    WHERE booking.country IN ("Spain", "Germany") AND YEAR(booking.bookingdate) = 2017) AS maximum;

SELECT COUNT(*) AS total_tickets
FROM booking
WHERE booking.airline IN ("Iberia", "Lufthansa") AND (YEAR(booking.bookingdate) = 2017 OR YEAR(booking.bookingdate) = 2016);

SELECT MAX(booking.amount) AS max_amount
FROM booking
WHERE booking.country = "France" AND YEAR(booking.bookingdate) = 2017 AND MONTH(booking.bookingdate) < 7;












