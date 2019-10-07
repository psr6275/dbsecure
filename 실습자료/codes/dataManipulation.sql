use companyDB;

-- insert data
SELECT 'Insert Data' as 'INFO';
INSERT INTO employees VALUES ('Richard', 'K', 'Marini', '653298653','1962-12-30','98 Oak Forest, Katy, TX', 'M', 37000, '653298653', 4);
SELECT * from employees;

-- update data
SELECT 'Update Data' as 'INFO';
UPDATE employees SET Salary = Salary*1.1 WHERE Ssn = '653298653';
SELECT * from employees;

-- delete data
SELECT 'Delete Data' as 'INFO';
SELECT * from employees WHERE Ssn = '653298653' INTO OUTFILE '~/Documents/GitHub/dbsql_practice/data/employees_Richard.txt';
DELETE FROM employees WHERE Ssn = '653298653';
SELECT * FROM employees;

-- insert data From file
SELECT 'Insert Data from File' as 'INFO';
LOAD DATA INFILE '~/Documents/GitHub/dbsql_practice/data/employees_Richard.txt' INTO TABLE employees;
SELECT * FROM employees;
