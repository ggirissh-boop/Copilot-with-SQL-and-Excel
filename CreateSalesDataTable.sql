-- Create SalesData Table
CREATE TABLE SalesData (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    City NVARCHAR(50) NOT NULL,
    PurchaseAmount DECIMAL(10, 2) NOT NULL,
    PurchaseDate DATETIME NOT NULL
);

-- Create index on PurchaseDate for better query performance
CREATE INDEX IX_PurchaseDate ON SalesData(PurchaseDate);
CREATE INDEX IX_City ON SalesData(City);
