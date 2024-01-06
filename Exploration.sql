--The data was imported from the csv files, each file was used to create an individual table. 

--declare @Country varchar(MAX);
--set @Country = 'Mexico';

--Looking at total cases vs total deaths (percentage)

--select location, date, total_cases TotalCases, total_deaths TotalDeaths, total_deaths * 100.0 / total_cases DeathRate from CovidDeaths 
--where total_cases is not NULL and total_deaths is not null and location = @Country order by location, date

--Looking at total cases vs total population (percentage). We use a CTE because where can't  use alias references. 

--WITH CTE AS (
--    SELECT
--        location,
--        date,
--        total_cases AS TotalCases,
--        total_cases * 100.0 / population AS InfectationRate
--    FROM
--        CovidDeaths
--		where total_cases is not null and total_deaths is not null and location = @Country
--)

--SELECT *
--FROM
--    CTE
--WHERE
--    InfectationRate > 0.01
--ORDER BY
--    location, date;

--Select countries with Highest Infection Rate compared to Population

--select location, max(total_cases) as TotalCases, population,  max(total_cases) * 100.0 / population as InfectionRate from CovidDeaths 
--group by location, population
--order by InfectionRate desc

--Select countries with highest death rate comparted to population

--select location,  max(total_deaths) as TotalDeaths, population, max(total_deaths) * 100.0 / population as DeathRate from CovidDeaths 
--where continent is not null --This is because the ones that don't have continents contain data from the entire continent (Asia, Oceania, Etc).
--group by location, population
--order by TotalDeaths desc

--Select the first date a country has registered vaccinations.

select location, min(date) firstDate, min(new_vaccinations) minVaccines from CovidVaccinations
where continent is not null and new_vaccinations > 0 group by location order by firstDate