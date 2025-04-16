-- Normalize ProductDetail into 1NF
SELECT 
    OrderID,
    CustomerName,
    TRIM(value) AS Product
FROM 
    ProductDetail
CROSS APPLY 
    STRING_SPLIT(Products, ',');

-- Create Orders table (CustomerName depends only on OrderID)
SELECT DISTINCT
    OrderID,
    CustomerName
INTO Orders
FROM OrderDetails;

-- Create OrderItems table (Each product and its quantity per order)
SELECT 
    OrderID,
    Product,
    Quantity
INTO OrderItems
FROM OrderDetails;
