-- Recruitment Candidate Analytics
-- Synapse Serverless SQL Views
-- Database: RecruitmentDB

USE RecruitmentDB;

-- =========================================================
-- View 1: Candidate Application Details
-- =========================================================

CREATE OR ALTER VIEW vw_candidate_applications AS

SELECT
    c.candidate_id,
    c.first_name,
    c.last_name,
    c.email,
    f.application_id,
    f.job_id,
    f.application_status
FROM OPENROWSET(
    BULK 'https://recruitmentdatalake01.dfs.core.windows.net/curated/dim_candidate',
    FORMAT = 'DELTA'
) AS c
INNER JOIN OPENROWSET(
    BULK 'https://recruitmentdatalake01.dfs.core.windows.net/curated/fact_application',
    FORMAT = 'DELTA'
) AS f
    ON c.candidate_id = f.candidate_id;


-- =========================================================
-- View 2: Application Status Summary
-- =========================================================

CREATE OR ALTER VIEW vw_application_summary AS

SELECT
    application_status,
    COUNT(*) AS total_applications
FROM vw_candidate_applications
GROUP BY application_status;
