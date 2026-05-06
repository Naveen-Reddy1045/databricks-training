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

-- Select employees whose names start with 'J'.
    select *from Employee
    where name like "J%";

--Select employees whose names end with 'e'.
    select *from Employee
    where name like "%e";

--Select employees whose names contain 'a'.
    select *from Employee
    where name like "%a%";

--Select employees whose names are exactly 9 characters long.
    select *from Employee
    where length(name) = 9;

--Select employees whose names have 'o' as the second character.
    select *from Employee
    where name = '_o%';
