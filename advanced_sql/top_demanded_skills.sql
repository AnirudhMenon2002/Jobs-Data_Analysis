/*
Finding most in-demand skills for data analysts
Tasks:
-Join job postings to inner join table 
-Identify top 5 in-demand skills for a data analyst
-Objective: Gaining insight into the most demanded skills in the market
*/

SELECT skills,
        COUNT(skills_job_dim.job_id) AS demand 
        FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id 
INNER JOIN skills_dim ON  skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_title_short='Data Analyst' AND job_country='India'
GROUP BY skills 
ORDER BY demand DESC
LIMIT 5;