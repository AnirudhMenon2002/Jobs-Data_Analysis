/*
Skills required for top paying Data Engineer Jobs
Tasks:
-Making use of the queries to find top paying jobs
-Adding specific skills required for these roles
-Helps understand what skills to learn in order to find jobs
*/

--CTE
WITH top_jobs AS(
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name as company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON
                job_postings_fact.company_id=company_dim.company_id
    WHERE job_title_short='Data Engineer' AND
        job_location='Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC 
    LIMIT 10
)
SELECT top_jobs.*,skills 
FROM top_jobs
INNER JOIN skills_job_dim
ON top_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY salary_year_avg DESC;

