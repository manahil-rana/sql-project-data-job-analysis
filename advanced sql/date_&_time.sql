
-- PRACTICE PROBLEM 1

SELECT 
    job_schedule_type,
    ROUND(AVG(salary_year_avg), 4) AS avg_salary_yearly,
    ROUND(AVG(salary_hour_avg), 4) AS avg_salary_hourly
FROM 
    job_postings_fact
WHERE 
    job_posted_date::DATE > '2023-06-01'
    AND (salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL)
GROUP BY
    job_schedule_type;
    

-- PRACTICE PROBLEM 2

SELECT 
    -- new york, america follows eastern daylight time (edt)
    --'EDT' is not a valid time zone name in many SQL engines (especially PostgreSQL). You should use 'America/New_York', which handles daylight saving properly.
    EXTRACT(MONTH FROM (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York')) AS month,
    COUNT(*) AS job_postings
FROM
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York')) = 2023
GROUP BY month
ORDER BY month;


-- PRACTICE PROBLEM 3

SELECT
    c.name AS company_name,
    COUNT(job_id)
FROM 
    job_postings_fact AS j
INNER JOIN 
    company_dim AS c
ON 
    j.company_id = c.company_id
WHERE 
    j.job_health_insurance is TRUE AND
    EXTRACT(YEAR FROM j.job_posted_date) = 2023 AND
    (EXTRACT(MONTH FROM j.job_posted_date)) BETWEEN 4 AND 6
GROUP BY
    c.name;