select * from clean_data;

-- 1. Count of Job Listings per Company
SELECT
  company,
  COUNT(*) AS total_job_listings
FROM clean_data
GROUP BY company
ORDER BY total_job_listings DESC;

-- 2. Average Salary Offered by Each Company
SELECT
  company,
  round(AVG(salary)) AS average_salary
FROM clean_data
GROUP BY company
ORDER BY average_salary DESC;

-- 3. Average Experience Required by Each Company
SELECT
  company,
  round(AVG(experience)) AS average_experience_required
FROM clean_data
GROUP BY company
ORDER BY average_experience_required DESC;

select * from jobs




