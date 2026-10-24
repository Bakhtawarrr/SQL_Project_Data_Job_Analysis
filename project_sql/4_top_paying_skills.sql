select 
    skills,
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
     skills
order by 
    average_salary DESC
limit 25


/*
-----------------------------ANlYSIS----------------------
-Rare skills mean higher pay:
If you know something unusual like GDPR rules or blockchain coding (Solidity), companies will pay more because not many people have those skills.

-New tech skills are valuable:
learning modern languages like Golang, Rust, or Julia, and tools like OpenCV or Cassandra, can boost your salary since businesses want people who can handle the latest technology.

-Business and data tools still pay well:
 using platforms like Atlassian, MicroStrategy, or Looker shows you can organize work and make sense of data, which companies are happy to reward.




[
  {
    "skills": "gdpr",
    "average_salary": "217737.50"
  },
  {
    "skills": "golang",
    "average_salary": "208750.00"
  },
  {
    "skills": "atlassian",
    "average_salary": "189700.00"
  },
  {
    "skills": "selenium",
    "average_salary": "180000.00"
  },
  {
    "skills": "opencv",
    "average_salary": "172500.00"
  },
  {
    "skills": "neo4j",
    "average_salary": "171655.00"
  },
  {
    "skills": "microstrategy",
    "average_salary": "171146.58"
  },
  {
    "skills": "dynamodb",
    "average_salary": "169670.33"
  },
  {
    "skills": "php",
    "average_salary": "168125.00"
  },
  {
    "skills": "tidyverse",
    "average_salary": "165512.50"
  },
  {
    "skills": "solidity",
    "average_salary": "165000.00"
  },
  {
    "skills": "c",
    "average_salary": "164864.98"
  },
  {
    "skills": "go",
    "average_salary": "164691.09"
  },
  {
    "skills": "datarobot",
    "average_salary": "164500.00"
  },
  {
    "skills": "qlik",
    "average_salary": "164484.64"
  },
  {
    "skills": "redis",
    "average_salary": "162500.00"
  },
  {
    "skills": "watson",
    "average_salary": "161710.00"
  },
  {
    "skills": "rust",
    "average_salary": "161250.00"
  },
  {
    "skills": "elixir",
    "average_salary": "161250.00"
  },
  {
    "skills": "cassandra",
    "average_salary": "160850.00"
  },
  {
    "skills": "looker",
    "average_salary": "158714.91"
  },
  {
    "skills": "slack",
    "average_salary": "158333.33"
  },
  {
    "skills": "terminal",
    "average_salary": "157500.00"
  },
  {
    "skills": "airflow",
    "average_salary": "157414.13"
  },
  {
    "skills": "julia",
    "average_salary": "157243.80"
  }
]
*/