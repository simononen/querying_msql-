USE prestigecars;

-- Using the LEFT JOIN to return all data from one table but not from the other
SELECT DISTINCT MK.MakeName, MD.ModelName
FROM make AS MK
LEFT JOIN model AS MD USING (makeID);

-- Intermediate Tables
SELECT CO.CountryName, SA.TotalSalePrice
FROM sales AS SA
JOIN customer AS CS USING(CustomerID)
JOIN country AS CO ON CS.Country = CO.CountryISO2
ORDER BY CO.CountryName;

-- Using Multiple fields in Joins
SELECT CS.CustomerName, MI.SpendCapacity
FROM customer AS CS
JOIN marketinginformation AS MI ON CS.CustomerName = MI.CUST
    AND CS.Country = MI.Country
ORDER BY CS.CustomerName;

-- Joining a table to it self
SELECT ST1.StaffName, ST1.Department, ST2.StaffName AS ManagerName
FROM staff AS ST1
JOIN staff AS ST2 ON ST1.ManagerID = ST2.StaffID
ORDER BY ST1.Department, ST1.StaffName;

-- Joining Tables on Ranges of values
SELECT MK.MakeName, MD.ModelName, SD.SalePrice, CAT.CategoryDescription
FROM stock AS ST
JOIN model AS MD USING(ModelID)
JOIN make AS MK USING(MakeID)
JOIN salesdetails AS SD ON ST.StockCode = SD.StockID
JOIN salescategory AS CAT ON SD.SalePrice BETWEEN CAT.LowerThreshold AND CAT.UpperThreshold
ORDER BY MK.MakeName, MD.ModelName;

-- Cross Joins
SELECT CountryName, MakeName
FROM country
CROSS JOIN make
ORDER BY CountryName, MakeName;
