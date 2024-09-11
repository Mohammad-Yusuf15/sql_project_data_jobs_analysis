SELECT
    job_title_short as title,
    job_location as location,
    job_posted_date::date as date,
    extract(month from job_posted_date) as date_month,
    extract(year from job_posted_date) as date_year
from
    job_postings_fact;
