# Customer and Market Basket Analytics

## Project overview
This project analyzes online retail transactions to understand customer behavior, product combinations, and revenue drivers. It combines customer segmentation, market basket analysis, SQL data modeling, and Tableau storytelling to convert raw transactions into business decisions.

## Business problem solved
Retail teams often struggle to answer critical questions from raw invoice level data.
1. Which customers should be retained first.
2. Which customers are slipping and need re engagement.
3. Which products are bought together and should be bundled.
4. Which countries and months are driving revenue growth.

This project solves those gaps through consistent data cleaning, RFM segmentation, association rules, and dashboard ready datasets.

## Data source
1. UCI Online Retail dataset
2. https://archive.ics.uci.edu/ml/datasets/Online+Retail

## Technical stack and how it was used
1. Python  
Used for ingestion, data quality checks, transformation, feature engineering, outlier handling, and export pipelines.
2. scikit learn  
Used for scaling RFM features, K means clustering, and silhouette score based cluster validation.
3. mlxtend  
Used for FP Growth frequent itemsets and association rules for product affinity insights.
4. SQL  
Used to design structured tables, enforce data consistency, and produce reusable analytical queries for KPI reporting.
5. Jupyter Notebook  
Used as the end to end analytical workflow environment from raw data to final business outputs.
6. Tableau  
Used for simple explanatory dashboards and story based communication for non technical stakeholders.

## Data engineering and cleaning rigor
1. Data was downloaded from UCI and validated for schema, missing values, duplicates, and invalid transactions.
2. Cancelled invoices, missing customer IDs, non positive quantities, and non positive unit prices were removed.
3. Types were standardized and `TotalPrice` was derived consistently.
4. Extreme values were capped using percentile based Winsorization to stabilize distributions.
5. CSV outputs were generated for SQL and Tableau in separate folders for clean handoff.
6. Relationship consistency was addressed while structuring SQL assets, including parent and child alignment concerns that appear during updates.

## Project challenges handled
1. Making cleaning rules consistent across notebook sections and exports.
2. Building reliable association rules without excessive noise.
3. Preparing pie chart friendly and dashboard friendly summarized data for Tableau.
4. Handling relational consistency concerns during SQL design and update workflows.
5. Managing mixed paths and plotting behavior across notebook runs.

## Outputs
1. Visual analytics in `notebooks/scripts/outputs/`
2. SQL ready CSV files in `notebooks/scripts/sql/`
3. Tableau ready CSV files and workbook in `notebooks/scripts/tableau/`

## Tableau links
1. Story  
https://public.tableau.com/shared/HWYCJNB45?:display_count=n&:origin=viz_share_link
2. Dashboard  
https://public.tableau.com/shared/S2NT7BRN3?:display_count=n&:origin=viz_share_link

## summary
This is a practical analytics project that demonstrates end to end ownership.
1. Data ingestion and rigorous cleaning.
2. Customer and product intelligence modeling.
3. SQL ready data preparation and query driven reporting.
4. Tableau delivery for business communication.


