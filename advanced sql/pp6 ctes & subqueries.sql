
-- option 1

WITH 
    remote_jobs AS (
    SELECT
        job_id
    FROM 
        job_postings_fact
    WHERE 
        job_work_from_home is TRUE
),

    skill_id_jobs AS (
    SELECT 
        sk.skill_id,
        COUNT(r.job_id) AS jobs_per_skill
    FROM 
        skills_job_dim AS sk
    INNER JOIN
        remote_jobs AS r
    ON
        r.job_id = sk.job_id
    WHERE 
        r.job_id IS NOT NULL
    GROUP BY 
        sk.skill_id
)

SELECT
    si.skill_id,
    s.skills AS skill_name,
    si.jobs_per_skill
FROM
    skills_dim AS s
INNER JOIN 
    skill_id_jobs AS si
ON 
    si.skill_id = s.skill_id
ORDER BY 
    si.jobs_per_skill DESC
LIMIT
    5;



-- option 2 - more efficient and compact way

WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN 
        job_postings_fact AS job_postings 
    ON 
        job_postings.job_id = skills_to_job.job_id
    WHERE
        job_postings.job_work_from_home is TRUE
    GROUP BY
        skill_id
)

SELECT 
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM
    remote_job_skills
INNER JOIN
    skills_dim AS skills
ON
    skills.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;