SELECT * FROM WORKING_LAYOFFS_2;

SELECT MAX(TOTAL_LAID_OFF),MAX(PERCENTAGE_LAID_OFF) FROM WORKING_LAYOFFS_2;

SELECT COMPANY,SUM(TOTAL_LAID_OFF) FROM WORKING_LAYOFFS_2
GROUP BY COMPANY ORDER BY 2 DESC;

SELECT INDUSTRY,SUM(TOTAL_LAID_OFF) FROM WORKING_LAYOFFS_2
GROUP BY INDUSTRY ORDER BY 2 DESC;

SELECT COUNTRY,SUM(TOTAL_LAID_OFF) FROM WORKING_LAYOFFS_2
GROUP BY COUNTRY ORDER BY 2 DESC;

SELECT MIN(DATE),MAX(DATE) FROM WORKING_LAYOFFS_2;

SELECT YEAR(DATE),SUM(TOTAL_LAID_OFF) FROM WORKING_LAYOFFS_2
GROUP BY YEAR(DATE) ORDER BY 2 DESC;

SELECT substring(DATE,1,7) AS MONTH,SUM(TOTAL_LAID_OFF) AS TOTAL_OFF  FROM WORKING_LAYOFFS_2 
WHERE substring(DATE,1,7) IS NOT NULL
GROUP BY MONTH	 ORDER BY 1 ;

WITH ROLLING_TOTAL AS (
SELECT substring(DATE,1,7) AS MONTH,SUM(TOTAL_LAID_OFF) AS TOTAL_OFF  FROM WORKING_LAYOFFS_2 
WHERE substring(DATE,1,7) IS NOT NULL
GROUP BY MONTH	 ORDER BY 1
)
SELECT MONTH,TOTAL_OFF,SUM(TOTAL_OFF) OVER(ORDER BY MONTH) AS TOTAL_ROLLING
FROM ROLLING_TOTAL;


SELECT COMPANY,YEAR(DATE),SUM(TOTAL_LAID_OFF) FROM WORKING_LAYOFFS_2
GROUP BY COMPANY,YEAR(DATE) ORDER BY 3 DESC;


WITH COMPANY_YEAR (COMPANY,YEARS,TOTAL_LAID_OFF)AS (
SELECT COMPANY,YEAR(DATE),SUM(TOTAL_LAID_OFF)  FROM WORKING_LAYOFFS_2
GROUP BY COMPANY,YEAR(DATE)
) , COMPANY_YEAR_RANK AS (
SELECT *,dense_rank() OVER(partition by YEARS ORDER BY TOTAL_LAID_OFF DESC)  AS RANKING
FROM COMPANY_YEAR WHERE YEARS IS NOT NULL
ORDER BY RANKING ASC)
SELECT * FROM COMPANY_YEAR_RANK
WHERE RANKING<=5 ORDER BY YEARS ;
