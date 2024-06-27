-- Retrieve all records from the stocks table:
SELECT * FROM stocks;

-- Get all stock records between two specific datesSELECT * FROM stocks
SELECT * FROM stocks
WHERE Index = 'HSI' AND Date BETWEEN DATE '1987-01-01' AND DATE '1987-12-31';

-- Find the highest closing price in the dataset
SELECT Index, MAX(Close) AS Highest_Close
FROM stocks
GROUP BY Index;

-- Calculate the average trading volume for each index
SELECT Index, AVG(Volume) AS Average_Volume
FROM stocks
GROUP BY Index;

-- Calculate the daily price range (High - Low) for each record
SELECT Index, Date, High, Low, (High - Low) AS Daily_Range
FROM stocks;

-- Calculate the total volume traded each month
SELECT Index, year(Date) AS Year, month(Date) AS Month, SUM(Volume) AS Total_Volume
FROM stocks
GROUP BY Index, year(Date), month(Date)
ORDER BY Index, Year, Month;

-- Calculate the average closing price for each month
SELECT Index, year(Date) AS Year, month(Date) AS Month, AVG(Close) AS Average_Close
FROM stocks
GROUP BY Index, year(Date), month(Date)
ORDER BY Index, Year, Month;

-- Find all days where the closing price was higher than the opening price
SELECT * FROM stocks
WHERE Close > Open;

-- Find the maximum daily price increase (Close - Open) for each index
SELECT Index, Date, (Close - Open) AS Daily_Increase
FROM stocks
QUALIFY ROW_NUMBER() OVER (PARTITION BY Index ORDER BY Daily_Increase DESC) = 1;

-- Count the number of trading days each year
SELECT Index, year(Date) AS Year, COUNT(*) AS Trading_Days
FROM stocks
GROUP BY Index, year(Date)
ORDER BY Index, Year;

-- Get aggregate statistics (Min, Max, Avg) for the closing prices
SELECT Index, MIN(Close) AS Min_Close, MAX(Close) AS Max_Close, AVG(Close) AS Avg_Close
FROM stocks
GROUP BY Index;

-- Calculate the average CloseUSD for each year
SELECT Index, year(Date) AS Year, AVG(CloseUSD) AS Avg_CloseUSD
FROM stocks
GROUP BY Index, year(Date)
ORDER BY Index, Year; 