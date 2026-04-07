-- Job Market Analysis using SQL

-- Total number of jobs
SELECT COUNT(*) AS total_jobs
FROM jobs;

-- City-wise job distribution
SELECT location, COUNT(*) AS job_count
FROM jobs
GROUP BY location
ORDER BY job_count DESC;

-- Average salary by job role
SELECT job_title, AVG(salary) AS avg_salary
FROM jobs
GROUP BY job_title;

-- Remote vs Onsite jobs count
SELECT remote, COUNT(*) AS total
FROM jobs
GROUP BY remote;

-- Jobs paying above average salary
SELECT *
FROM jobs
WHERE salary > (SELECT AVG(salary) FROM jobs);

-- Employees with duplicate salaries
SELECT *
FROM jobs
WHERE salary IN (
    SELECT salary
    FROM jobs
    GROUP BY salary
    HAVING COUNT(*) > 1
);

-- City with highest average salary
SELECT location, AVG(salary) AS avg_salary
FROM jobs
GROUP BY location
ORDER BY avg_salary DESC
LIMIT 1;

-- Top 3 highest paying jobs
SELECT job_title, salary
FROM (
    SELECT job_title, salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM jobs
) t
WHERE rnk <= 3;

-- Rank jobs within each role
SELECT job_title, salary,
       RANK() OVER (PARTITION BY job_title ORDER BY salary DESC) AS rank_in_role
FROM jobs;

-- Compare each salary with overall average
SELECT job_title, salary,
       AVG(salary) OVER () AS overall_avg,
       salary - AVG(salary) OVER () AS difference
FROM jobs;
