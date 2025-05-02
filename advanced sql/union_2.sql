
WITH q1_job_postings AS (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
)

SELECT 
    job_title_short, 
    job_location, 
    job_via, 
    job_posted_date::DATE,
    salary_year_avg
FROM q1_job_postings
WHERE salary_year_avg > 70000 AND job_title_short = 'Business Analyst'
ORDER BY salary_year_avg DESC