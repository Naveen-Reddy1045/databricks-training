-- 1. Retrieve the names of employees and their corresponding managers from the "employees" table, ensuring that even employees without managers are included.
select e.emp_name, m.emp_name
from employees e
left join employees m
on e.manager_id = m.emp_id;

-- 2. Display all employees and their corresponding departments from the "employees" and "departments" tables, showing employees even if they don't belong to any department.
select e.*, d.dept_name
from employees e
left join departments d
on e.dept_id = d.dept_id;


-- 3. List the names of employees who report to a manager, along with their manager's name.
SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id;

-- 5. Display a list of employees who do not belong to any department.
SELECT emp_name
FROM employees
WHERE dept_id IS NULL;


-- 6. Fetch the names of employees and the projects they are assigned to.
SELECT e.emp_name, p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;

-- 7. List all employees who have completed at least one project.
SELECT e.emp_name, p.project_name
FROM employees e
JOIN projects p
ON e.emp_id = p.emp_id;

-- 8. Show the names of employees and their projects, ensuring that no project is omitted.
select e.*, p.project_name
from projects p
left join employees e
on p.emp_id = e.emp_id;

-- 10. Retrieve the names of employees and their corresponding department names.
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 11. Find the names of all departments and employees.
SELECT d.dept_name,e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

-- 13. Show the names of employees and their department names.
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 14. Find employees who have not completed any project.
SELECT e.emp_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;


-- 15. Retrieve the names of employees and the names of their projects.
SELECT e.emp_name, p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;


-- 16. List all projects and the employees assigned to them.
SELECT p.project_name, e.emp_name
FROM projects p
LEFT JOIN employees e
ON p.emp_id = e.emp_id;


-- 17. Show the names of all employees who have both a manager and at least one project.
SELECT e.emp_name, m.emp_name AS manager_name, p.project_name
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
JOIN projects p
ON e.emp_id = p.emp_id;

-- 19. Display employees who belong to multiple departments.
SELECT e.emp_id, e.emp_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY e.emp_id, e.emp_name
HAVING COUNT(e.emp_id) > 1;

-- 21. Retrieve employees who have worked on at least one project and do not belong to a department.
SELECT e.emp_name, p.project_name
FROM employees e
JOIN projects p
ON e.emp_id = p.emp_id
WHERE e.dept_id IS NULL;

-- 22. Find the total number of employees who belong to a department.
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;
