🏠 Real Estate Housing Market Analysis — Denmark

Analyzed 100K Danish property transactions (1992–2024) using Python, MySQL & Power BI. Covers EDA, 18 SQL business queries, and a 3-page interactive dashboard with pricing trends, regional insights & investment recommendations.


📁 Project Structure
real-estate-market-analysis-denmark/
│
├── data/
│   └── property_sales.csv          # Raw dataset
│
├── python/
│   └── housing_analysis.ipynb      # Data cleaning, EDA & feature engineering
│
├── sql/
│   └── property_sales_queries.sql  # 18 business SQL queries
│
├── dashboard/
│   └── Real_Estate_Dashboard.pbix  # Power BI dashboard file
│
├── report/
│   └── Real_Estate_Report.docx     # Full project report
│
└── README.md

🛠️ Tech Stack
ToolPurposePython (Pandas, Matplotlib, Seaborn)Data cleaning, EDA, feature engineeringMySQL + SQLAlchemyBusiness SQL analysis & data exportPower BIInteractive 3-page dashboard

📊 Dataset

Source: Danish residential property transactions
Size: 100,000 rows × 19 columns
Period: 1992 – 2024
Key columns: purchase_price, sqm_price, house_type, city, region, build_era, nom_interest_rate%, dk_ann_infl_rate%


🔄 Project Pipeline
Business Problem → Python EDA → SQL Analysis → Power BI Dashboard → Project Report

🐍 Python — Data Cleaning & EDA

Standardized inconsistent date formats
Imputed missing values in inflation & mortgage yield columns using quarterly median
Engineered 7 new features: price_segment, build_era, sales_season, offer_price, negotiation_gap, real_interest_rate, distressed_sale
Analyzed price distributions, house type breakdown, regional performance, build era trends, and negotiation behavior


🗄️ SQL — Business Analysis (18 Queries)
ThemeQueriesGeographic & PricingTop 10 cities, avg SQM by region, largest villasTemporal TrendsQuarterly price trends, peak volume quartersProperty CharacteristicsRoom count vs price, build era × house typeMacro IndicatorsInterest rate & inflation vs property pricesNegotiation AnalysisRegional gaps, price segment discountsInvestment ScreeningYOY growth ranking, 20%+ premium properties, best value type
Advanced SQL used: WINDOW FUNCTIONS, LEAD(), OVER PARTITION BY, CTEs, CASE, Subqueries

📈 Power BI Dashboard
3-page interactive dashboard with slicers for Year, City, Region, and House Type:

Page 1 — Market Overview: KPIs, price trend (1992–2024), regional volume, top 10 cities
Page 2 — Property Deep Dive: House type comparison matrix, SQM by era, rooms-to-price relationship
Page 3 — Market & Macro: Real interest rate vs price, negotiation by region, distressed sales, seasonal patterns


🔍 Key Findings

Danish avg property price grew ~240% over 32 years (DKK 820K → 2.8M)
Villas dominate at 54.2% of all transactions
Apartments command the highest SQM price (DKK 25,437/m²) — urban location premium
North Zealand cities (Rungsted Kyst, Klampenborg) average DKK 5.8–6.1M
Modern-era properties are 50%+ more expensive per m² than 70s builds
Real interest rate is the strongest macro driver of price cycles
2021 Q1 was peak activity — 2,263 transactions, DKK 5.9Bn total
64% of all transactions have zero negotiation gap
Auction properties trade at a 25% discount to regular sales
Aarhus C shows 12–17% YOY growth — top secondary market


💡 Business Recommendations

Prioritize Zealand for core investment — lowest distress rate (2.10%), highest liquidity
Target Aarhus C & Aalborg for growth-oriented plays
Use auction pipeline as a systematic 25% discount entry strategy
Monitor real interest rate as the #1 market timing signal
Use SQM price (not total price) as primary valuation comparator


🚀 How to Run
Python (Jupyter Notebook):
bashpip install pandas matplotlib seaborn sqlalchemy
jupyter notebook python/housing_analysis.ipynb
SQL:
bash# Import dataset into MySQL, then run:
mysql -u root -p your_database < sql/property_sales_queries.sql
Power BI:

Open dashboard/Real_Estate_Dashboard.pbix in Power BI Desktop
