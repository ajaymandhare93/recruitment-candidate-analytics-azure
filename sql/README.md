# SQL Documentation

This folder contains the SQL scripts used in the Recruitment Candidate Analytics Azure Data Engineering project.

## 📂 SQL Files

### `source_tables.sql`

Contains the source database table definitions and SQL structure used for the recruitment data stored in MySQL.

### `transformation_queries.sql`

Contains SQL transformation and preparation queries used during the data engineering process.

### `synapse_views.sql`

Contains Azure Synapse Serverless SQL views created on top of the curated recruitment data.

Key analytics views include:

* `vw_candidate_applications`
* `vw_application_summary`

## 🔄 SQL Data Flow

```text
MySQL RecruitmentDB
        |
        v
Source Tables
        |
        v
Data Transformation
        |
        v
ADLS Gen2 Curated Data
        |
        v
Synapse Serverless SQL
        |
        v
Analytics Views
```

## 🎯 Purpose

The SQL scripts provide the database structure, transformation logic, and analytics layer required for the recruitment candidate analytics solution.

They support analysis of:

* Candidate applications
* Application status
* Interview progression
* Selection outcomes
* Rejection outcomes
* Recruitment application summary

