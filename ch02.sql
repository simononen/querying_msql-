USE prestigecars;

-- Joining tables
SELECT ModelName, Cost
FROM model
JOIN stock USING(modelID)
ORDER BY ModelName;

-- Removing Duplicates from Query Output
SELECT DISTINCT CountryName
FROM customer
JOIN country ON customer.Country = country.CountryISO2
ORDER BY CountryName;

-- Joining Multiple Tables
SELECT make.MakeName, model.ModelName, stock.Cost
FROM stock
JOIN model USING(ModelID)
JOIN make USING(MakeID)
ORDER BY make.MakeName, model.ModelName;

-- Using Aliases
SELECT S.InvoiceNumber, D.LineItemNumber, D.SalePrice, D.LineItemDiscount
FROM sales AS S
JOIN salesdetails AS D USING (salesID)
ORDER BY S.InvoiceNumber, D.LineItemNumber;

-- Joining Many Tables
SELECT
    CY.CountryName,
    MK.MakeName,
    MD.ModelName,
    ST.Cost,
    ST.RepairsCost,
    ST.PartsCost,
    ST.TransportInCost,
    ST.Color,
    SD.SalePrice,
    SD.LineItemDiscount,
    SA.InvoiceNumber,
    SA.SaleDate,
    CS.CustomerName
FROM stock AS ST
JOIN model AS MD USING (modelID)
JOIN make AS MK USING (MakeID)
JOIN salesdetails AS SD ON ST.StockCode = SD.StockID
JOIN sales AS SA USING (SalesID)
JOIN customer AS CS USING (CustomerID)
JOIN country AS CY ON CS.Country = CY.CountryISO2
ORDER BY CY.CountryName, MK.MakeName, MD.ModelName;

-- Using Views to memorize complex table joins
SELECT CountryName,
       MakeName,
       ModelName,
       Cost,
       RepairsCost,
       PartsCost,
       TransportInCost,
       Color,
       SalePrice,
       LineItemDiscount,
       InvoiceNumber,
       SaleDate,
       CustomerName
FROM salesbycountry
ORDER BY CountryName, MakeName, ModelName;

