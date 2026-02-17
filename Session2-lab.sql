SELECT booking.amount, booking.bookingdate, booking.country
FROM booking
WHERE booking.country IN ("Spain", "France") AND booking.amount BETWEEN 201 AND 599 AND year(booking.bookingdate) = 2017;

SELECT booking.airline, booking.amount
FROM booking
WHERE booking.airline NOT IN ("Ryanair", "EasyJet") AND booking.amount >= 2800;

SELECT booking.bookingdate, booking.seatclass
FROM booking
WHERE (year(booking.bookingdate) = 2016 AND MONTH(booking.bookingdate) IN (01, 02)) AND booking.seatclass = "Business";

SELECT booking.lastname, booking.postalcode
FROM booking
WHERE booking.lastname LIKE "A%" AND booking.postalcode LIKE "%9"; --this shows those bookings that have a last name that starts with A and a postal code that ends with 9 

SELECT booking.email
FROM booking
WHERE booking.email = ""; --this shows those bookings that have a null email. This should technically be done using the IS NULL operator, however, it doesn't work. 
--Therefore, it is alternatively done using = "", which equally indicates that there is no email (NULL). There is only one booking with a null email

SELECT booking.bookingdate, booking.amount  
FROM booking
WHERE booking.bookingdate IS NOT NULL AND booking.amount > 2500;

SELECT booking.destination, booking.origin
FROM booking
WHERE booking.origin IS NOT NULL AND booking.destination IS NULL;

SELECT booking.amount, booking.bookingdate, booking.lastname, booking.airline, booking.origin, booking.destination, booking.country
FROM booking
WHERE booking.airline = "Iberia" AND year(booking.bookingdate) = 2017 AND booking.origin = booking.destination AND booking.country IN ("Spain", "France")
ORDER BY booking.amount DESC
LIMIT 5;

SELECT booking.seatclass, booking.airline, booking.amount
FROM booking
WHERE booking.amount > 400 AND booking.seatclass IN ("Economy", "Premium Economy") AND booking.airline IN ("British Airways", "Lufthansa");

SELECT booking.firstname, booking.country, booking.amount
FROM booking
WHERE (booking.firstname LIKE "J%" OR booking.firstname LIKE "M%") AND booking.country != "Germany" AND booking.amount BETWEEN 1500 AND 1900;
--In this case the parenthesis for the LIKE operators are necessary, otherwise the following ANDs would only be applied to those people whose first name starts with M. 
--By putting the parenthesis the next conditions apply to both those whose name starts with J and those whose name starts with M. 
--Otherwise they would only apply to those whose name starts with M

SELECT booking.origin, booking.destination, booking.amount, booking.email
FROM booking
WHERE booking.origin = booking.destination AND booking.amount IS NOT NULL AND booking.email LIKE "%.com";

SELECT booking.airline, booking.bookingdate, booking.amount
FROM booking
WHERE booking.airline IN ("Iberia", "Delta Airlines") AND month(booking.bookingdate) = 12 AND booking.amount BETWEEN 1200 AND 2500;
