--exercise 1: higher than the average of ALL invoices
SELECT Customer.`CustomerId`, Customer.`FirstName`, Customer.`LastName`, SUM(Invoice.`Total`) as "TotalSpent"
FROM Customer INNER JOIN Invoice ON Customer.`CustomerId` = Invoice.`CustomerId`
GROUP BY Customer.`CustomerId`, Customer.`FirstName`, Customer.`LastName`
HAVING SUM(Invoice.`Total`) > ALL(SELECT AVG(Invoice.`Total`)
                                FROM Invoice);

--exercise 2
SELECT DISTINCT Album.`AlbumId`, Album.`Title`, Artist.`Name`
FROM Album INNER JOIN Artist ON Album.`ArtistId` = Artist.`ArtistId`
INNER JOIN Track ON Album.`AlbumId` = Track.`AlbumId`
WHERE Track.`Milliseconds` > ANY(SELECT AVG(Track.`Milliseconds`)
                                FROM Track);

--exercise 3
SELECT E1.`EmployeeId`, E1.`FirstName`, E1.`LastName`, COUNT(E2.`EmployeeId`) as SupervisedEmployee
FROM Employee as E1 INNER JOIN Employee as E2 ON E1.`EmployeeId` = E2.`ReportsTo`
GROUP BY E1.`EmployeeId`, E1.`FirstName`, E1.`LastName`
HAVING COUNT(E2.`EmployeeId`) >= 1;

--exercise 4
SELECT Track.`TrackId`, Track.`Name`, Track.`UnitPrice`
FROM Track 
WHERE Track.`UnitPrice` > (SELECT AVG(InvoiceLine.`UnitPrice`)
                                FROM InvoiceLine);

--exercise 5: greater than the duration of ALL tracks
SELECT Artist.`Name`
FROM Artist INNER JOIN Album ON Artist.`ArtistId` = Album.`ArtistId`
INNER JOIN Track ON Album.`AlbumId` = Track.`AlbumId`
GROUP BY Artist.`Name`
HAVING SUM(Track.`Milliseconds`) > ALL(SELECT Track.`Milliseconds`
                                    FROM Track);

--exercise 6
SELECT Customer.`CustomerId`, Customer.`FirstName`, Customer.`LastName`, COUNT(DISTINCT(Album.`Title`)) as AlbumsPurchased
FROM Customer INNER JOIN Invoice ON Customer.`CustomerId` = Invoice.`CustomerId`
INNER JOIN InvoiceLine ON Invoice.`InvoiceId` = InvoiceLine.`InvoiceId`
INNER JOIN Track ON InvoiceLine.`TrackId` = Track.`TrackId`
INNER JOIN Album ON Track.`AlbumId` = Album.`AlbumId`
GROUP BY Customer.`CustomerId`, Customer.`FirstName`, Customer.`LastName`
HAVING COUNT(DISTINCT(Album.`Title`)) > 25;
--This query retrieves each customer’s ID, first name, and last name, and calculates how many different albums they have purchased. 
--It does this by doing 4 inner joins, It uses `COUNT(DISTINCT Album.Title)`
--The results are grouped by customer so that the count is calculated separately for each one. 
--The `HAVING` clause then filters the grouped results to return only those customers who have purchased more than 25 different albums.

--exercise 7
SELECT Customer.`FirstName`, Customer.`LastName`, Invoice.`InvoiceId`, Invoice.`Total`
FROM Customer INNER JOIN Invoice ON Customer.`CustomerId` = Invoice.`CustomerId`
WHERE Invoice.`Total` > (SELECT AVG(I2.`Total`)
                            FROM Invoice as I2
                            WHERE Invoice.`CustomerId` = I2.`CustomerId`);
--This query retrieves each customer’s first and last name along with their invoice ID and invoice total, 
--but only for invoices whose total amount is greater than that customer’s own average invoice total. 
--It joins the `Customer` and `Invoice` tables 
--The `WHERE` clause contains a correlated subquery that calculates the average invoice total for the same customer as the invoice currently being evaluated. 
--Because the subquery filters by matching `CustomerId`, it computes a separate average for each customer. 
--The query therefore returns only those invoices where the amount is higher than what that specific customer typically spends on average.

