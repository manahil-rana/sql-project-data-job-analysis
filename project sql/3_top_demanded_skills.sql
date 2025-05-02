
-- What are the top 5 in-demand skills for 'Data Analyst' remote roles?

SELECT 
    skills,
    COUNT(job_postings_fact.job_id) as skills_demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
GROUP BY 
    skills
ORDER BY 
    skills_demand_count DESC
LIMIT 5;