-- 1. Top 10 Customers by Lifetime Value (with RFM Segment)
SELECT 
    cs.CustomerID,
    cs.TotalSpent,
    cs.NumPurchases,
    cs.Recency,
    rfm.Segment,
    rfm.RFM_Score
FROM customer_summary cs
JOIN rfm_segments rfm ON cs.CustomerID = rfm.CustomerID
ORDER BY cs.TotalSpent DESC
LIMIT 10;

-- 2. Monthly Revenue Trend with Month‑Over‑Month Growth
SELECT 
    InvoiceDate,
    TotalPrice AS Revenue,
    LAG(TotalPrice) OVER (ORDER BY InvoiceDate) AS PrevMonthRevenue,
    ROUND(
        (TotalPrice - LAG(TotalPrice) OVER (ORDER BY InvoiceDate)) 
        / LAG(TotalPrice) OVER (ORDER BY InvoiceDate) * 100, 
        2
    ) AS GrowthPercent
FROM monthly_revenue
ORDER BY InvoiceDate;

-- 3. Top 10 Best‑Selling Products by Revenue
SELECT 
    Description,
    SUM(Quantity) AS TotalUnitsSold,
    SUM(TotalPrice) AS TotalRevenue,
    COUNT(DISTINCT InvoiceNo) AS NumberOfOrders
FROM transactions
GROUP BY Description
ORDER BY TotalRevenue DESC
LIMIT 10;

-- 4 Customer Distribution Across RFM Segments
SELECT 
    Segment,
    COUNT(*) AS CustomerCount,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS Percentage
FROM rfm_segments
GROUP BY Segment
ORDER BY CustomerCount DESC;

-- 5. Strongest Product Association Rules (by Lift)
-- Discover cross‑selling opportunities (e.g., "customers who buy X also buy Y").
SELECT 
    antecedents,
    consequents,
    support,
    confidence,
    lift
FROM association_rules
WHERE lift > 2
ORDER BY lift DESC
LIMIT 10;

-- 6. Revenue Breakdown by Country
-- Identify top geographic markets and expansion opportunities.
SELECT 
    Country,
    ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
    COUNT(DISTINCT CustomerID) AS UniqueCustomers,
    ROUND(SUM(TotalPrice) / COUNT(DISTINCT InvoiceNo), 2) AS AvgOrderValue
FROM transactions
GROUP BY Country
ORDER BY TotalRevenue DESC
LIMIT 10;
-- 7. Customer Purchase Frequency Distribution
-- Visualize one‑time buyers vs. repeat customers – key for retention strategies.
SELECT 
    NumPurchases AS PurchaseFrequency,
    COUNT(*) AS NumberOfCustomers
FROM customer_summary
GROUP BY NumPurchases
ORDER BY NumPurchases;

-- 8. Average Order Value by Customer Segment
-- Compare spending habits across segments 
SELECT 
    rfm.Segment,
    ROUND(AVG(cs.TotalSpent / cs.NumPurchases), 2) AS AvgOrderValue,
    ROUND(AVG(cs.TotalSpent), 2) AS AvgLifetimeValue
FROM customer_summary cs
JOIN rfm_segments rfm ON cs.CustomerID = rfm.CustomerID
GROUP BY rfm.Segment
ORDER BY AvgOrderValue DESC;

-- 9. Daily Sales Pattern (Day of Week Analysis)
-- Optimize staffing, promotions, and inventory based on daily demand.
SELECT 
    DAYNAME(InvoiceDate) AS Weekday,
    WEEKDAY(InvoiceDate) AS WeekdayNumber,
    ROUND(AVG(TotalPrice), 2) AS AvgDailyRevenue,
    COUNT(DISTINCT InvoiceNo) AS NumTransactions
FROM transactions
GROUP BY Weekday, WeekdayNumber
ORDER BY WeekdayNumber;

