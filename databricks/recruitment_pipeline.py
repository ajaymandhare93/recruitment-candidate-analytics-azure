# Recruitment Candidate Analytics
# Databricks PySpark Transformation Pipeline
# Output: Curated Delta Tables

from pyspark.sql import functions as F


# =========================================================
# Configuration
# =========================================================

CURATED_PATH = "abfss://curated@recruitmentdatalake01.dfs.core.windows.net"

DIM_CANDIDATE_PATH = f"{CURATED_PATH}/dim_candidate"
FACT_APPLICATION_PATH = f"{CURATED_PATH}/fact_application"


# =========================================================
# Read Curated Candidate Data
# =========================================================

dim_candidate = (
    spark.read
    .format("delta")
    .load(DIM_CANDIDATE_PATH)
)


# =========================================================
# Candidate Data Transformation
# =========================================================

dim_candidate = (
    dim_candidate
    .select(
        "candidate_id",
        "first_name",
        "last_name",
        "email"
    )
    .dropDuplicates(["candidate_id"])
)


# =========================================================
# Write Candidate Dimension
# =========================================================

(
    dim_candidate.write
    .format("delta")
    .mode("overwrite")
    .save(DIM_CANDIDATE_PATH)
)


# =========================================================
# Read Curated Application Data
# =========================================================

fact_application = (
    spark.read
    .format("delta")
    .load(FACT_APPLICATION_PATH)
)


# =========================================================
# Application Data Transformation
# =========================================================

fact_application = (
    fact_application
    .select(
        "candidate_id",
        "application_id",
        "job_id",
        "application_status"
    )
    .dropDuplicates(["application_id"])
)


# =========================================================
# Write Application Fact
# =========================================================

(
    fact_application.write
    .format("delta")
    .mode("overwrite")
    .save(FACT_APPLICATION_PATH)
)


# =========================================================
# Validation
# =========================================================

print("Candidate records:", dim_candidate.count())
print("Application records:", fact_application.count())

display(dim_candidate)
display(fact_application)
