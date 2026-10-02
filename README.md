# Layoffs Data Analysis using SQL

## Project Overview

This project focuses on cleaning and exploring a layoffs dataset using MySQL.

The project is divided into two main stages:

- Data Cleaning
- Exploratory Data Analysis (EDA)

The goal is to transform raw layoffs data into a clean dataset and extract useful insights using SQL.

---

## Tools & Technologies

- MySQL
- SQL
- GitHub

---

## Dataset

The dataset contains information about layoffs from companies around the world.

Main columns include:

- Company
- Location
- Industry
- Total Laid Off
- Percentage Laid Off
- Date
- Stage
- Country
- Funds Raised (Millions)

---

## Data Cleaning

The following cleaning steps were performed:

### 1. Remove Duplicates

Used `ROW_NUMBER()` with `PARTITION BY` to identify duplicate records.

### 2. Standardize Text Data

- Trimmed company names
- Standardized Crypto-related industries
- Standardized country names

### 3. Standardize Dates

Converted the date column from text format into SQL `DATE`.

### 4. Handle Missing Values

- Converted blank industry values to NULL
- Filled missing industry values using matching company records
- Removed rows where both total layoffs and percentage laid off were NULL

---

## Exploratory Data Analysis

Several SQL queries were used to explore the cleaned dataset.

### Analysis Performed

- Maximum number of layoffs
- Companies with 100% layoffs
- Total layoffs by company
- Total layoffs by year
- Total layoffs by funding stage
- Monthly layoffs
- Rolling total of layoffs
- Top 5 companies by layoffs for each year

---

## SQL Concepts Used

This project demonstrates:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `JOIN`
- `CTE`
- `ROW_NUMBER()`
- `DENSE_RANK()`
- Window Functions
- Aggregate Functions
- `SUM()`
- `MAX()`
- `MIN()`
- Date Functions
- String Functions
- Data Cleaning

---

## Project Structure

```text
layoffs-data-analysis-sql/
│
├── data/
│   └── layoffs.csv
│
├── sql/
│   ├── 01_data_cleaning.sql
│   └── 02_exploratory_analysis.sql
│
├── README.md
│
└── .gitignore
