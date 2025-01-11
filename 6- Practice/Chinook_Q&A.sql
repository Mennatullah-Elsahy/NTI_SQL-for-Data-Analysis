-- Q1: Which countries have the most Invoices?
SELECT Top 1 BillingCountry, COUNT(*) AS Invoices
FROM Invoice
GROUP BY BillingCountry
ORDER BY Invoices DESC;

-- Q2: Which city has the best customers?
SELECT TOP 1 BillingCity, SUM(TOTAL) AS TotalRevenue
FROM Invoice
GROUP BY BillingCity
ORDER BY TotalRevenue DESC;

-- Q3: Who is the best customer?
SELECT Top 1 CustomerId, SUM(Total) AS TotalBilling
FROM Invoice
GROUP BY CustomerId
ORDER BY TotalBilling DESC;

--Q4: Make a query to return the email, first name, last name, and Genre of all Rock Music listeners and order them alphabetically by email address starting with A
SELECT DISTINCT Customer.Email, Customer.FirstName, Customer.LastName, Genre.Name AS Genre
FROM Customer
JOIN Invoice 
ON Customer.CustomerId = Invoice.CustomerId
JOIN InvoiceLine 
ON Invoice.InvoiceId = InvoiceLine.InvoiceId
JOIN Track 
ON InvoiceLine.TrackId = Track.TrackId
JOIN Genre 
ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Rock'
ORDER BY Customer.Email ASC;

--Q5: Who is writing the rock music?
SELECT TOP 10 Artist.Name AS ArtistName, COUNT(Track.TrackId) AS RockTrackCount
FROM Artist
JOIN Album 
ON Artist.ArtistId = Album.ArtistId
JOIN Track 
ON Track.AlbumId = Album.AlbumId
JOIN Genre 
ON Genre.GenreId = Track.GenreId
WHERE Genre.Name = 'Rock'
GROUP BY Artist.Name
ORDER BY RockTrackCount DESC;

--Q6: Find which artist has earned the most according to the InvoiceLines?
SELECT TOP 10 Artist.Name AS ArtistName, SUM(InvoiceLine.Quantity * InvoiceLine.UnitPrice) AS TotalEarned
FROM Artist
JOIN Album 
ON Artist.ArtistId = Album.ArtistId
JOIN Track 
ON Track.AlbumId = Album.AlbumId
JOIN InvoiceLine 
ON InvoiceLine.TrackId = Track.TrackId
GROUP BY Artist.Name
ORDER BY TOTALEARNED DESC;

