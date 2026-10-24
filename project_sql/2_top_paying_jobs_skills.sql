/*
-top  highest paying data scientist jobs and their skills
-added string_agg() function for neat look and no repetition of rows


-----------------------ANALYSIS----------------------------------------
-Out of the top 10 roles, only 7 had skills recorded. The other 3 lacked skill data, which suggests either missing entries in the dataset or employers not specifying required skills.
-Python is practically everywhere, proving it’s the KEY skill of modern data science
-SQL shows up again and again, especially in the very top-paying jobs, making it a must-have skill.
-Cloud platforms (AWS, GCP, Azure) are tied to senior and leadership positions.
-Machine learning frameworks (TensorFlow, PyTorch, Keras, Scikit-learn) show up in director and distinguished scientist roles.
*/
with top_paying_jobs as(
select  
    job_id,
    job_title,
    salary_year_avg,
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
LIMIT 10
 )

 SELECT DISTINCT
     t.job_id,
     t.job_title,
     t.salary_year_avg,
     t.company_name,
     string_agg(s.skills,', ') as skills
 from 
     top_paying_jobs t JOIN skills_job_dim sj
     on t.job_id=sj.job_id JOIN skills_dim s
     on sj.skill_id=s.skill_id
GROUP BY
     t.job_id,
     t.job_title,
     t.salary_year_avg,
     t.company_name

ORDER BY
     t.salary_year_avg DESC  
LIMIT 10 





/*   json file

[
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "salary_year_avg": "550000.0",
    "company_name": "Selby Jennings",
    "skills": "sql, python"
  },
  {
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "salary_year_avg": "525000.0",
    "company_name": "Selby Jennings",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "java, cassandra, spark, hadoop, tableau, sql, python"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "datarobot, azure, aws, tensorflow, keras, pytorch, scikit-learn"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Storm5",
    "skills": "sql, gcp, aws, c, java, python"
  },
  {
    "job_id": 129924,
    "job_title": "Director of Data Science",
    "salary_year_avg": "300000.0",
    "company_name": "Storm4",
    "skills": "numpy, python, pandas"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "company_name": "Walmart",
    "skills": "tensorflow, spark, java, scala, kubernetes, pytorch"
  }
]*/