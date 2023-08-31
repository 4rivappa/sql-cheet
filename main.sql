
-- creating table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(30) DEFAULT 'password'
);

-- PRIMARY KEY = UNIQUE + NOT NULL 
-- NOT NULL = not null constraint
-- UNIQUE = should be unique

-- Data types
-- INT = Integers
-- DECIMAL(M,N) = Total of M bits, in which N bits are after decimal point
-- VARCHAR(N) = String of length N
-- BLOB = Binary large object like files
-- DATE = Date (YYYY-MM-DD)
-- TIMESTAMP = Date and time (YYYY-MM-DD HH:MM:SS)

-- DEFAULT = default value for that column
-- AUTO INCREMENT = increments the value of the column automatically


-- Describe table
DESC student;
DESCRIBE student;

-- Deleting table
DROP TABLE student;

-- Inserting column and deleting column
ALTER TABLE student ADD COLUMN gpa DECIMAL(4,2);
ALTER TABLE student DROP COLUMN gpa;

-- Inserting data into table
INSERT INTO student VALUES (1, 'Rithvik', 'krithvik@gmail.com', ' ');
INSERT INTO student (student_id, email, name) VALUES (2, 'rithvik@google.com', 'Rithvik K');

-- Updating data in table
UPDATE student
SET name = 'Rithvik K'
WHERE email = 'krithvik@gmail.com';

-- Deleting data from table
DELETE FROM student
WHERE email = 'krithvik@gmail.com';

-- Keywords and comparators
-- AND, OR, NOT, BETWEEN, IN, LIKE, IS NULL, IS NOT NULL
-- BETWEEN (value1 AND value2)
-- IN (value1, value2, value3, value4)
-- LIKE pattern (% => any number of characters, _ => one character)2
-- =, <>, >, <, >=, <=
-- LENGTH(string) or LEN(string) = no of bytes in string
-- CHAR_LENGTH(string) = no of characters in string

-- Getting data from table
SELECT * FROM student;
-- * = all columns
SELECT name, email
FROM student;

SELECT student.name, student.email
FROM student;

-- Ordering data
SELECT name, email
FROM student
ORDER BY name;

-- DESC = descending order (keyword)
-- ASC = ascending order (keyword)
-- ORDER BY column1, column2;
-- LIMIT = limit the number of rows

-- DISTINCT column1 = distinct values of column1
-- COUNT(column1) = count of values in column1
-- SUM(column1) = sum of values in column1
-- AVG(column1) = average of values in column1
-- MIN(column1) = minimum value in column1
-- MAX(column1) = maximum value in column1
-- GROUP BY column1 = group by column1
-- HAVING = like WHERE but for GROUP BY


-- Foreign keys and references
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(30) DEFAULT 'password',

    FOREIGN KEY (email) REFERENCES student(email) ON DELETE SET NULL
)
-- ON DELETE SET NULL = if the row is deleted from login_details, then the email column in student table will be set to NULL
-- ON DELETE CASCADE = if the row is deleted from login_details, then the row will be deleted from student table as well
-- ON DELETE RESTRICT = if the row is deleted from login_details, then the row will not be deleted from student table
-- ON DELETE NO ACTION = same as RESTRICT

-- Unions (combining data from multiple tables - should contain equal no of columns and same data type for respective columns)
SELECT name, email
FROM student
UNION
SELECT name, email
FROM employee;

-- Joins (combining data from multiple tables - joins the data based on the condition for common column out of tables)
SELECT student.name, employee.name, employee.email
FROM student
JOIN employee
ON student.email = employee.email;

-- LEFT JOIN = all rows from left table and matching rows from right table
-- RIGHT JOIN = all rows from right table and matching rows from left table