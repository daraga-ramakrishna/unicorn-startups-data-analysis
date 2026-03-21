-- Database & sanity check
CREATE DATABASE unicorn_db;
USE unicorn_db;
SELECT*FROM unicorn_companies LIMIT 10;

-- 1. How many unicorn companies are in the dataset?
SELECT COUNT(*) AS total_unicorn_companies
FROM unicorn_companies;

-- 2. Which continents have the most unicorn companies?
SELECT 
    continent,
    COUNT(*) AS unicorn_count
FROM unicorn_companies
GROUP BY continent
ORDER BY unicorn_count DESC;

-- 3. Which countries have the highest number of unicorn companies?
SELECT 
    country,
    COUNT(*) AS unicorn_count
FROM unicorn_companies
GROUP BY country
ORDER BY unicorn_count DESC
LIMIT 10;

-- 4. What are the top 10 most valuable unicorn companies?
SELECT 
    company,
    valuation
FROM unicorn_companies
ORDER BY valuation DESC
LIMIT 10;

-- 5. Which companies raised the most funding?
SELECT 
    company,
    funding
FROM unicorn_companies
ORDER BY funding DESC
LIMIT 10;

-- 6. Which companies are the most capital efficient?
SELECT 
    company,
    efficiency
FROM unicorn_companies
WHERE efficiency IS NOT NULL
ORDER BY efficiency DESC
LIMIT 10;

-- 7. Rank unicorn companies by valuation
SELECT
    company,
    valuation,
    RANK() OVER (ORDER BY valuation DESC) AS valuation_rank
FROM unicorn_companies;

-- 8. Find the most valuable company in each continent
SELECT *
FROM (
    SELECT
        company,
        continent,
        valuation,
        RANK() OVER (PARTITION BY continent ORDER BY valuation DESC) AS rnk
    FROM unicorn_companies
) ranked
WHERE rnk = 1;

-- 9. Efficiency by continent
SELECT 
    continent,
    AVG(efficiency) AS avg_efficiency
FROM unicorn_companies
GROUP BY continent
ORDER BY avg_efficiency DESC;