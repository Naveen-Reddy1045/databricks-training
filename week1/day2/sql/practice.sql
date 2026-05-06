-- Select employees hired in the year 2020.
    SELECT *
    FROM Employee
    WHERE YEAR(hire_date) = 2020;
-- Select employees hired in January of any year.
    SELECT *
    FROM Employee
    WHERE MONTH(hire_date) = 1;
-- Select employees hired before 2019.
    SELECT *
    FROM Employee
    WHERE hire_date < '2019-01-01';
-- Select employees hired on or after March 1, 2021.
    SELECT *
    FROM Employee
    WHERE hire_date >= '2021-03-01';
-- Select employees hired in the last 2 years.
    SELECT *  
    FROM Employee
    WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- Select the total salary of all employees.
    SELECT SUM(salary) AS total_salary
    FROM Employee;
-- Select the average salary of employees.
    SELECT AVG(salary) AS avg_salary
    FROM Employee;
-- Select the minimum salary in the Employee table.
    SELECT MIN(salary) AS min_salary
    FROM Employee;
-- Select the number of employees in each department.
    SELECT department_id, COUNT(*) AS employee_count
    FROM Employee
    GROUP BY department_id;
-- Select the average salary of employees in each department.
    SELECT department_id, AVG(salary) AS avg_salary
    FROM Employee
    GROUP BY department_id;

-- Select the total salary for each department.
    SELECT department_id, SUM(salary) AS total_salary
    FROM Employee
    GROUP BY department_id;
-- Select the average age of employees in each department.
    SELECT department_id, AVG(age) AS avg_age
    FROM Employee
    GROUP BY department_id;
-- Select the number of employees hired in each year.
    SELECT YEAR(hire_date) AS year, COUNT(*) AS total_hired
    FROM Employee
    GROUP BY YEAR(hire_date);
-- Select the highest salary in each department.
    SELECT department_id, MAX(salary) AS highest_salary
    FROM Employee
    GROUP BY department_id;
-- Select the department with the highest average salary.
    SELECT department_id, AVG(salary) AS avg_salary
    FROM Employee
    GROUP BY department_id
    ORDER BY avg_salary DESC
    LIMIT 1;

-- Departments with more than 2 employees
    SELECT department_id, COUNT(*) AS total_employees
    FROM Employee
    GROUP BY department_id
    HAVING COUNT(*) > 2;
-- Departments with average salary greater than 55000
    SELECT department_id, AVG(salary) AS avg_salary
    FROM Employee
    GROUP BY department_id
    HAVING AVG(salary) > 55000;
-- Years with more than 1 employee hired
    SELECT YEAR(hire_date) AS year, COUNT(*) AS total_hired
    FROM Employee
    GROUP BY YEAR(hire_date)
    HAVING COUNT(*) > 1;
-- Departments with total salary expense less than 100000
    SELECT department_id, SUM(salary) AS total_salary
    FROM Employee
    GROUP BY department_id
    HAVING SUM(salary) < 100000;
-- Departments with maximum salary above 75000
    SELECT department_id, MAX(salary) AS max_salary
    FROM Employee
    GROUP BY department_id
    HAVING MAX(salary) > 75000;
