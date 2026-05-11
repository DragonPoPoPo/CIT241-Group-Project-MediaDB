-- 1. Create a View for Customer Spending
CREATE VIEW CustomerSpendingSummary AS
SELECT c.FirstName, c.LastName, SUM(i.Total) AS LifetimeValue
FROM Customers c
JOIN Invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName;

-- 2. Security Setup
CREATE ROLE 'DataAnalyst';
-- Grant only SELECT privileges
GRANT SELECT ON Artists, Genres, Albums, Tracks, Customers, Invoices, InvoiceItems TO 'DataAnalyst';

-- Create users for the group
CREATE USER 'Daniel'@'localhost' IDENTIFIED BY 'IT_Student_2026';
CREATE USER 'TeamMember'@'localhost' IDENTIFIED BY 'ProjectPass123';

-- Assign users to the role
GRANT 'DataAnalyst' TO 'Daniel'@'localhost', 'TeamMember'@'localhost';