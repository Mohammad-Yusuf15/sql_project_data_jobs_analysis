WITH remote_job_skills as (
    SELECT
        skill_id,
        count(*) as skill_count
    FROM
        skills_job_dim as skills_to_job
    INNER JOIN job_postings_fact as job_postings on job_postings.job_id = skills_to_job.job_id
    WHERE
        job_postings.job_work_from_home = TRUE AND
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
)
SELECT 
    skills.skill_id,
    skills as skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim as skills on skills.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;