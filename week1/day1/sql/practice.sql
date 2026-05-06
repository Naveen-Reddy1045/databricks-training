-- Select all columns from the Employee table.
    select *from Empolyee;
-- Select only the name and salary columns from the Employee table.
      select name, salary from Empolyee;
-- Select employees who are older than 30.
      select *from Empolyee
      where age > 30;
-- Select the names of all departments.
      select name from Employee;
-- Select employees who work in the IT department.
      SELECT e.name FROM Employee e
      JOIN Department d
      ON e.department_id = d.department_id;
