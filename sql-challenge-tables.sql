--CREATE & VIEW TABLES--
-- Create a titles table
CREATE TABLE titles (
  	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(20) not null
);

--view title table
SELECT * FROM titles;

-- Create a Department table
CREATE TABLE departments (
  	dept_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR(30) not null
);

--view Department table
SELECT * FROM departments;

-- Create an employee table
CREATE TABLE employee (
  	emp_no INT NOT NULL PRIMARY KEY,
  	emp_title_id VARCHAR(10),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
  	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(2) NOT NULL,
	hire_date DATE
);
--view employee table
SELECT * FROM employee;


-- Create a salary table
CREATE TABLE salaries (
  	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no),
	salary INT not null,
	PRIMARY KEY (emp_no, salary)
);

--view salary table
SELECT * FROM salaries;

-- Create a Department_Employee table
CREATE TABLE dept_emp (
  	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no),
	dept_no VARCHAR (10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

--view Department_Employee table
SELECT * FROM dept_emp;

-- Create a Department_Manager table
CREATE TABLE dept_mgr (
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no),
	PRIMARY KEY (dept_no,emp_no)
);

--view Department_Manager table
SELECT * FROM dept_mgr;
