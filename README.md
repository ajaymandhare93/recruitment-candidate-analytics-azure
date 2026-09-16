# Recruitment Candidate Analytics | Azure Data Engineering

An end-to-end data engineering project that analyzes recruitment applications using Microsoft Azure, from source data ingestion to analytics and Power BI dashboard reporting.

## 📌 Project Overview

This project demonstrates a complete Azure Data Engineering pipeline for a recruitment analytics use case.

Candidate and application data is stored in MySQL, ingested through Azure Data Factory, stored in Azure Data Lake Storage Gen2, transformed using Azure Databricks and PySpark, queried through Azure Synapse Serverless SQL, and finally visualized in Power BI.

The project focuses on application status, candidate activity, interview progress, selection rate, and rejection rate.

## 🏗️ Architecture

```text
MySQL (RecruitmentDB)
        |
        v
Azure Data Factory
        |
        v
Azure Data Lake Storage Gen2
   Raw → Processed → Curated
        |
        v
Azure Databricks + PySpark
        |
        v
Delta Tables
        |
        v
Azure Synapse Serverless SQL
        |
        v
Power BI
        |
        v
Recruitment Analytics Dashboard
```

## 🛠️ Technologies Used

* MySQL
* Azure Data Factory
* Azure Data Lake Storage Gen2
* Azure Databricks
* PySpark
* Delta Lake
* Azure Synapse Serverless SQL
* Power BI
* GitHub

## 📂 Azure Resources

| Resource             | Name                             |
| -------------------- | -------------------------------- |
| Resource Group       | `Recruitment-DataEngineering-RG` |
| Storage Account      | `recruitmentdatalake01`          |
| Data Factory         | `recruitment-adf-01`             |
| ADF Pipeline         | `PL_MySQL_To_ADLS_Raw`           |
| Databricks Workspace | `adb-aw-project`                 |
| Access Connector     | `ac-adb-aw-project`              |
| MySQL Database       | `RecruitmentDB`                  |
| Synapse Database     | `RecruitmentDB`                  |

## 🔄 Data Engineering Pipeline

### 1. Source Database

Recruitment data is maintained in MySQL database `RecruitmentDB`.

The source database contains recruitment-related tables such as:

* Candidates
* Application
* Offers
* Other recruitment-related entities

### 2. Data Ingestion

Azure Data Factory is used to extract data from MySQL and load it into Azure Data Lake Storage Gen2.

Pipeline:

`PL_MySQL_To_ADLS_Raw`

Data is initially stored in the `raw` container.

### 3. Data Lake Layers

The ADLS Gen2 storage account contains three logical layers:

```text
raw
 |
 v
processed
 |
 v
curated
```

* **Raw** — source data
* **Processed** — transformed/cleaned data
* **Curated** — analytics-ready data

### 4. Data Transformation

Azure Databricks with PySpark is used for data transformation and preparation.

The transformed data is stored as Delta tables in the curated layer.

Example curated datasets include:

* `dim_candidate`
* `fact_application`

### 5. SQL Analytics Layer

Azure Synapse Serverless SQL is used to query the curated Delta data stored in ADLS Gen2.

Database:

`RecruitmentDB`

Analytics views include:

* `vw_candidate_applications`
* `vw_application_summary`

### 6. Power BI Dashboard

Power BI connects to the Synapse Serverless SQL layer and provides an interactive recruitment analytics dashboard.

Dashboard title:

**Recruitment Candidate Analytics | Application Insights**

## 📊 Dashboard Metrics

The dashboard currently contains:

| Metric                             | Value |
| ---------------------------------- | ----: |
| Total Applications                 |   100 |
| Total Candidates                   |    50 |
| Selected Candidates                |    10 |
| Rejected Candidates                |    23 |
| Interview Applications             |    22 |
| Conversion Rate                    |   10% |
| Rejection Rate                     |   23% |
| Interview Rate                     |   22% |
| Average Applications per Candidate |     2 |

## 📈 Dashboard Features

* Applications by Status
* Application Status Donut Chart
* Application Status Slicer
* Total Applications KPI
* Total Candidates KPI
* Selected Candidates KPI
* Rejected Candidates KPI
* Interview Applications KPI
* Conversion Rate
* Rejection Rate
* Interview Rate
* Average Applications per Candidate
* Key Recruitment Insights

## 🔍 Business Insights

The dashboard helps analyze:

* Overall application volume
* Candidate participation
* Interview progression
* Selection outcomes
* Rejection patterns
* Application-to-selection conversion
* Average applications submitted per candidate

## 🎯 Project Objectives

The main objectives of this project are:

1. Build an end-to-end Azure Data Engineering pipeline.
2. Ingest data from MySQL into Azure Data Lake.
3. Transform data using PySpark and Databricks.
4. Store analytics-ready data using Delta Lake.
5. Create a SQL analytics layer using Synapse Serverless SQL.
6. Connect the analytics layer to Power BI.
7. Build an interactive recruitment analytics dashboard.
8. Document the complete project workflow using GitHub.

## 📁 Planned Repository Structure

```text
recruitment-candidate-analytics-azure/
│
├── README.md
│
├── sql/
│   ├── source_tables.sql
│   ├── transformation_queries.sql
│   └── synapse_views.sql
│
├── databricks/
│   └── recruitment_pipeline.py
│
├── adf/
│   └── pipeline-documentation.md
│
├── synapse/
│   └── serverless-sql.md
│
├── powerbi/
│   └── dashboard-documentation.md
│
└── docs/
    └── architecture.md
```

## 🚀 End-to-End Workflow

```text
MySQL
  ↓
Azure Data Factory
  ↓
ADLS Gen2 - Raw
  ↓
ADLS Gen2 - Processed
  ↓
Azure Databricks / PySpark
  ↓
Delta Lake - Curated
  ↓
Azure Synapse Serverless SQL
  ↓
Power BI
  ↓
Recruitment Analytics
```

## 💡 Key Learning Outcomes

This project demonstrates practical experience with:

* ETL/ELT pipelines
* Azure Data Factory
* Data Lake architecture
* PySpark transformations
* Delta Lake
* Serverless SQL
* SQL analytics
* Power BI dashboard development
* Data modeling
* KPI development
* GitHub project documentation

## 👨‍💻 Project Status

**Current Status: Core project pipeline and Power BI dashboard completed.**

Next steps include repository documentation, project files organization, architecture documentation, and final project validation.

---

## 📌 Author

**Ajay Mandhare**

GitHub: [@ajaymandhare93](https://github.com/ajaymandhare93)
