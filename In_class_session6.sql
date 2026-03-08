SELECT stores.brand, stores.sales
FROM stores
WHERE stores.country <> "France" AND stores.sales > ANY(SELECT 
                        stores.sales FROM stores
                        WHERE stores.country = "France");
--The subquery returns a list of values, these being the sales of all the stores located in france. Then, the main query
--compares this list returned by the subquery with all of the stores that are not in france.
--the output returns the brand and the amount of sales of all those stores that ARE NOT IN FRANCE and whose sales are greater than the sales of any French store
--It takes out French stores using `stores.country <> "France"` and then uses a subquery to compare each remaining store’s sales to the sales of French stores. 
--The `> ANY` condition ensures that a store is included in the final output if its sales exceed any one of the French stores’ sales, 
--meaning it only needs to outperform at least one French store rather than all of them.

--When using a subquery, the column must be the same, store.sales must be compared with store.sales
--There is more than 1 store in france so the subquery returns more than 1 row,
--Therefore you cannot use a single link (> < =), you must use a relational operator followed by ANY (in this case)
--higher than ANY of them, hgher than ALL of them
--ALL --> show me the stores NOT IN FRANCE of which the sales are higher than the sales of ALL stores in France, in other words,
--higher than the maximum value of sales in a French store. If it is not higher than the maximum in France, then it won't even be higher than any other one in the list returned by the subquery 
--If you put ALL, then the subquery will return the value of the row only if it is greater than ALL of those returned by the subqeury 
--If you put ANY, then it will return the value of the row if it is greater than at least one of the values returned by the subquery

--When the subquery returns more than 1 row and we want to compare equality or non-equality instead of using = we should use IN or NOT IN 

SELECT stores.brand, stores.sales
FROM stores
WHERE stores.sales > ALL(SELECT AVG(stores.sales)
                        FROM stores
                        WHERE stores.country = "France");
--In this case we will return the brand and the sales of all those stores that have sales higher than the average sales in France
--The subquery returns a single value, which is the average sales among French stores
--therefore, the whole query will return brands and sales of those stores which have sales higher than the average french sales
--If I want to use an AVERAGE (or aggregate function) in the WHERE clause, which I usually cannot do, then I have to do it this way (using a subquery) 
--The subquery calculates the average sales of all stores where the country is France, returning a single value. 
--Since the subquery returns only one number, using `ALL` does not change the logic


--We want to show the city and address of those stores of which sales are higher than the oldest store 
SELECT stores.city, stores.`storeAddress`
FROM stores
WHERE stores.sales > ALL(SELECT stores.sales 
                    FROM stores
                    WHERE stores.`openingDate` = 
                                                (SELECT MIN(stores.`openingDate`)
                                                FROM stores));
--this is a double nested query. The second subquery returns the minimum opening date, i.e. the eldest
--the first subquery returns ONE VALUE, which is the sales of the store with the minimum (oldest) opening date
--the main query then returns the city and address of the store whose sales are higher than the sales of the oldest store
--since the double nested query returns one value, the "ALL" is not necessary
--min(stores.openingdate) because the oldest is the one with the minimum opening date 

--get the total sales for each brand in SPain but we want to only list the brands which the total sales is higher than the average of all sales in database
SELECT stores.brand, SUM(stores.sales) as total_sales
FROM stores
WHERE stores.country = "Spain" 
GROUP BY stores.brand
HAVING total_sales > (SELECT AVG(stores.sales) FROM stores);
--This query calculates the total sales for each brand in Spain and returns only the brands whose total sales are higher than the average sales value across the entire table. 
--First, the query filters the data to include only rows where the country is Spain. 
--Then it groups the rows by brand and sums the sales for each brand to compute the total sales per brand. 
--The HAVING clause is used to filter these grouped results, keeping only those brands whose total sales exceed the average sales calculated by the subquery `(SELECT AVG(sales) FROM stores)`. 
--The condition is placed in HAVING instead of WHERE because the filtering is applied after the grouping and aggregation, and WHERE cannot be used with aggregated values like SUM().



