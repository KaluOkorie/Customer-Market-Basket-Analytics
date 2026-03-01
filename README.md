# Customer and Market Basket Analytics

## Project overview
This project analyzes online retail transactions to understand customer behavior and product purchase patterns. It combines RFM based customer segmentation with market basket analytics to generate clear actions for marketing and sales teams.

## Business problem solved
Many retail teams can track revenue but cannot quickly answer three core questions.
1. Which customers are most valuable and should be retained with premium campaigns.
2. Which customers are becoming inactive and need reactivation offers.
3. Which products are frequently bought together and can be bundled to increase average order value.

This project solves those gaps through customer segmentation, association rules, and revenue trend analysis across products, countries, and time.

## Data source
1. UCI Online Retail Dataset
2. https://archive.ics.uci.edu/ml/datasets/Online+Retail

## Tech stack
1. Python
2. scikit learn
3. mlxtend
4. SQL
5. Jupyter Notebook
6. K means clustering

## Workflow
1. Download and load transaction data.
2. Clean data for cancellations, missing IDs, invalid quantity, and invalid prices.
3. Build `TotalPrice` and treat extreme values with percentile capping.
4. Run exploratory analysis and time trend analysis.
5. Build RFM scores and customer segments.
6. Run market basket analysis using FP Growth and association rules.
7. Apply K means clustering on scaled RFM features.

## Repository structure
1. `data/` contains source files.
2. `notebooks/Main.ipynb` contains the complete workflow.
3. `outputs/` contains exported charts.
4. `NOTEBOOK_REVIEW.md` contains cell by cell rating and improvements.

## How to run
1. Install dependencies from the root `requirements.txt`.
2. Open `notebooks/Main.ipynb`.
3. Run cells in sequence from top to bottom.
4. Review generated outputs in the `outputs/` folder.

## summary
This project demonstrates end to end analytics ownership from raw data to business ready recommendations. It highlights data cleaning discipline, practical feature engineering, customer segmentation, association rule mining, and decision focused storytelling.
