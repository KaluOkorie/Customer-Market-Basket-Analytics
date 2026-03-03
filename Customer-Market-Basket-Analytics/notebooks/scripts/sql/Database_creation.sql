CREATE DATABASE retail_analytics;
USE retail_analytics;

-- Create Association_Rules table
CREATE TABLE association_rules (
    rule_id INT AUTO_INCREMENT,
    antecedents TEXT,
    consequents TEXT,
    `antecedent support` FLOAT,
    `consequent support` FLOAT,
    support FLOAT,
    confidence FLOAT,
    lift FLOAT,
    representativity FLOAT,
    leverage FLOAT,
    conviction FLOAT,
    zhangs_metric FLOAT,
    jaccard FLOAT,
    certainty FLOAT,
    kulczynski FLOAT,
    PRIMARY KEY (rule_id)
);

-- Create Transactions table
CREATE TABLE transactions (
    InvoiceNo VARCHAR(50) NOT NULL,
    StockCode VARCHAR(50) NOT NULL,
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(50) NOT NULL,
    Country VARCHAR(100),
    TotalPrice DECIMAL(10,2),
    Year INT,           -- added
    Month VARCHAR(20),  -- added
    PRIMARY KEY (InvoiceNo, StockCode),
    FOREIGN KEY (CustomerID) REFERENCES customer_summary(CustomerID)
);

-- Create Customer_Summary table
CREATE TABLE customer_summary (
    CustomerID VARCHAR(50) NOT NULL,
    TotalSpent DECIMAL(10,2),
    NumPurchases INT,
    Recency INT,
    PRIMARY KEY (CustomerID)
);

-- Create RFM_Segments table
CREATE TABLE rfm_segments (
    CustomerID VARCHAR(50) NOT NULL,
    Recency INT,
    Frequency INT,
    Monetary DECIMAL(10,2),
    R_Score INT,
    F_Score INT,
    M_Score INT,
    RFM_Total INT,
    RFM_Score VARCHAR(10),
    Segment VARCHAR(50),
    Cluster INT,
    PRIMARY KEY (CustomerID),
    FOREIGN KEY (CustomerID) REFERENCES customer_summary(CustomerID)
);
-- Create Monthly_revenue table
CREATE TABLE monthly_revenue (
    InvoiceDate VARCHAR(20) NOT NULL,
    TotalPrice DECIMAL(10,2),
    PRIMARY KEY (InvoiceDate)
);

-- Create frequent_itemsets table
CREATE TABLE frequent_itemsets (
    itemset_id INT AUTO_INCREMENT,
    support FLOAT,
    itemsets TEXT,
    length INT,
    PRIMARY KEY (itemset_id)
);

-- CREATE INDEXES
CREATE INDEX idx_transactions_customer ON transactions(CustomerID);
CREATE INDEX idx_transactions_date ON transactions(InvoiceDate);
CREATE INDEX idx_rfm_segment ON rfm_segments(Segment);
CREATE INDEX idx_rfm_cluster ON rfm_segments(Cluster);

-- VERIFY DATA COUNTS
SELECT 'customer_summary' AS Table_Name, COUNT(*) AS Row_Count FROM customer_summary
UNION ALL
SELECT 'rfm_segments', COUNT(*) FROM rfm_segments
UNION ALL
SELECT 'transactions', COUNT(*) FROM transactions
UNION ALL
SELECT 'monthly_revenue', COUNT(*) FROM monthly_revenue
UNION ALL
SELECT 'frequent_itemsets', COUNT(*) FROM frequent_itemsets
UNION ALL
SELECT 'association_rules', COUNT(*) FROM association_rules;