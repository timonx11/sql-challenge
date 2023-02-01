-- Dropping all FK if we want to start fresh
ALTER TABLE dept_emp DROP CONSTRAINT fk_dept_emp_emp_no;
ALTER TABLE dept_emp DROP CONSTRAINT fk_dept_emp_dept_no;
ALTER TABLE dept_manager DROP CONSTRAINT fk_dept_manager_dept_no;
ALTER TABLE dept_manager DROP CONSTRAINT fk_dept_manager_emp_no;
ALTER TABLE employees DROP CONSTRAINT fk_employees_emp_title;
ALTER TABLE salaries DROP CONSTRAINT fk_salaries_emp_no;

-- Dropping Table if we want to start fresh
DROP TABLE if exists departments;
DROP TABLE if exists dept_emp;
DROP TABLE if exists dept_manager;
DROP TABLE if exists employees;
DROP TABLE if exists salaries;
DROP TABLE if exists titles;

-- Creating Tables as per Challange instruction
CREATE TABLE departments
(  
	dept_no VARCHAR(30) NOT NULL,  
	dept_name VARCHAR(30),   
	PRIMARY KEY(dept_no)   
);  

CREATE TABLE titles
(  
	title_id VARCHAR(30) NOT NULL,  
	title VARCHAR(30),   
	PRIMARY KEY(title_id)   
);

-- keep getting error with datastyle while importing csv so i have to change the datastyle to "MDY"
-- show datestyle;
-- ALTER DATABASE employee_db SET datestyle = "ISO, MDY";

CREATE TABLE employees
(    
	emp_no INT NOT NULL,
	emp_title VARCHAR(15),
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(2),
	hire_date DATE,
	PRIMARY KEY(emp_no)
);


CREATE TABLE salaries
(  
	emp_no INT NOT NULL,  
	salary INT,   
	PRIMARY KEY(emp_no)
);

CREATE TABLE dept_manager
(  
	dept_no VARCHAR(15),  
	emp_no INT,
	PRIMARY KEY(emp_no)
);

CREATE TABLE dept_emp
(  
	emp_no INT NOT NULL,  
	dept_no VARCHAR(15)
);
-- data on both column in dept_emp are not uniquely defined so there will be no primary key for this table

--Assigning Foreign keys to establish the relationship
ALTER TABLE dept_emp 
ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no) REFERENCES employees (emp_no);

ALTER TABLE dept_emp 
ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no) REFERENCES departments (dept_no);

ALTER TABLE dept_manager 
ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no) REFERENCES departments (dept_no);

ALTER TABLE dept_manager 
ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no) REFERENCES employees (emp_no);

ALTER TABLE employees 
ADD CONSTRAINT fk_employees_emp_title FOREIGN KEY(emp_title) REFERENCES titles (title_id);

ALTER TABLE salaries 
ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no) REFERENCES employees (emp_no);

-- PLEASE IMPORT DATA BASED ON THE ORDER OF TABLE CREATION TO AVOID FOREIGN KEY CONSTRAINT VIOLATION

-- Test Query to select * FROM Each Table to confirm data
-- SELECT * FROM departments;
-- SELECT * FROM dept_emp;
-- SELECT * FROM dept_manager;
-- SELECT * FROM employees;
-- SELECT * FROM salaries;
-- SELECT * FROM titles;
