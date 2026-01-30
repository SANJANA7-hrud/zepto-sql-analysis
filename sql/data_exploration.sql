-- Count total rows
SELECT COUNT(*) FROM zepto;

-- Sample data
SELECT * FROM zepto LIMIT 10;

-- Check NULL values
SELECT *
FROM zepto
WHERE name IS NULL
   OR category IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR availableQuantity IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;

-- Distinct product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;
