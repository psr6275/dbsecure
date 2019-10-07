DROP DATABASE IF EXISTS companyDB;
CREATE DATABASE IF NOT EXISTS companyDB;
USE companyDB;



DROP TABLE IF EXISTS 	employees, departments, dept_locations,
				        works_on, projects, dependents;

CREATE TABLE employees (
    Fname VARCHAR(15) NOT NULL,
    Minit CHAR(1),
    Lname VARCHAR(15) NOT NULL,			
    Ssn CHAR(9) NOT NULL,
    Bdate DATE NOT NULL,
    Address VARCHAR(30),
    Sex CHAR(1) CHECK (Sex IN('F','M','U')),
    Salary DECIMAL(10,2),
    Super_ssn CHAR(9),
    Dno INT	NOT NULL,
    PRIMARY KEY (Ssn)
);

CREATE TABLE departments (
    Dname VARCHAR(15) NOT NULL,
    Dnumber	INT NOT NULL DEFAULT 1,
    Mgr_ssn	CHAR(9)	NOT NULL DEFAULT '888665555',
    Mgr_start_date DATE,
    PRIMARY KEY (Dnumber),
    UNIQUE KEY (Dname)
);

CREATE TABLE dept_locations (
    Dnumber	INT	NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation)
);

CREATE TABLE projects (
	Pname CHAR(15)	NOT NULL,
	Pnumber	INT	NOT NULL,
	Plocation CHAR(15),
	Dnum INT NOT NULL,
    PRIMARY KEY (Pnumber),
    UNIQUE KEY (Pname)
);

CREATE TABLE works_on (
    Essn CHAR(9) NOT NULL,
    Pno INT	NOT NULL,
    Hours DECIMAL(3,1) CHECK (Hours>0),
    PRIMARY KEY (Essn, Pno)
);

CREATE TABLE dependents (
	Essn CHAR(9) NOT NULL,
	Dependent_name VARCHAR(15) NOT NULL,
	Sex CHAR(1) CHECK (Sex IN ('F','M','U')),
	Bdate DATE,
	Relationship CHAR(15),
    PRIMARY KEY (Essn, Dependent_name)
);

-- Load data

SELECT 'Loading employees' as 'Processing';
source ../data/load_employees.dump;

SELECT 'Loading departments' as 'Processing';
source ../data/load_departments.dump;

SELECT 'Loading dept_locations' as 'Processing';
source ../data/load_dept_locations.dump;

SELECT 'Loading works_on' as 'Processing';
source ../data/load_works_on.dump;

SELECT 'Loading projects' as 'Processing';
source ../data/load_projects.dump;

SELECT 'Loading dependents' as 'Processing';
source ../data/load_dependents.dump;

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_locations;
SELECT * FROM projects;
SELECT * FROM works_on;
SELECT * FROM dependents;

-- Foreign Key
ALTER TABLE employees
ADD CONSTRAINT EMPSUPERFK FOREIGN KEY (Super_ssn) REFERENCES employees(Ssn) 
    ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT EMPDEPTFK FOREIGN KEY (Dno) REFERENCES departments (Dnumber) 
    ON UPDATE CASCADE;
-- InnoDB does not support "on delete default "

ALTER TABLE departments
ADD CONSTRAINT DEPTMGRFK FOREIGN KEY (Mgr_ssn) REFERENCES employees (Ssn) 
    ON UPDATE CASCADE;

ALTER TABLE dept_locations
ADD FOREIGN KEY (Dnumber) REFERENCES departments (Dnumber) 
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE works_on 
ADD FOREIGN KEY (Essn) REFERENCES employees (Ssn) 
    ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY (Pno) REFERENCES projects (Pnumber) 
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE projects
ADD FOREIGN KEY (Dnum) REFERENCES departments (Dnumber) 
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE dependents
ADD FOREIGN KEY (Essn) REFERENCES employees (Ssn) 
    ON DELETE CASCADE ON UPDATE CASCADE;



SHOW TABLES;


