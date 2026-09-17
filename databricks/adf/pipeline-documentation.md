# Databricks Pipeline Documentation

## Overview

The Databricks layer is used to transform and prepare recruitment data stored in Azure Data Lake Storage Gen2.

The pipeline uses PySpark to process recruitment data and store the transformed datasets as Delta tables in the curated layer.

## Technology Used

- Azure Databricks
- PySpark
- Azure Data Lake Storage Gen2
- Delta Lake

## Data Flow

```text
MySQL RecruitmentDB
        |
        v
Azure Data Factory
        |
        v
ADLS Gen2 - Raw Layer
        |
        v
Databricks / PySpark
        |
        v
ADLS Gen2 - Curated Layer
        |
        +----------------------+
        |                      |
        v                      v
dim_candidate          fact_application
        |                      |
        +----------+-----------+
                   |
                   v
        Synapse Serverless SQL
                   |
                   v
                Power BI
