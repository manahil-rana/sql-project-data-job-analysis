
-- option 1
WITH 
    skill_info AS (
        SELECT
            skills_job_dim.job_id AS job_id,
            skills_dim.skills AS skills,
            skills_dim.type AS types
        FROM
            skills_job_dim
        LEFT JOIN 
            skills_dim 
        ON
            skills_dim.skill_id = skills_job_dim.skill_id
)


SELECT 
    january_jobs.job_title_short,
    skill_info.skills,
    skill_info.types
FROM 
    january_jobs
LEFT JOIN
    skill_info
ON
    skill_info.job_id = january_jobs.job_id
WHERE 
    salary_year_avg > 70000

UNION ALL

SELECT 
    february_jobs.job_title_short,
    skill_info.skills,
    skill_info.types
FROM 
    february_jobs
LEFT JOIN
    skill_info
ON
    skill_info.job_id = february_jobs.job_id
WHERE 
    salary_year_avg > 70000

UNION ALL

SELECT 
    march_jobs.job_title_short,
    skill_info.skills,
    skill_info.types
FROM 
    march_jobs
LEFT JOIN
    skill_info
ON
    skill_info.job_id = march_jobs.job_id
WHERE 
    salary_year_avg > 70000;

-- ------------------------------------------------

-- option 2
WITH skill_info AS (
    SELECT
        skills_job_dim.job_id,
        skills_dim.skills,
        skills_dim.type AS types
    FROM skills_job_dim
    LEFT JOIN skills_dim 
        ON skills_dim.skill_id = skills_job_dim.skill_id
),
all_jobs_q1 AS (
    SELECT job_id, job_title_short, salary_year_avg FROM january_jobs
    UNION ALL
    SELECT job_id, job_title_short, salary_year_avg FROM february_jobs
    UNION ALL
    SELECT job_id, job_title_short, salary_year_avg FROM march_jobs
)
SELECT 
    all_jobs_q1.job_title_short,
    skill_info.skills,
    skill_info.types
FROM all_jobs_q1
LEFT JOIN skill_info
    ON skill_info.job_id = all_jobs_q1.job_id
WHERE all_jobs_q1.salary_year_avg > 70000;