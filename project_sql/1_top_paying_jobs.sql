/*
-Identifying top 10 hightest paying data scientist roles that are available remotly.
*/
 select  
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM
     job_postings_fact JOIN company_dim ON
     job_postings_fact.company_id=company_dim.company_id
WHERE
     job_title_short='Data Scientist'
     and job_location='Anywhere' AND
     salary_year_avg is NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

