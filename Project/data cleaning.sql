select * from data;

-- Cleaning Experience
SELECT
  CAST((CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(experience, '-', 1), ' ', 1) AS UNSIGNED) + 
        CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(experience, '-', -1), ' ', 1) AS UNSIGNED)) / 2 AS UNSIGNED) AS avg_experience
FROM data;


-- Cleaning Reviews
select SUBSTRING_INDEX(reviews," ",1)  as reviews from data;


-- Cleaning Salary
SELECT
  CAST((CAST(REGEXP_SUBSTR(salary, '\\d+') AS UNSIGNED) +
        CASE 
          WHEN REGEXP_SUBSTR(salary, '\\d+', 1, 2) IS NOT NULL THEN
            CAST(REGEXP_SUBSTR(salary, '\\d+', 1, 2) AS UNSIGNED)
          ELSE
            CAST(REGEXP_SUBSTR(salary, '\\d+') AS UNSIGNED)
        END) / 2 AS UNSIGNED) AS avg_salary
FROM data;


-- Saving cleaned data
CREATE TABLE clean_data AS
SELECT
  job_role,
  company,
  location,
  rating,
  resposibilities as responsibilities,
  job_link,   
  company_link,
  
  CAST((CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(experience, '-', 1), ' ', 1) AS UNSIGNED) + 
        CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(experience, '-', -1), ' ', 1) AS UNSIGNED)) / 2 AS UNSIGNED) AS experience,
  CAST(SUBSTRING_INDEX(reviews, " ", 1) AS UNSIGNED) AS reviews,
  CAST((CAST(REGEXP_SUBSTR(salary, '\\d+') AS UNSIGNED) +
        CASE 
          WHEN REGEXP_SUBSTR(salary, '\\d+', 1, 2) IS NOT NULL THEN
            CAST(REGEXP_SUBSTR(salary, '\\d+', 1, 2) AS UNSIGNED)
          ELSE
            CAST(REGEXP_SUBSTR(salary, '\\d+') AS UNSIGNED)
        END) / 2 AS UNSIGNED) AS salary
FROM data;
