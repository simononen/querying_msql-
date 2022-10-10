USE prestigecars;

-- Filtering data using multiple table joins
SELECT DISTINCT MK.MakeName, MD.ModelName
FROM stock AS ST
JOIN model AS MD USING (ModelID)
JOIN make AS MK USING (MakeID)
ORDER BY MK.MakeName, MD.ModelName;

SELECT MD.ModelName, SA.SaleDate, SA.InvoiceNumber
FROM model AS MD
JOIN stock AS ST USING (ModelID)
JOIN salesdetails AS SD ON ST.StockCode = SD.StockID
JOIN sales AS SA USING (SalesID)
ORDER BY MD.ModelName;

-- Filtering Texts
SELECT DISTINCT MD.ModelName, ST.Color
FROM stock AS ST
JOIN model AS MD USING(ModelID)
WHERE Color = 'Red'
ORDER BY MD.ModelName;

-- Applying Multiple Text Filters
SELECT MD.ModelName, ST.Color
FROM stock AS ST
JOIN model MD USING (ModelID)
WHERE ST.Color IN ('Red', 'Green', 'Blue')
ORDER BY MD.ModelName;

-- Excluding an element
SELECT DISTINCT MK.MakeName
FROM make AS MK
JOIN model AS MD USING (MakeID)
JOIN stock AS ST USING (ModelID)
JOIN salesdetails AS SD ON ST.StockCode = SD.StockID
WHERE MK.MakeName <> 'Ferrari'
ORDER BY MK.MakeName;

-- Using multiple exclusion filters
SELECT DISTINCT MK.MakeName
FROM make AS Mk
JOIN model AS MD USING(MakeID)
JOIN stock AS ST USING(ModelID)
JOIN salesdetails s ON ST.StockCode = s.StockID
WHERE MK.MakeName NOT IN ('Porsche', 'Aston Martin', 'Bentley')
ORDER BY MK.MakeName;

-- Filtering numbers over a defined threshold
SELECT ModelName, Cost
FROM model AS MD
JOIN stock AS ST USING(ModelID)
WHERE Cost > 50000;

-- Filtering numbers under a defined threshold
SELECT ModelName, Cost
FROM model AS MD
JOIN stock AS ST USING(ModelID)
WHERE PartsCost < 1000
ORDER BY ModelName;

-- Filtering on Values Up to and including a Specific Number
SELECT MD.ModelName, ST.RepairsCost
FROM model AS MD
JOIN stock AS ST USING (ModelID)
WHERE ST.RepairsCost <= 500
ORDER BY MD.ModelName;

-- Filtering on a range of rows
SELECT DISTINCT MK.MakeName
FROM make AS MK
JOIN model AS MD USING(MakeID)
JOIN stock AS ST USING(ModelID)
WHERE ST.RepairsCost BETWEEN 1000 AND 2000
ORDER BY MK.MakeName;

-- Using Boolean Filters (True or False)
SELECT DISTINCT MK.MakeName, MD.ModelName
FROM make AS MK
JOIN model AS MD USING(MakeID)
JOIN stock AS ST USING(ModelID)
JOIN salesdetails AS SD ON ST.StockCode = SD.StockID
WHERE ST.IsRHD = 1
ORDER BY MK.MakeName, MD.ModelName;