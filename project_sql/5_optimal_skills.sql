select 
    s.skill_id,
    s.skills,
    count(sj.job_id) as demand_count,
    round(avg(salary_year_avg),2) as average_salary
from 
     job_postings_fact j JOIN skills_job_dim sj
     on j.job_id=sj.job_id JOIN skills_dim s
     on sj.skill_id=s.skill_id
WHERE
    job_title_short='Data Scientist' AND
    salary_year_avg IS NOT NULL AND
    job_location='Anywhere'
GROUP BY
    s.skill_id
Having 
    count(sj.job_id)>10
ORDER BY
    demand_count DESC,
    average_salary DESC