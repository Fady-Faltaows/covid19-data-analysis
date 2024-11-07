select *
from CovidDeaths
order by 1,2

select location, date, total_cases, new_cases, total_deaths, population
from CovidDeaths
order by 1,2 

-- Totla cases vs totla deaths
-- Shows likelihood of dying if you coract cobid in you country
select location, date, total_cases, total_deaths, (CAST(total_deaths AS FLOAT) / total_cases) * 100 AS DeathPercentage
from CovidDeaths
order by 1,2 

-- Looking at total cases vs population
-- shows what percentage of population got covid
select location, population, total_cases,  (CAST(total_cases AS FLOAT) / population) * 100 AS PercentPopulationInfected
from CovidDeaths
order by 1,2 

-- Looking at Countries with Highest Infection Rate compared to population
select location, population, Max(total_cases) as HighestInfectionCount , Max((CAST(total_cases AS FLOAT) / population)) * 100 AS PercentPopulationInfected
from CovidDeaths
Group by location, population
order by PercentPopulationInfected desc

-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population
select location,  Max(total_deaths) as TotalDeathCount 
from CovidDeaths
where continent is null
Group by location
order by TotalDeathCount desc


-- GLOBAL NUMBERS
select date, SUM(new_cases) as total_cases, sum(new_deaths) as total_deaths, (cast(sum(new_deaths) as float)/sum(new_cases)) * 100  as DeathPercentage
from CovidDeaths
where continent is not null
group by date
order by 1,2 


-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine
select D.continent, D.location, D.date, population, new_vaccinations
,sum(new_vaccinations) over (partition by d.location order by d.location, d.date) as RollingPeopleVaccinated
from CovidDeaths D
join CovidVaccinations V
	on D.location = V.location
	and D.date = V.date
	where d.continent is not null
order by  2, 3


-- Using CTE to perform Calculation on Partition By in previous query
With PopvsVac (continent, location, date, population, new_vaccinations , RollingPeopleVaccinated)
as 
(select D.continent, D.location, D.date, population, new_vaccinations
,sum(new_vaccinations) over (partition by d.location order by d.location, d.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
from CovidDeaths D
join CovidVaccinations V
	on D.location = V.location
	and D.date = V.date
where d.continent is not null
--order by  2, 3
)
Select *, (cast(RollingPeopleVaccinated as float)/Population)*100
From PopvsVac


-- Using Temp Table to perform Calculation on Partition By in previous query
DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)


insert into #PercentPopulationVaccinated
select D.continent, D.location, D.date, population, new_vaccinations
,sum(new_vaccinations) over (partition by d.location order by d.location, d.date) as RollingPeopleVaccinated
from CovidDeaths D
join CovidVaccinations V
	on D.location = V.location
	and D.date = V.date
--where d.continent is not null
--order by  2, 3

Select *, (cast(RollingPeopleVaccinated as float)/Population)*100
From #PercentPopulationVaccinated



-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as
select D.continent, D.location, D.date, population, new_vaccinations
,sum(new_vaccinations) over (partition by d.location order by d.location, d.date) as RollingPeopleVaccinated
from CovidDeaths D
join CovidVaccinations V
	on D.location = V.location
	and D.date = V.date
where d.continent is not null
