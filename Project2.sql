select * from employee
/*View the employee table*/
SELECT 
    EmployeeID,
    JobRole AS Department,
    Age,
    MonthlyIncome AS Salary,
    EnvironmentSatisfaction AS SatisfactionScore,
    Attrition
FROM employee;
/*Clean Data*/
SELECT 
    e.EmployeeID,
    e.JobRole AS Department,
    e.Age,
    e.MonthlyIncome AS Salary,
    e.EnvironmentSatisfaction AS SatisfactionScore,
    e.Attrition 
FROM employee e
WHERE e.MonthlyIncome IS NOT NULL
  AND e.EnvironmentSatisfaction IS NOT NULL;