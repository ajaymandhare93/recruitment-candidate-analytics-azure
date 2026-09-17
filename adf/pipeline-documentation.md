# Azure Data Factory Pipeline Documentation

## Overview

Azure Data Factory (ADF) is used as the data ingestion and orchestration layer in the Recruitment Candidate Analytics project.

The ADF pipeline extracts recruitment data from the MySQL source database and copies it into Azure Data Lake Storage Gen2.

## Azure Data Factory

**Data Factory:** `recruitment-adf-01`

**Pipeline:** `PL_MySQL_To_ADLS_Raw`

## Source

The source system is a MySQL database.

**Database:** `RecruitmentDB`

The recruitment database contains the source recruitment tables used by the analytics pipeline.

## Destination

The destination is Azure Data Lake Storage Gen2.

**Storage Account:** `recruitmentdatalake01`

The ingested data is stored in the **raw** container.

```text
ADLS Gen2
└── raw/
    ├── candidates/
    ├── application/
    ├── interview/
    ├── offers/
    └── other source data

MySQL RecruitmentDB
        |
        v
Azure Data Factory
        |
        |  PL_MySQL_To_ADLS_Raw
        v
ADLS Gen2
        |
        v
Raw Container

raw
 |
 v
processed
 |
 v
curated

MySQL
  |
  v
Azure Data Factory
  |
  v
ADLS Gen2 - Raw
  |
  v
Databricks / PySpark
  |
  v
ADLS Gen2 - Curated Delta
  |
  v
Synapse Serverless SQL
  |
  v
Power BI


### Ab commit karo

**Commit changes** → message:

```text
Add Azure Data Factory pipeline documentation


