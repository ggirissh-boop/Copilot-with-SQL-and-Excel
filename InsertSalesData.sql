-- Insert 10,000 rows of random data into SalesData table
DECLARE @Counter INT = 0;
DECLARE @MaxRows INT = 10000;

-- Sample data for cities
DECLARE @Cities TABLE (City NVARCHAR(50));
INSERT INTO @Cities VALUES 
('New York'), ('Los Angeles'), ('Chicago'), ('Houston'), ('Phoenix'),
('Philadelphia'), ('San Antonio'), ('San Diego'), ('Dallas'), ('San Jose'),
('Austin'), ('Jacksonville'), ('Boston'), ('Seattle'), ('Denver'),
('Washington DC'), ('Nashville'), ('Detroit'), ('Memphis'), ('Portland');

-- Sample first names
DECLARE @FirstNames TABLE (Name NVARCHAR(50));
INSERT INTO @FirstNames VALUES 
('James'), ('Mary'), ('Robert'), ('Patricia'), ('Michael'), ('Linda'), ('William'), ('Barbara'),
('David'), ('Elizabeth'), ('Richard'), ('Jennifer'), ('Joseph'), ('Maria'), ('Thomas'), ('Susan'),
('Charles'), ('Jessica'), ('Christopher'), ('Sarah'), ('Daniel'), ('Karen'), ('Matthew'), ('Nancy'),
('Anthony'), ('Betty'), ('Mark'), ('Margaret'), ('Donald'), ('Sandra'), ('Steven'), ('Ashley'),
('Paul'), ('Kimberly'), ('Andrew'), ('Emily'), ('Joshua'), ('Donna'), ('Kenneth'), ('Michelle');

-- Sample last names
DECLARE @LastNames TABLE (Name NVARCHAR(50));
INSERT INTO @LastNames VALUES 
('Smith'), ('Johnson'), ('Williams'), ('Brown'), ('Jones'), ('Garcia'), ('Miller'), ('Davis'),
('Rodriguez'), ('Martinez'), ('Hernandez'), ('Lopez'), ('Gonzalez'), ('Wilson'), ('Anderson'),
('Thomas'), ('Taylor'), ('Moore'), ('Jackson'), ('Martin'), ('Lee'), ('Perez'), ('Thompson'),
('White'), ('Harris'), ('Sanchez'), ('Clark'), ('Ramirez'), ('Lewis'), ('Robinson'), ('Young');

-- Insert random data
WHILE @Counter < @MaxRows
BEGIN
    INSERT INTO SalesData (Name, Age, City, PurchaseAmount, PurchaseDate)
    SELECT 
        (SELECT TOP 1 Name FROM @FirstNames ORDER BY NEWID()) + ' ' +
        (SELECT TOP 1 Name FROM @LastNames ORDER BY NEWID()) AS Name,
        CAST(RAND() * 60 + 18 AS INT) AS Age,  -- Age between 18 and 78
        (SELECT TOP 1 City FROM @Cities ORDER BY NEWID()) AS City,
        CAST(RAND() * 5000 + 10 AS DECIMAL(10, 2)) AS PurchaseAmount,  -- Amount between $10 and $5010
        DATEADD(DAY, CAST(RAND() * 365 AS INT), DATEFROMPARTS(2024, 1, 1)) AS PurchaseDate;  -- Date in 2024
    
    SET @Counter = @Counter + 1;
END;

-- Display sample of inserted data
SELECT TOP 20 * FROM SalesData ORDER BY CustomerID;
SELECT 'Total Records Inserted: ' + CAST(COUNT(*) AS NVARCHAR(10)) AS Result FROM SalesData;
