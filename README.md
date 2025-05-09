
Layoffs Data Cleaning and Analysis Project (SQL)

This project focuses on cleaning, transforming, and analyzing a dataset of tech industry layoffs using MySQL. The goal was to prepare the data for reliable analysis and generate business insights through advanced SQL techniques.



Project Overview

- Created a dedicated database to work with the layoff dataset.
- Made a copy of the raw data for safe editing and analysis.
- Performed systematic data cleaning and transformation.
- Conducted exploratory and summary analysis to extract key insights.



Data Cleaning and Preparation

Duplicate Handling
- Identified duplicate rows using a window function.
- Removed all redundant entries to ensure data integrity.

Standardization
- Cleaned text fields by trimming extra spaces.
- Standardized inconsistent values in columns like `Company`, `Industry`, and `Country`.
- Unified similar industry names and corrected punctuation issues.

Date Conversion
- Converted date entries from text format to proper SQL `DATE` format.
- Ensured the date column could be used for time-based analysis.

Null Value Treatment
- Replaced empty strings with proper `NULL` values.
- Filled missing industry data using matching company information from other rows.
- Removed records with incomplete critical information such as total and percentage laid off.



Data Analysis Summary

- Analyzed total layoffs by company, industry, and country to find top contributors.
- Tracked layoffs over time by year and by month.
- Created a rolling total of monthly layoffs to observe trends.
- Identified the top 5 companies with the most layoffs each year using ranking techniques.

---

SQL Concepts Applied

- Common Table Expressions (CTEs) for organized query structuring.
- Window functions for identifying duplicates and ranking data.
- String and date functions for formatting and cleaning.
- Aggregate functions and grouping for summary insights.
- Data joins to enrich incomplete records.

---

Key Outcomes

- Built a clean and reliable dataset for analysis from raw layoff data.
- Derived insights that highlight layoff trends across industries, locations, and time periods.
- Gained hands-on experience in end-to-end SQL data wrangling and reporting.

