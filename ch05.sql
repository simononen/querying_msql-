USE prestigecars;

-- Applying Complex Filters to Queries

-- Using Either/Or Filters
SELECT Mk.MakeName, ST.Color
FROM make AS MK
JOIN model AS MD USING (MakeID)
JOIN stock AS ST USING (ModelID)
JOIN salesdetails SD ON ST.StockCode = SD.StockID
WHERE ST.Color = 'Red' OR MakeName = 'Ferrari'
ORDER BY MK.MakeName;

-- Using Multiple Separate Criteria Concurrently
SELECT DISTINCT Mk.MakeName, ST.Color
FROM make AS MK
JOIN model AS MD USING (MakeID)
JOIN stock AS ST USING (ModelID)
JOIN salesdetails SD ON ST.StockCode = SD.StockID
WHERE ST.Color = 'Red' AND MakeName = 'Ferrari'
ORDER BY MK.MakeName;

-- Using Multiple filters and an exclusion
SELECT DISTINCT MK.MakeName, ST.Color
FROM make AS MK
JOIN model AS MD USING(MakeID)
JOIN stock AS ST USING(ModelID)
JOIN salesdetails AS SD ON ST.StockCode = SD.StockID
WHERE ST.Color IN ('Red', 'Green', 'Blue') AND MK.MakeName <> 'Bentley'
ORDER BY MK.MakeName, ST.Color;

-- Filtering on both text and numbers simultaneously
SELECT Md.ModelName, ST.Color, ST.PartsCost, ST.RepairsCost
FROM stock AS ST
JOIN model AS MD USING(ModelID)
WHERE ST.Color = 'Red' AND (ST.PartsCost > 1000 OR ST.RepairsCost > 1000)
ORDER BY MD.ModelName;

-- Applying Complex Alternative Filters at the Same Time
SELECT DISTINCT MD.ModelName, ST.Color, ST.PartsCost, ST.RepairsCost
FROM
stock AS ST
JOIN model AS MD USING(ModelID)
WHERE (ST.Color IN ('Red', 'Green', 'Blue') AND MD.ModelName = 'Phantom')
   OR (ST.PartsCost > 5500 AND ST.RepairsCost > 5500);

-- Case-Sensitive Searches
SELECT *
FROM stock AS ST
WHERE BINARY ST.Color = 'Dark purple';

-- Removing Case-Sensitivity in Filters
SELECT MD.ModelName, ST.Color, ST.PartsCost, ST.RepairsCost
FROM stock AS ST
JOIN model AS MD USING (ModelID)
WHERE UPPER(ST.Color) = 'DARK PURPLE'
ORDER BY MD.ModelName;

-- Using Wildcard Searches
SELECT CustomerName
FROM customer AS CT
WHERE CT.CustomerName LIKE '%pete%';

-- Using Wildcards to Exclude Data
SELECT CT.CustomerName
FROM customer AS CT
WHERE CT.CustomerName NOT LIKE '%pete%'
ORDER BY CT.CustomerName;

-- Forcing Case-Sensitivity in Wildcard Filters
SELECT *
FROM make
WHERE BINARY MakeName LIKE '%L%';

-- Using a Specific Part of Text to Filter Data
SELECT DISTINCT MD.ModelName, SA.InvoiceNumber
FROM make AS MK
JOIN model AS MD USING (MakeID)
JOIN stock AS ST USING (ModelID)
JOIN salesdetails AS SD ON SD.StockID = ST.StockCode
JOIN sales AS SA ON SA.SalesID = SD.SalesID
WHERE SA.InvoiceNumber LIKE '___FR%'
ORDER BY SA.InvoiceNumber;

-- Using NULL or Nonexistent Data
SELECT CU.CustomerName, CU.PostCode
FROM customer AS CU
WHERE CU.PostCode IS NULL
ORDER BY CU.CustomerName;

-- Searching Using Regular Expressions
SELECT CU.CustomerName
FROM customer AS CU
WHERE CU.CustomerName REGEXP '^Pe.*g$';