/*
Tasks:
-To identify top 10 highest paying Data Analyst roles available remotely
-Focus on job postings with specified salaries.(no null values)
-Offering insights into top paying opportunties for Data Analysts
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date,
    salary_year_avg,
    name as company_name
FROM job_postings_fact
LEFT JOIN company_dim ON
            job_postings_fact.company_id=company_dim.company_id
WHERE job_title_short='Data Engineer' AND
      job_location='Anywhere' AND
      salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC 
LIMIT 10;


