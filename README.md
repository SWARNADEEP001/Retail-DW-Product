# 🏬 Retail Sales Data Warehouse Project  
### 📌 SAP BW-inspired Architecture | MySQL | SQL ETL | Power BI Dashboard

---

## 🚀 Overview

This project demonstrates a full end-to-end **Data Warehouse and Business Intelligence solution** using:

- **MySQL** for data modeling and ETL  
- **Power BI** for reporting and visual analytics  
- **SAP BW/4HANA-inspired architecture** for structure and methodology  

It simulates a **Retail business analytics system** where raw transactional data flows through staging → dimensional modeling → fact table → semantic layer → dashboard KPIs.

---

## 🧠 Architecture Summary

The design is aligned with principles used in enterprise BI platforms such as **SAP BW/4HANA**, including:

| SAP BW/4HANA Concept | Equivalent in This Project |
|----------------------|---------------------------|
| DataSource / ADSO Staging | `stg_sales` raw data table |
| InfoObjects | `dim_customer`, `dim_product`, `dim_store`, `dim_date` |
| ADSO (Fact Provider) | `fact_sales` |
| CompositeProvider / Semantic Layer | `vw_sales_enriched` |
| Reporting (BEx/ SAC) | Power BI Dashboard & SQL KPIs |

---

## 🛠️ Tech Stack

| Component | Technology |
|-----------|-----------|
| Database | **MySQL 8.0** |
| ETL | **SQL (LOAD DATA + transformation logic)** |
| Modeling | **Star Schema (Fact + Dimensions)** |
| Reporting | **Power BI (KPIs, charts, analytics)** |
| Tools Used | VS Code, GitHub |

---

### 🔧 Schema Design (Star Model)

       dim_customer
            │
            │
dim_product ─ fact_sales ─ dim_store
│
│
dim_date

---

## 📂 Project Structure

Retail-DW-Product/
│
├── data/                         # CSV source data
├── sql/                          # ETL + schema scripts
│   ├── 01_create_schema.sql
│   ├── 02_create_tables.sql
│   ├── 03_load_data.sql
│   ├── 04_create_views.sql
│   └── 05_kpis.sql
│
├── docs/
│   ├── dashboard_preview.png      # BI visualization sample
│   └── retail_dw_dashboard_demo.mp4  # Walkthrough video
│
├── main.sql                      # Entry point to run full pipeline
└── README.md

---

## 📥 Data Flow

1. **CSV raw data imported → `stg_sales`**
2. Clean & transform data
3. Load into dimension tables
4. Load into **`fact_sales`**
5. Create **Semantic View:** `vw_sales_enriched`
6. Run analytical KPIs and reporting queries
7. Visualize in **Power BI**

---

## 📊 Sample KPIs (SQL)

| KPI | Result Type |
|------|-------------|
| Total Revenue | 💰 Scalar |
| Monthly Trend | 📈 Timeseries |
| Top Products | 🏆 Ranking |
| Revenue by Region | 📍 Geo-based |
| Customer Segment Analysis | 🧩 Category split |

---

## 🖥 Power BI Dashboard Preview

📌 *Built on top of the semantic layer (`vw_sales_enriched`).*

![Dashboard Preview](docs/dashboard_preview.png.png)

---

## 🎥 Demo Video

📎 Full Walkthrough:  
**Retail Sales Analytics Dashboard**

➡ `docs/retail_dw_dashboard_demo.mp4.mp4`

*(If GitHub preview doesn't autoplay, download to view.)*

---

## 🧪 How to Run

### 1️⃣ Clone Repository

```sh
git clone https://github.com/<username>/Retail-DW-Product.git
cd Retail-DW-Product

 ### 1️⃣ Run MySQL Scripts

mysql -u root -p < sql/01_create_schema.sql
mysql -u root -p retail_dw < sql/02_create_tables.sql
mysql --local-infile=1 -u root -p retail_dw < sql/03_load_data.sql
mysql -u root -p retail_dw < sql/04_create_views.sql
mysql -u root -p retail_dw < sql/05_kpis.sql

## In PowerBI:
### Connect to : 

Server: localhost
Database: retail_dw
Table/View: vw_sales_enriched

✨ Thank you for viewing this project! ✨

#DataEngineering  #SQL  #SAPBW  #PowerBI  #BusinessIntelligence  #ETL  #Analytics
