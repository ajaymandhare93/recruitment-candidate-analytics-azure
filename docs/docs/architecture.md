# Recruitment Candidate Analytics - Architecture

## 1. Project Overview

The Recruitment Candidate Analytics project is an end-to-end Azure Data Engineering solution designed to process recruitment data from a MySQL source database and provide analytics through Power BI.

The project uses Azure Data Factory for data ingestion, Azure Data Lake Storage Gen2 for data storage, Azure Databricks for PySpark-based data transformation, Azure Synapse Serverless SQL for analytics, and Power BI for dashboard visualization.

---

## 2. End-to-End Architecture

```text
MySQL RecruitmentDB
        |
        | Azure Data Factory
        v
Azure Data Lake Storage Gen2
        |
        +-------------------+
        |                   |
       Raw             Processed
        |                   |
        +---------+---------+
                  |
                  v
          Azure Databricks
             PySpark
                  |
                  v
        Curated Delta Tables
        |                |
        |                |
 dim_candidate    fact_application
        |                |
        +--------+-------+
                 |
                 v
     Azure Synapse Serverless SQL
                 |
                 v
       RecruitmentDB Views
        |              |
        |              |
vw_candidate_applications
vw_application_summary
        |
        v
      Power BI
        |
        v
 Recruitment Analytics Dashboard


### Ab kya karna hai

1. `architecture.md` me **Edit ✏️** karo.
2. Upar wala पूरा content paste karo.
3. Neeche **Commit changes** karo.
4. Commit message:

```text
Add project architecture documentation


