
-- Recruitment Candidate Analytics
-- Transformation & Validation Queries
-- Database: RecruitmentDB
-- Purpose: Validate curated Delta data and generate recruitment analytics


USE RecruitmentDB;


-- =========================================================
-- 1. Validate Candidate Data
-- =========================================================

SELECT *
FROM OPENROWSET(
    BULK 'https://recruitmentdatalake01.dfs.core.windows.net/curated/dim_candidate',
    FORMAT = 'DELTA'
) AS candidate_data;


-- =========================================================
-- 2. Validate Application Data
-- =========================================================

SELECT *
FROM OPENROWSET(
    BULK 'https://recruitmentdatalake01.dfs.core.windows.net/curated/fact_application',
    FORMAT = 'DELTA'
) AS application_data;


-- =========================================================
-- 3. Application Count by Status
-- =========================================================

SELECT
    application_status,
    COUNT(*) AS total_applications
FROM OPENROWSET(
    BULK 'https://recruitmentdatalake01.dfs.core.windows.net/curated/fact_application',
    FORMAT = 'DELTA'
) AS application_data
GROUP BY application_status
ORDER BY total_applications DESC;


-- =========================================================
-- 4. Candidate Application Count
-- =========================================================

SELECT
    candidate_id,
    COUNT(*) AS total_applications
FROM OPENROWSET(
    BULK 'https://recruitmentdatalake01.dfs.core.windows.net/curated/fact_application',
    FORMAT = 'DELTA'
) AS application_data
GROUP BY candidate_id
ORDER BY total_applications DESC;


-- =========================================================
-- 5. Validate Total Application Records
-- =========================================================

SELECT
    COUNT(*) AS total_application_records
FROM OPENROWSET(
    BULK 'https://recruitmentdatalake01.dfs.core.windows.net/curated/fact_application',
    FORMAT = 'DELTA'
) AS application_data;
