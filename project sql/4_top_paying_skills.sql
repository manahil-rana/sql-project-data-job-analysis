
-- What are top skills based on salary for 'Data Analyst' remote roles?

SELECT
  skills,
  ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM 
  job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
  job_title_short = 'Data Analyst' AND
  job_location = 'Anywhere' AND
  salary_year_avg is NOT NULL
GROUP BY
  skills
ORDER BY
  avg_salary DESC
LIMIT 10;

/*
Breakdown of the results:
-> Big Data & AI Tools Lead: High-paying roles favor skills like PySpark, Watson, Datarobot, and Pandas—highlighting demand for scalable data processing and AI-driven analytics.
-> DevOps & Version Control Matter: Tools like Bitbucket, GitLab, and Jupyter show that data analysts who can collaborate and work in code-first environments earn more.
-> Cross-Disciplinary Skills Pay Off: Knowledge of Swift and Elasticsearch points to roles blending data analysis with app development or search/infra expertise.


[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  }
]

*/