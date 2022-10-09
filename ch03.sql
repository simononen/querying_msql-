USE prestigecars;

-- Using the LEFT JOIN to return all data from one table but not from the other
SELECT DISTINCT
FROM make AS MK
LEFT JOIN model AS MD USING (makeID)