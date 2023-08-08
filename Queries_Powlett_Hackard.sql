select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from dept_manager dm
INNER JOIN departments d on dm.dept_no = d.dept_no
INNER JOIN employees e on dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de on de.emp_no = e.emp_no
INNER JOIN departments d on d.dept_no = de.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and  last_name LIKE 'B%' 
ORDER BY last_name;

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employees e
INNER JOIN dept_emp de on de.emp_no = e.emp_no
INNER JOIN departments d on d.dept_no = de.dept_no
WHERE dept_name = 'Sales'
ORDER BY e.emp_no;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employees e
INNER JOIN dept_emp de on de.emp_no = e.emp_no
INNER JOIN departments d on d.dept_no = de.dept_no
WHERE dept_name in ('Sales', 'Development')
ORDER BY e.emp_no; 

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY Frequency DESC;
