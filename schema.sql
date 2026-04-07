-- Job Analysis using SQL
-- Database: MySQL
-- Table used: jobs

CREATE TABLE jobs (
    job_id INT,
    title VARCHAR(100),
    location VARCHAR(100),
    pay_period VARCHAR(20),
    min_salary INT,
    max_salary INT,
    work_type VARCHAR(30),
    remote_allowed BOOLEAN
);
