source companyDB.sql;
SELECT 'complete load companyDB' as 'INFO';

-- query0
SELECT 'Querry 0' as 'Problem';
SELECT [] FROM employees 
WHERE Fname='John' AND [] AND Lname = 'Smith';

-- query1
SELECT 'Querry 1' as 'Problem';
SELECT Fname, Lname, Address From []
WHERE Dname = [] AND Dnumber = Dno;

-- query 2
SELECT 'Querry 2' as 'Problem';
SELECT Pnumber, Dnum, Lname, Address, Bdate From projects, departments, employees
WHERE [] AND [] AND Plocation = 'Stafford';

-- query 4
SELECT 'Querry 4' as 'Problem';
(SELECT [] Pnumber FROM [], employees
WHERE [] AND Mgr_ssn = Ssn AND Lname='Smith')
UNION
(SELECT DISTINCT Pnumber FROM projects, works_on, employees
WHERE Pnumber=Pno AND [] AND Lname='Smith');

-- query 6
SELECT 'Querry 6' as 'Problem';
SELECT Fname, Lname FROM employees
WHERE [] (SELECT * FROM dependents WHERE []);

-- qurey 7
SELECT 'Querry 7' as 'Problem';
SELECT Fname, Lname FROM employees
WHERE [] (SELECT * FROM [] WHERE Ssn=Essn)
      AND EXISTS (SELECT * FROM departments WHERE []);    

-- query 8
SELECT 'Querry 8' as 'Problem';
SELECT E.Fname, E.Lname, [], S.Lname FROM employees as E, employees as S
WHERE [] = S.Ssn;
SELECT 'Querry 8A' as 'Problem';
SELECT E.Fname AS Employee_name, [] AS Supervisor_name
FROM employees AS E, employees AS S
WHERE [];

-- query 10
SELECT 'Querry 10' as 'Problem';
SELECT Ssn, Dname From employees, departments;

-- query 11
SELECT 'Querry 11' as 'Problem';
SELECT [] Salary FROM employees;
SELECT 'Querry 11A' as 'Problem';
SELECT [] Salary FROM employees;

-- query 12, 13
SELECT 'Querry 12' as 'Problem';
SELECT Fname, Lname FROM employees
WHERE Address LIKE [];
SELECT 'Querry 13' as 'Problem';
SELECT Fname, Lname FROM employees
WHERE Bdate LIKE [];

-- query 15
SELECT 'Querry 15' as 'Problem';
SELECT D.Dname, E.Lname, E.Fname, P.Pname FROM departments AS D, employees as E, works_on AS W, projects AS P
WHERE [] AND E.Ssn=W.Essn AND[]
ORDER BY D.Dname, E.Lname, E.Fname;

SELECT 'Querry 15A' as 'Problem';
SELECT D.Dname, E.Lname, E.Fname, P.Pname FROM departments AS D, employees as E, [] AS W, projects AS P
WHERE D.Dnumber=E.Dno AND E.Ssn=W.Essn AND []
ORDER BY D.Dname [], E.Lname ASC, E.Fname [];


-- query 16
SELECT 'Querry 16' as 'Problem';
SELECT E.Fname, E.Lname FROM employees AS E
WHERE E.Ssn IN (SELECT D.Essn FROM dependents AS D 
                WHERE [] AND E.Sex = D.Sex);
SELECT 'Querry 16A' as 'Problem';
SELECT E.Fname, E.Lname FROM employees as E, dependents AS D
WHERE [] = D.Essn AND E.Sex=[] AND E.Fname =[];

-- query 17
SELECT 'Querry 17' as 'Problem';
SELECT DISTINCT Essn FROM works_on WHERE Pno IN [];

-- query 18
SELECT 'Querry 18' as 'Problem';
SELECT Fname, Lname FROM employees WHERE Super_ssn [];

-- query 19
SELECT 'Querry 19' as 'Problem';
SELECT [] AS Total_Sal, MAX(Salary) AS Highest_Sal, 
       MIN(Salary) AS Lowest_Sal, [] AS Average_Sal
FROM employees;

-- query 20
SELECT 'Querry 20' as 'Problem';
SELECT [], MAX(E.Salary), MIN(E.Salary), AVG(E.Salary)
FROM employees AS E, departments AS D
WHERE [] AND D.Dname = 'Research';

-- query 21
SELECT 'Querry 21' as 'Problem';
SELECT [] FROM employees;

-- query 22
SELECT 'Querry 22' as 'Problem';
SELECT COUNT(*) FROM employees, departments 
WHERE [] AND Dname = 'Research';

-- query 23
SELECT 'Querry 23' as 'Problem';
SELECT [] FROM employees;

-- query 24
SELECT 'Querry 24' as 'Problem';
SELECT Dno, COUNT(*), [] FROM employees GROUP BY [];

-- query 25
SELECT 'Querry 25' as 'Problem';
SELECT Pnumber, Pname, COUNT(*) FROM projects, works_on 
WHERE [] GROUP BY Pnumber, Pname;

-- query 26
SELECT 'Querry 26' as 'Problem';
SELECT Pnumber, Pname, COUNT(*) FROM projects, works_on
WHERE Pnumber=Pno GROUP BY Pnumber, Pname HAVING [];

-- query 27
SELECT 'Querry 27' as 'Problem';
SELECT Pnumber, Pname, COUNT(*) FROM projects, works_on, employees
WHERE Pnumber=Pno AND [] AND [] GROUP BY Pnumber, Pname;

-- query 28
SELECT 'Querry 28' as 'Problem';
SELECT Dno, COUNT(*) FROM employees
WHERE Salary >40000 AND [] in (SELECT Dno FROM employees GROUP BY [] HAVING COUNT(*)>5)
GROUP BY Dno;


