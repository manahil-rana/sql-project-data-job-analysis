
-- PRACTICE PROBLEM 1

WITH skill_job_count AS (
    SELECT 
        skill_id,
        COUNT(job_id) AS jobs_per_skill
    FROM 
        skills_job_dim
    GROUP BY 
        skill_id
)

SELECT 
    skills AS skill_name,
    sk.jobs_per_skill
FROM 
    skills_dim AS s
INNER JOIN 
    skill_job_count AS sk
ON 
    sk.skill_id = s.skill_id
ORDER BY 
    sk.jobs_per_skill DESC
LIMIT 
    5;


-- PRACTICE PROBLEM 2

WITH company_job_count AS (
    SELECT 
        c.name AS company_name,
        COUNT(j.job_id) AS job_postings
    FROM 
        company_dim as c
    LEFT JOIN 
        job_postings_fact as j
    ON 
        j.company_id = c.company_id
    GROUP BY
        company_name, c.company_id
)

SELECT
    company_name,
    job_postings,
    CASE
        WHEN job_postings < 10 THEN 'Small'
        WHEN job_postings BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM 
    company_job_count
ORDER BY
    job_postings DESC;