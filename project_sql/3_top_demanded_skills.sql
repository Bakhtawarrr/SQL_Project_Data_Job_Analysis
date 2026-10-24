/*
-top 5 in demand skills for remote Data Scientist job.
-different from 2nd query as this focuses on  genral in_demand skills that a Data Scientist needs to get a job (specifically remotely)LOOKING AT EVERY JOB,
whereas 2nd query fouses on skils that top 10 paying Data Scientist role demanded
*/
select 
    skills,
    count(sj.job_id) as demand_count
from 
     job_postings_fact j JOIN skills_job_dim sj
     on j.job_id=sj.job_id JOIN skills_dim s
     on sj.skill_id=s.skill_id
WHERE
    job_title_short='Data Scientist' AND
    job_location='Anywhere'
GROUP BY
     skills
order by 
    demand_count DESC
limit 5