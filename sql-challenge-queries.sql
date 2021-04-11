--DATA ANALYSIS
--1. View Employees with Salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee e
	INNER JOIN salaries s ON
		e.emp_no=s.emp_no;

--2. View Employees hired 1986
SELECT e.last_name, e.first_name, e.hire_date
FROM employee e
	where (DATE_PART('year', hire_date) = 1986)
order by hire_date, last_name;

--3. View Department Managers
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_mgr dm
	INNER JOIN employee e ON
		dm.emp_no=e.emp_no
	INNER JOIN departments d ON
		dm.dept_no=d.dept_no;

--4. View Department for each Employee
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp de
	INNER JOIN employee e ON
		de.emp_no=e.emp_no
	INNER JOIN departments d ON
		de.dept_no=d.dept_no;

--5. View Employees whose firstname is Hercules and last names begin with B
SELECT e.last_name, e.first_name, e.sex
FROM employee e
	where first_name = 'Hercules' and last_name like 'B%'
order by last_name;

--6. View Sales Department Employees
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp de
	INNER JOIN employee e ON
		de.emp_no=e.emp_no
	INNER JOIN departments d ON
		de.dept_no=d.dept_no
	where d.dept_name = 'Sales'
order by last_name, first_name;

--7. View Sales & Development Department Employees
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employee e
	INNER JOIN dept_emp de ON
		e.emp_no=de.emp_no
	INNER JOIN departments d ON
		de.dept_no=d.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

--8. Count employees by Surname in descending order
SELECT last_name, COUNT(last_name) AS "Surname Count"
FROM employee
GROUP BY last_name
order by "Surname Count" desc;
