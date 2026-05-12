CREATE VIEW CustomerSpendingSummary AS
SELECT
    c.FirstName,
    c.LastName,
    SUM(i.Total) AS LifetimeValue
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName;

CREATE ROLE IF NOT EXISTS 'DataAnalyst';


-- Grant SELECT privileges
GRANT SELECT ON Chinook.Artist TO 'DataAnalyst';
GRANT SELECT ON Chinook.Genre TO 'DataAnalyst';
GRANT SELECT ON Chinook.Album TO 'DataAnalyst';
GRANT SELECT ON Chinook.Track TO 'DataAnalyst';
GRANT SELECT ON Chinook.Customer TO 'DataAnalyst';
GRANT SELECT ON Chinook.Invoice TO 'DataAnalyst';
GRANT SELECT ON Chinook.InvoiceLine TO 'DataAnalyst';

CREATE USER IF NOT EXISTS 'Daniel'@'localhost'
IDENTIFIED BY 'IT_Student_2026';

CREATE USER IF NOT EXISTS 'TeamMember'@'localhost'
IDENTIFIED BY 'ProjectPass123';

GRANT 'DataAnalyst' TO 'Daniel'@'localhost';
GRANT 'DataAnalyst' TO 'TeamMember'@'localhost';

SET DEFAULT ROLE 'DataAnalyst' TO
'Daniel'@'localhost',
'TeamMember'@'localhost';