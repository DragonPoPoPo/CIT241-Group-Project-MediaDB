SELECT * FROM Artist LIMIT 100;
SELECT * FROM Genre LIMIT 100;
SELECT * FROM Album LIMIT 100;
SELECT * FROM Track LIMIT 100;
SELECT * FROM Customer LIMIT 100;
SELECT * FROM Invoice LIMIT 100;
SELECT * FROM InvoiceLine LIMIT 100;

SELECT
    t.Name AS TrackName,
    a.Title AS AlbumTitle,
    t.UnitPrice AS Price
FROM Track t
JOIN Album a ON t.AlbumId = a.AlbumId
LIMIT 100;


SELECT
    g.Name AS GenreName,
    SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY g.Name
ORDER BY TotalSales DESC;