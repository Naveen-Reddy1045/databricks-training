-- Select all employees ordered by their salary in ascending order.
      SELECT *FROM Employee
      ORDER BY salary;
-- Select all employees ordered by their age in descending order.
      SELECT *FROM Employee
      ORDER BY age DESC;
-- Select all employees ordered by their hire date in ascending order.
      SELECT *FROM Employee
      ORDER BY hire_date;
-- Select employees ordered by their department and then by their salary.
      SELECT *FROM Employee
      ORDER BY department_id ASC, salary ASC;
-- Select departments ordered by the total salary of their employees.
      SELECT department_id, SUM(salary) AS total_salary
      FROM Employee
      GROUP BY department_id
      ORDER BY total_salary DESC;

-- Select employee names along with their department names.
      select e.name as emp_name, d.name as dept_name
      from Employee e
      JOIN Department d
      on e.department_id = d.department_id;
-- Select project names along with the department names they belong to.
      SELECT p.name AS project_name, d.name AS dept_name
      FROM Project p
      JOIN Department d
      ON p.department_id = d.department_id;
-- Select all employees and their departments, including those without a department.
      SELECT e.name AS employee_name, d.name AS department_name
      FROM Employee e
      LEFT JOIN Department d
      ON e.department_id = d.department_id;
-- Select all departments and their employees, including departments without employees.
      SELECT d.name AS department_name, e.name AS employee_name
      FROM Department d
      LEFT JOIN Employee e
      ON d.department_id = e.department_id;
-- Select the departments that have no employees.
      SELECT d.name
      FROM Department d
      LEFT JOIN Employee e
      ON d.department_id = e.department_id
      WHERE e.emp_id IS NULL;
-- Select employee names who share the same department with 'John Doe'.
      SELECT name FROM Employee
      WHERE department_id = (
          SELECT department_id
          FROM Employee
          WHERE name = 'John Doe'
      );
-- Select the department name with the highest average salary.
      SELECT d.name, AVG(e.salary) AS avg_salary
      FROM Department d
      JOIN Employee e
      ON d.department_id = e.department_id
      GROUP BY d.department_id
      ORDER BY avg_salary DESC
      LIMIT 1;

-- Select the employee with the highest salary.
      SELECT *FROM Employee
      WHERE salary = (SELECT MAX(salary) FROM Employee);
-- Select employees whose salary is above the average salary.
      SELECT *FROM Employee
      WHERE salary > (SELECT AVG(salary) FROM Employee);
-- Select the second highest salary from the Employee table.
      SELECT MAX(salary) AS second_highest_salary
      FROM Employee
      WHERE salary < (SELECT MAX(salary) FROM Employee);
-- Select the department with the most employees.
      SELECT department_id FROM Employee
      GROUP BY department_id
      ORDER BY COUNT(*) DESC
      LIMIT 1;
-- Select employees who earn more than the average salary of their department.
      SELECT e.* FROM Employee e
      WHERE e.salary > (
          SELECT AVG(e2.salary)
          FROM Employee e2
          WHERE e2.department_id = e.department_id
      );

-- Select the nth highest salary(3rd highest).
      SELECT DISTINCT salary
      FROM Employee e1
      WHERE 3 = (
          SELECT COUNT(DISTINCT salary)
          FROM Employee e2
          WHERE e2.salary >= e1.salary
      );
-- Select employees who are older than all employees in the HR department.
      SELECT *FROM Employee
      WHERE age > (
          SELECT MAX(age)
          FROM Employee
          WHERE department_id = (
              SELECT department_id
              FROM Department
              WHERE name = 'HR'
          )
      );
-- Select departments where the average salary is greater than 55000.
      SELECT department_id
      FROM Employee
      GROUP BY department_id
      HAVING AVG(salary) > 55000;
-- Select employees who were hired on the same date as 'Jane Smith'.
      SELECT *FROM Employee
      WHERE hire_date = (
          SELECT hire_date
          FROM Employee
          WHERE name = 'Jane Smith'
      );

-- Select the total salary of employees hired in the year 2020.
      SELECT SUM(salary) AS total_salary
      FROM Employee
      WHERE YEAR(hire_date) = 2020;
-- Select the average salary of employees in each department, ordered by the average salary in descending order.
      SELECT department_id, AVG(salary) AS avg_salary
      FROM Employee
      GROUP BY department_id
      ORDER BY avg_salary DESC;
-- Select departments with more than 1 employee and an average salary greater than 55000.
      SELECT department_id
      FROM Employee
      GROUP BY department_id
      HAVING COUNT(*) > 1 AND AVG(salary) > 55000;
-- Select employees hired in the last 2 years, ordered by their hire date.
      SELECT *FROM Employee
      WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
      ORDER BY hire_date;
-- Select the total number of employees and the average salary for departments with more than 2 employees.
      SELECT department_id, COUNT(*) AS total_emp, AVG(salary) AS avg_salary
      FROM Employee
      GROUP BY department_id
      HAVING COUNT(*) > 2;

-- Select the name and salary of employees whose salary is above the average salary of their department.
      SELECT e.* FROM Employee e
      WHERE salary > (
          SELECT AVG(salary)
          FROM Employee
          WHERE department_id = e.department_id
      );
-- Select the names of employees who are hired on the same date as the oldest employee in the company.
      SELECT * FROM Employee
      WHERE hire_date = (
          SELECT MIN(hire_date)
          FROM Employee
      );
-- Select the employee name with the highest salary in each department.
SELECT e.*
FROM Employee e
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department_id = e.department_id
);
