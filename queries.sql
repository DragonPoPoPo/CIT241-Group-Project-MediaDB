-- 1. Select top 100 rows from each table
SELECT * FROM Artists LIMIT 100;
SELECT * FROM Genres LIMIT 100;
SELECT * FROM Albums LIMIT 100;
SELECT * FROM Tracks LIMIT 100;
SELECT * FROM Customers LIMIT 100;
SELECT * FROM Invoices LIMIT 100;
SELECT * FROM InvoiceItems LIMIT 100;

-- 2. Join statement: Top 100 Tracks with their Album Titles
SELECT t.Name AS TrackName, a.Title AS AlbumTitle, t.Price
FROM Tracks t
JOIN Albums a ON t.AlbumId = a.AlbumId
LIMIT 100;

-- 3. Aggregate Query: Total Revenue by Genre
SELECT g.Name AS GenreName, SUM(ii.UnitPrice * ii.Quantity) AS TotalSales
FROM Genres g
JOIN Tracks t ON g.GenreId = t.GenreId
JOIN InvoiceItems ii ON t.TrackId = ii.TrackId
GROUP BY g.Name
ORDER BY TotalSales DESC;