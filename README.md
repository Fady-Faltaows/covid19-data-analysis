# COVID-19 Data Analysis Project

This project analyzes COVID-19 data using SQL to provide insights into death rates, infection rates, and vaccination rates across different countries and continents.

## Project Files
- `covid_analysis_queries.sql`: Contains SQL queries used to extract insights from the COVID-19 dataset.
- `CovidDeaths.csv`: Dataset of COVID-19 death statistics, including total cases, deaths, and population data.
- `CovidVaccinations.csv`: Dataset of COVID-19 vaccination records, including total vaccinations and people fully vaccinated.

## Project Overview

This analysis aims to understand the global spread and impact of COVID-19, focusing on:
- Death rate among infected individuals
- Infection rates as a percentage of the population
- Vaccination rates and progress across countries

## Datasets

The project uses two main datasets:

1. **COVID-19 Deaths Dataset**  
   Contains COVID-19 statistics related to deaths, cases, and populations, structured as follows:
   - `location`: Name of the country or region.
   - `date`: Date of the data entry.
   - `total_cases`: Total confirmed cases of COVID-19.
   - `new_cases`: Newly reported cases of COVID-19.
   - `total_deaths`: Total number of deaths due to COVID-19.
   - `new_deaths`: Newly reported deaths due to COVID-19.
   - `population`: Population of the country or region.
   - `continent`: Continent of the location (can be null).

2. **COVID-19 Vaccinations Dataset**  
   Contains COVID-19 vaccination statistics, structured as follows:
   - `location`: Name of the country or region.
   - `date`: Date of the vaccination data entry.
   - `total_vaccinations`: Total number of vaccinations administered.
   - `new_vaccinations`: Newly administered vaccinations.
   - `people_vaccinated`: Number of people who have received at least one dose of the vaccine.
   - `people_fully_vaccinated`: Number of people who are fully vaccinated (received all required doses).

## Database Structure

The project includes two main tables:
- **CovidDeaths**: Stores data on COVID-19 cases, deaths, and population by location and date.
- **CovidVaccinations**: Stores data on COVID-19 vaccination metrics, such as total and new vaccinations, by location and date.

## Key Objectives

1. Calculate COVID-19 infection and death rates globally and by location.
2. Track vaccination rates as a percentage of the population.
3. Identify trends and insights related to COVID-19's spread and control efforts.

## Insights and Key Queries

Here are some key queries that provide insights from the data:

1. **Death Rate per COVID-19 Case**  
   Shows the percentage of deaths among confirmed COVID-19 cases in each location.

2. **Infection Rate as Percentage of Population**  
   Analyzes the infection rate as a percentage of the population in different countries.

3. **Vaccination Progress**  
   Tracks the percentage of the population vaccinated over time, showing cumulative vaccinations for each country.

4. **Countries with Highest Infection Rates**  
   Identifies countries with the highest COVID-19 infection rate relative to their populations.

5. **Global Daily Case and Death Totals**  
   Summarizes global daily COVID-19 cases and deaths and calculates the global death rate.

6. **Percentage of Population Vaccinated**  
   Calculates the percentage of the population vaccinated in each location, based on the total vaccinations.

## Usage

To use this project:
1. Clone the repository: `git clone https://github.com/yourusername/covid19-data-analysis.git`
2. Open `covid_analysis_queries.sql` to review and run SQL queries on the datasets.
3. Set up the SQL database and import the datasets into the `CovidDeaths` and `CovidVaccinations` tables.
4. Execute the SQL queries to analyze the data and generate insights.

## Requirements
- SQL Server or compatible database for running queries.
- A tool for loading CSV files (e.g., SQL Server Management Studio or similar).

## Conclusion

This project provides valuable insights into the global and regional impacts of COVID-19 by analyzing infection, death, and vaccination data. The queries and findings can help inform public health decisions and guide further research.

