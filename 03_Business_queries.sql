-- -----------------------------
-- BASIC SQL QUERIES
--  ----------------------------

-- Query 1: Total Employees
select count(*) as Total_Employees
from Employees;

-- Query 2: Gender Distribution
select Gender,
count(*) as Total_Employees
from Employees
group by Gender;

-- Query 3: Average Salary
select round(avg(Salary),2) as Average_Salary
from Employees;

-- Query 4: Top 10 Highest Paid Employees
select EmployeeID,FirstName,LastName,Salary
from Employees
order by Salary desc
limit 10;

-- Query 5: Employee Count by Department
select d.DepartmentName,
count(EmployeeID) as Employee_count
from Employees e
inner join Departments d
on d.DepartmentID=e.DepartmentID
group by d.DepartmentName
order by Employee_count desc;

-- Query 6: Employee Count by City
select c.CityName,
count(EmployeeID) as Employee_count
from Employees e
inner join Cities c
on c.CityID=e.CityID
group by c.CityName
order by Employee_count desc;

-- Query 7: Highest Salary in the Company
select max(Salary) as Highest_salary
from Employees;

-- Query 8: Lowest Salary in the Company
select min(Salary) as Lowest_salary
from Employees;

-- Query 9: Employees with More Than 10 years of Experience
select EmployeeID,FirstName,LastName,Experience
from Employees
where Experience>10
order by Experience desc;

-- Query 10: Employees Hired After 2022
select EmployeeID,FirstName,LastName,HireDate
from Employees
where HireDate>='2023-01-01'
order by HireDate;

-- Query 11: Employees Earning Above Average Salary
select EmployeeID,FirstName,LastName,Salary
from Employees
where Salary>(
select avg(Salary)
from Employees
)
order by Salary desc;

-- Query 12: Department with highest average salary
Select d.DepartmentName,
round(avg(Salary),2) as Highest_Average_Salary
from Employees e
inner join Departments d
on d.DepartmentID=e.DepartmentID
group by d.DepartmentName
order by Highest_Average_Salary desc
limit 1;

-- Query 13: Average salary by department
select d.DepartmentName,
round(avg(Salary),2) as Average_Salary
from Employees e 
inner join Departments d
on d.DepartmentID=e.DepartmentID
group by d.DepartmentName
order by Average_Salary desc;

-- Query 14: Average experience by department
select d.DepartmentName,
round(avg(Experience),2) as Average_Experience 
from Employees e
inner join Departments d
on d.DepartmentID=e.DepartmentID
group by d.DepartmentName
order by Average_Experience;

-- Query 15: Employees in Hyderabad with salary > ₹80,000
select e.EmployeeID,e.FirstName,e.LastName,e.Salary,c.CityName
from Employees e
inner join Cities c 
on c.CityID=e.CityID
where c.CityName='Hyderabad'
and e.Salary>80000
order by e.Salary desc;

-- Query 16: Departments having more than 100 employees
select d.DepartmentName,
count(e.EmployeeID) as Employee_Count
from Employees e
inner join Departments d
on d.DepartmentID=e.DepartmentID
group by d.DepartmentName
having Employee_count>100;

-- Query 17: Average salary by city
select c.CityName,
round(avg(Salary),2) as Average_Salary
from Employees e
inner join Cities c
on c.CityID=e.CityID
group by c.CityName
order by Average_Salary desc;

-- Query 18: Employee count by education level
select ed.Education,
count(EmployeeID) as Employee_count
from Employees e
inner join Education ed
on e.EducationID=ed.EducationID
group by ed.Education
order by Employee_count desc;

-- Query 19: Employees with rating 5
select e.EmployeeID,e.FirstName,e.LastName,p.Rating 
from Employees e
inner join Performance p
on e.EmployeeID=p.EmployeeID
where p.Rating=5;

-- Query 20: Attrition Count by Department
select d.DepartmentName,
count(e.EmployeeID) as Employees_Left 
from Employees e
inner join Performance p
on e.EmployeeID=p.EmployeeID
inner join Departments d
on d.DepartmentID=e.DepartmentID
where p.Attrition='Yes'
group by d.DepartmentName
order by Employees_Left desc
;

-- Query 21: Attrition count by city
select c.CityName,
count(e.EmployeeID) as Employee_Count
from Employees e
inner join Cities c
on c.CityID=e.CityID
inner join Performance p
on e.EmployeeID=p.EmployeeID
where p.Attrition-'Yes'
group by c.CityName
order by Employee_count desc;

-- Query 22: Employees with salary above department average
select e.EmployeeID,e.FirstName,e.LastName,e.Salary,d.DepartmentName
from Employees e
inner join Departments d
on d.DepartmentID=e.DepartmentID
where e.Salary>(
select avg(e2.Salary)
from Employees e2
where e2.DepartmentID=e.DepartmentID
)
order by e.Salary desc;

-- Query 23: Highest-paid employee in each department
select e.EmployeeID,e.FirstName,e.LastName,e.Salary,d.DepartmentName
from Employees e
inner join Departments d
on d.DepartmentID=e.DepartmentID
where e.Salary=(
select max(e2.Salary)
from Employees e2
where e2.DepartmentID=e.DepartmentID
)
order by e.Salary desc;

-- Query 24: Lowest-paid employee in each department
select e.EmployeeID,e.FirstName,e.LastName,e.Salary,d.DepartmentName
from Employees e 
inner join Departments d
on d.DepartmentID=e.DepartmentID
where e.Salary=(
select min(e2.Salary)
from Employees e2
where e2.DepartmentID=e.DepartmentID
)
order by e.Salary desc;

-- Query 25: Departments with average salary above company average
select d.DepartmentName,
round(avg(e.Salary),2) as Average_Salary
from Employees e
inner join Departments d
on d.DepartmentID=e.DepartmentID
group by d.DepartmentName
having avg(e.Salary)>(
select avg(e2.Salary)
from Employees e2
);

-- Query 26: Second highest salary
select Max(Salary) as Second_Highest_Salary
from Employees
where Salary<(
select max(Salary)
from Employees
);

-- Query 27: Third highest salary
select Salary
from Employees
order by Salary desc
limit 1 offset 2;

-- Query 28: Top 3 salaries in each department
select EmployeeID,FirstName,LastName,Salary,DepartmentName
from(
select e.EmployeeID,e.FirstName,e.LastName,e.Salary,d.DepartmentName,
rank() over (partition by d.DepartmentName order by e.Salary desc) as RankNum
from Employees e
inner join Departments d
on d.DepartmentID=e.DepartmentID) as Ranked
where RankNum<=3
order by DepartmentName,Salary;

-- Query 29: Rank employees by salary
select EmployeeID,FirstName,LastName,Salary,
rank() over (order by Salary desc) as SalaryRank
from Employees
order by SalaryRank;

-- Query 30: Rank employees within departments
select e.EmployeeID,e.FirstName,e.LastName,e.Salary,d.DepartmentName,
rank() over (partition by d.DepartmentName order by e.Salary desc) as SalaryRank
from Employees e
inner join Departments d
on d.DepartmentID=e.DepartmentID
order by d.DepartmentName,SalaryRank;

-- Query 31: Dense rank employees
select EmployeeID,FirstName,LastName,Salary,
dense_rank() over (order by Salary desc) as SalaryRank
from Employees e
order by SalaryRank;

-- Query 32: Row number by hire date
select EmployeeID,FirstName,LastName,HireDate,
row_number() over (order by HireDate asc) as HireRank
from Employees
order by HireRank;

-- Query 33: Employees with duplicate names
select FirstName,LastName,count(*) as NameCount
from Employees
group by FirstName,LastName
having count(*)>1;

-- Query 34: Employees sharing the same salary
select e.EmployeeID,e.FirstName,e.LastName,e.Salary
from Employees e
inner join Employees e2
on e2.Salary=e.Salary
and e2.EmployeeID<>e.EmployeeID
order by e.Salary desc;

-- Query 35: Running total of salary
select e.EmployeeID, e.FirstName, e.LastName, e.Salary, e.HireDate,
       sum(e.Salary) over (order by e.HireDate asc) as RunningTotalSalary
from Employees e
order by e.HireDate asc;

-- Query 36: Salary difference from previous employee
select EmployeeID,FirstName,LastName,Salary,
Salary-lag(Salary) over (order by EmployeeID) as SalaryDiffFromPrev
from Employees
order by SalaryDiffFromPrev;

-- Query 37: Employees hired immediately after another employee
select EmployeeID,FirstName,LastName,HireDate,
lag(HireDate) over (order by HireDate) as PrevHireDate
From Employees
order by PrevHireDate;

-- Query 38: Use CTE for top earners
with SalaryRanked as(
select e.EmployeeID,e.FirstName,e.LastName,e.Salary,d.DepartmentName,
rank() over (partition by d.DepartmentID order by e.Salary) as SalaryRank
from Employees e
inner join Departments d
on d.DepartmentID=e.DepartmentID
)
select EmployeeID,FirstName,LastName,Salary,DepartmentName
from SalaryRanked
where SalaryRank=1
order by DepartmentName,Salary desc; 

-- Query 39: Department salary contribution %
select d.DepartmentName,
sum(e.Salary) as DeptTotalSalary,
sum(e.Salary) * 100.0/sum(sum(e.Salary)) over() as ContributionPercent
from Employees e
inner join Departments d
on e.DepartmentID=d.DepartmentID
group by d.DepartmentName
order by ContributionPercent desc;

-- Query 40: Top city by average salary
select c.CityName,
round(avg(e.Salary),2) as Average_Salary
from Employees e
inner join Cities c
on e.CityID=c.CityID
group by c.CityName
order by Average_Salary desc
limit 1;

-- Query 41: Attrition rate by department
select d.DepartmentName,
count(case when p.Attrition='Yes' then 1 end) * 100.0/ count(e.EmployeeID) as AttritionRatePercent
from Employees e
inner join Performance p
on e.EmployeeID=p.EmployeeID
inner join Departments d
on e.DepartmentID=d.DepartmentID
group by d.DepartmentName
order by AttritionRatePercent desc;

-- Query 42:  Attrition rate by city
select c.CityName,
count(case when p.Attrition='Yes' then 1 end) * 100.0/ count(e.EmployeeID) as AttritionRatePercent
from Employees e 
inner join Performance p
on e.EmployeeID=p.EmployeeID
inner join Cities c
on e.CityID=c.CityID
group by c.CityName
order by AttritionRatePercent desc;

-- Query 43: Average rating by department
select d.DepartmentName,
round(avg(p.Rating),2) as Average_Rating
from Employees e
inner join Departments d
on e.DepartmentID=d.DepartmentID
inner join Performance p
on e.EmployeeID=p.EmployeeID
group by d.DepartmentName
order by Average_Rating desc;

-- Query 44: Department with best performance
WITH DeptPerformance AS (
    SELECT d.DepartmentName,
           AVG(p.Rating) AS Avg_Rating
    FROM Employees e
    INNER JOIN Departments d
        ON e.DepartmentID = d.DepartmentID
    INNER JOIN Performance p
        ON e.EmployeeID = p.EmployeeID
    GROUP BY d.DepartmentName
)
SELECT DepartmentName, Avg_Rating
FROM DeptPerformance
ORDER BY Avg_Rating DESC
LIMIT 1;

-- Query 45: Correlation between experience and salary
SELECT 
    (SUM(e.Experience * e.Salary) 
     - SUM(e.Experience) * SUM(e.Salary) / COUNT(*))
    /
    SQRT(
        (SUM(e.Experience * e.Experience) - SUM(e.Experience) * SUM(e.Experience) / COUNT(*))
        *
        (SUM(e.Salary * e.Salary) - SUM(e.Salary) * SUM(e.Salary) / COUNT(*))
    ) AS Correlation_Exp_Salary
FROM Employees e;

-- Query 46: Employees eligible for promotion
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName, 
       e.Experience, p.Rating, e.Salary
FROM Employees e
INNER JOIN Performance p
    ON e.EmployeeID = p.EmployeeID
INNER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
WHERE p.Rating >= 4
  AND e.Experience >= 5
  AND e.Salary < 100000
ORDER BY d.DepartmentName, e.Experience DESC;

-- Query 47: Employees at risk of leaving
WITH RiskFactors AS (
    SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName,
           e.Experience, p.Rating, e.Salary,
           CASE 
               WHEN p.Rating <= 2 THEN 1 ELSE 0 END +
               CASE 
                   WHEN e.Experience <= 2 THEN 1 ELSE 0 END +
               CASE 
                   WHEN d.DepartmentName IN ('Sales','Operations','Marketing') THEN 1 ELSE 0 END +
               CASE 
                   WHEN e.Salary < (SELECT AVG(Salary) FROM Employees) THEN 1 ELSE 0 END
           AS RiskScore
    FROM Employees e
    INNER JOIN Performance p ON e.EmployeeID = p.EmployeeID
    INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
)
SELECT EmployeeID, FirstName, LastName, DepartmentName, Experience, Rating, Salary, RiskScore
FROM RiskFactors
WHERE RiskScore >= 2   -- threshold: 2 or more risk factors
ORDER BY RiskScore DESC, DepartmentName;

-- Query 48: Salary budget by department
SELECT d.DepartmentName,
       SUM(e.Salary) AS DeptSalaryBudget
FROM Employees e
INNER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY DeptSalaryBudget DESC;

-- Query 49: Best-performing city
WITH CityPerformance AS (
    SELECT c.CityName,
           AVG(p.Rating) AS Avg_Rating
    FROM Employees e
    INNER JOIN Cities c
        ON e.CityID = c.CityID
    INNER JOIN Performance p
        ON e.EmployeeID = p.EmployeeID
    GROUP BY c.CityName
)
SELECT CityName, Avg_Rating
FROM CityPerformance
ORDER BY Avg_Rating DESC
LIMIT 1;

-- Query 50: Executive summary query for HR leadership
WITH Headcount AS (
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
),
Attrition AS (
    SELECT
100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/ COUNT(*)
FROM Performance
    WHERE Attrition = 'Yes'
),
Performance AS (
    SELECT ROUND(AVG(Rating),2) AS AvgPerformance
    FROM Performance
),
Compensation AS (
    SELECT ROUND(AVG(Salary),2) AS AvgSalary,
           SUM(Salary) AS TotalSalaryBudget
    FROM Employees
),
Risk AS (
    SELECT COUNT(*) AS AtRiskEmployees
    FROM Employees e
    INNER JOIN Performance p ON e.EmployeeID = p.EmployeeID
    WHERE p.Rating <= 2 OR e.Experience <= 2
)
SELECT h.TotalEmployees,
       a.AttritionRate,
       p.AvgPerformance,
       c.AvgSalary,
       c.TotalSalaryBudget,
       r.AtRiskEmployees
FROM Headcount h
CROSS JOIN Attrition a
CROSS JOIN Performance p
CROSS JOIN Compensation c
CROSS JOIN Risk r;

