CREATE TABLE ss6_lt7.department (
    id SERIAL PRIMARY KEY ,
    name VARCHAR(50)
);

CREATE TABLE ss6_lt7.employee (
    id serial primary key ,
    full_name VARCHAR(100),
    department_id int references ss6_lt7.department(id),
    salary NUMERIC(10, 2)
);

--1
SELECT *
FROM ss6_lt7.employee e
INNER JOIN ss6_lt7.department d on d.id = e.department_id;

--2
SELECT
    d.name as department_name,
    avg(e.salary) as avg_salary
FROM ss6_lt7.employee e
JOIN ss6_lt7.department d on d.id = e.department_id
GROUP BY d.id;

--3
SELECT
    d.name as department_name,
    avg(e.salary) as avg_salary
FROM ss6_lt7.employee e
         JOIN ss6_lt7.department d on d.id = e.department_id
GROUP BY d.id
HAVING avg(e.salary) > 10000000;

--4
SELECT
    d.id,
    d.name
FROM ss6_lt7.employee e
LEFT JOIN ss6_lt7.department d on e.department_id = d.id
WHERE e.id isnull ;