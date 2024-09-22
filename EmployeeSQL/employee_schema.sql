-- schema to create tables prior to loading CSV files and establish primary keys and foreign keys
-- starting with drop table due to needing to restart the schema after entering some errors
-- column lengths were determined by the longest piece of data from the CSV. For some categories like sex, dept_name, title, first_name, and last_name 
---I made the lengths slightly longer in case data was later added to the database with longer lengths than what is currently present

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;

CREATE TABLE departments (
dept_no VARCHAR(5) NOT NULL,
dept_name VARCHAR(30) NOT NULL,
PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
title_id VARCHAR(10) NOT NULL,
title VARCHAR(20) NOT NULL,
PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
emp_no INT(10) NOT NULL,
emp_title_id VARCHAR(10) NOT NULL,
birth_date VARCHAR(10) NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
sex VARCHAR(5) NOT NULL,
hire_date VARCHAR(10) NOT NULL,
PRIMARY KEY (emp_no),
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
emp_no INT(10) NOT NULL,
dept_no VARCHAR(5) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(5) NOT NULL,
emp_no INT(10) NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE salaries (
emp_no INT(10) NOT NULL,
salary INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
PRIMARY KEY (salary)
);