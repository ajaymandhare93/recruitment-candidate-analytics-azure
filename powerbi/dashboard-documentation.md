# Power BI Dashboard Documentation

## Overview

Power BI is used as the visualization and reporting layer of the Recruitment Candidate Analytics project.

The dashboard connects to Azure Synapse Serverless SQL and uses the analytical views created on top of the curated Delta datasets.

## Data Source

**Platform:** Azure Synapse Serverless SQL

**Database:** `RecruitmentDB`

**Serverless SQL Endpoint:**

```text
recruitment-synapse-01-ondemand.sql.azuresynapse.net

MySQL RecruitmentDB
        |
        v
Azure Data Factory
        |
        v
ADLS Gen2 Raw
        |
        v
Databricks / PySpark
        |
        v
ADLS Gen2 Curated Delta
        |
        v
Synapse Serverless SQL
        |
        v
Power BI Dashboard


### Ab:

**Commit changes** → commit message:

```text
Add Power BI dashboard documentation
