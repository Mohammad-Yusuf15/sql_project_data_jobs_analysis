SELECT
    count(job_id) as number_of_jobs,
    case
    when job_location = 'Anywhere' then 'Remote'
    when job_location = 'New York, NY' then 'Local'
    else 'onsite'
    end as location_category
    from job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    GROUP BY
    location_category;