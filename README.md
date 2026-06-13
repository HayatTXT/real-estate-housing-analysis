# 🏠 Real Estate Housing Market Analysis — Denmark

> Analyzed 100K Danish property transactions (1992–2024) using Python, MySQL & Power BI. Covers EDA, 18 SQL business queries, and a 3-page interactive dashboard with pricing trends, regional insights & investment recommendations.

---

## 📁 Project Structure

```
real-estate-market-analysis-denmark/
│
├── data/
│   └── Housing Data Raw.csv              # Raw dataset
│   └── property_sales cleaned.csv        # Cleaned dataset
│
├── python/
│   └── housing analysis python.ipynb          # Data cleaning, EDA & feature engineering
│
├── sql/
│   └── Property_sales_sql.sql      # 18 business SQL queries
│
├── dashboard/
│   └── Real State Analysis.pbix      # Power BI dashboard file
│
├── report/
│   └── Real_Estate_Housing_Analysis_Report.pdf
│
├── Presentation/
│   └── Real_Estate_Analysis_PPT.pptx     # Report Summary PPT
│
└── README.md
```

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| Python (Pandas, Matplotlib, Seaborn) | Data cleaning, EDA, feature engineering |
| MySQL + SQLAlchemy | Business SQL analysis & data export |
| Power BI | Interactive 3-page dashboard |

---

## 📊 Dataset

- **Source:** Danish residential property transactions
- **Size:** 100,000 rows × 19 columns
- **Period:** 1992 – 2024
- **Key columns:** `purchase_price`, `sqm_price`, `house_type`, `city`, `region`, `year_build`, `nom_interest_rate%`, `dk_ann_infl_rate%`, `yield_on_mortgage_credit_bonds%`

---

## 🔄 Project Pipeline

```
Business Problem → Python EDA → SQL Analysis → Power BI Dashboard → Project Report
```

---

## 🐍 Python — Data Cleaning & EDA

- Standardized inconsistent date formats (`MM/DD/YY` & `MM-DD-YY` → `DD/MM/YY`)
- Dropped 11 rows with missing `city` values (<0.02% of data)
- Imputed missing values in `dk_ann_infl_rate%` and `yield_on_mortgage_credit_bonds%` using quarterly median of the same year
- Exported cleaned dataset to MySQL via SQLAlchemy

**Feature Engineering — 7 new columns:**

| Feature | Description |
|---------|-------------|
| `price_segment` | Budget / Mid / Premium / Luxury / Ultra-Luxury |
| `build_era` | Pre-1900 / 1900s / Mid-century / 70s / 80-90s / 2000s / Modern |
| `sales_season` | Winter / Spring / Summer / Autumn |
| `offer_price` | Back-calculated from `purchase_price` + `%_change` |
| `negotiation_gap` | Absolute DKK difference between offer and purchase price |
| `real_interest_rate` | Nominal rate − Annual inflation rate |
| `distressed_sale` | Flag: `%_change` < −15% |

**EDA Covered:**
- Price & SQM price distributions (raw + log-transformed)
- House type breakdown, median pricing, and outlier analysis
- Regional performance and distressed sale rates
- Build era vs SQM price trends
- Buyer negotiation behavior by property type

---

## 🗄️ SQL — Business Analysis (18 Queries)

| Theme | Queries |
|-------|---------|
| Geographic & Pricing | Top 10 cities by avg price, avg SQM by region, largest villa city |
| Temporal Trends | Quarterly price trends, peak volume quarters |
| Property Characteristics | Room count vs price, build era × house type SQM price |
| Macro Indicators | Nominal & real interest rate vs prices, inflation regime analysis |
| Negotiation Analysis | Regional offer-to-purchase gap, negotiation by price segment |
| Investment Screening | YOY city growth ranking, 20%+ premium properties, best value house type |

**Advanced SQL used:** `WINDOW FUNCTIONS` · `LEAD()` · `OVER PARTITION BY` · `CTEs` · `CASE WHEN` · `Subqueries`

---

## 📈 Power BI Dashboard

3-page interactive dashboard with slicers for **Year**, **City**, **Region**, and **House Type**:

**Page 1 — Market Overview**
- KPIs: Total transactions, total sales value, avg price, avg SQM, avg negotiation gap
- Price trend line (1992–2024)
- Regional transaction volume
- Top 10 cities by average price

**Page 2 — Property Deep Dive**
- House type comparison matrix (avg price, SQM price, room count)
- Avg price by price segment across house types
- Rooms-to-price relationship
- SQM price by build era

**Page 3 — Market & Macro**
- Real interest rate vs avg price over time
- Negotiation gap by region
- Distressed sales trend
- Seasonal price & volume patterns
- Sale type analysis (regular vs auction vs family sale)
- Mortgage bond yield trend

---

## 🔍 Key Findings

1. Danish avg property price grew **~240%** over 32 years (DKK 820K → 2.8M)
2. **Villas** dominate the market at 54.2% of all transactions
3. **Apartments** command the highest SQM price (DKK 25,437/m²) — urban location premium
4. **North Zealand** cities (Rungsted Kyst, Klampenborg, Nordhavn) average DKK 5.8–6.1M
5. **Modern-era** properties are 50%+ more expensive per m² than 70s builds
6. **Real interest rate** is the strongest macro driver of property price cycles
7. **2021 Q1** was peak activity — 2,263 transactions totalling DKK 5.9Bn
8. **64%** of all transactions have zero negotiation gap — sellers hold firm on price
9. **Auction** properties trade at a consistent 25% discount vs regular sales (DKK 1.47M vs 1.97M)
10. **Aarhus C** shows 12–17% YOY growth in multiple years — strongest secondary market

---

## 💡 Business Recommendations

- Prioritize **Zealand** for core investment — lowest distressed sale rate (2.10%), highest liquidity
- Target **Aarhus C & Aalborg** for growth-oriented investment plays (12–17% YOY)
- Use **auction pipeline** as a systematic 25% discount entry strategy
- Favor **Modern & 2000s-era** properties for best SQM appreciation trajectory
- Monitor **real interest rate** as the #1 market timing signal — accelerate buys when rate < 0%
- Use **SQM price** (not total price) as the primary cross-property valuation comparator

---

## 🚀 How to Run

**Python:**
```bash
pip install pandas matplotlib seaborn sqlalchemy
jupyter notebook python/housing analysis python.ipynb
```

**SQL:**
```bash
# Import dataset into MySQL first, then run:
mysql -u root -p your_database < sql/Property_sales_sql.sql
```

**Power BI:**
```
Open dashboard/Real State Analysis.pbix in Power BI Desktop
```
