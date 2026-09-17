# Azure Synapse Serverless SQL Documentation

## Overview

Azure Synapse Serverless SQL is used as the analytical SQL layer in the Recruitment Candidate Analytics project.

It reads curated Delta datasets from Azure Data Lake Storage Gen2 and exposes SQL views that are consumed by Power BI.

## Synapse Configuration

**Synapse SQL Server:**

```text
recruitment-synapse-01

recruitment-synapse-01-ondemand.sql.azuresynapse.net

RecruitmentDB

https://recruitmentdatalake01.dfs.core.windows.net/curated/dim_candidate

https://recruitmentdatalake01.dfs.core.windows.net/curated/fact_application

SELECT *
FROM OPENROWSET(
    BULK 'https://recruitmentdatalake01.dfs.core.windows.net/curated/dim_candidate',
    FORMAT = 'DELTA'
) AS rows;

SELECT *
FROM vw_application_summary;

ADLS Gen2 Curated Delta
          |
          v
Synapse Serverless SQL
          |
          +-------------------------+
          |                         |
          v                         v
vw_candidate_applications    vw_application_summary
          |                         |
          +------------+------------+
                       |
                       v
                  Power BI


### Commit message

Neeche **Commit changes** karo.

Commit message:

```text
Add Synapse Serverless SQL documentation


