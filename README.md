# sql-challenge

## Background

It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s. Six CSV files remain from the employee database from that period.

For this project, you’ll design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. That is, you’ll perform `data modeling`, `data engineering`, and `data analysis`, respectively.

## Folders and files

* It is going to find **2 folders** in this project:

    * The folder called `Images` will find a file called [QuickDBD-Powlett Hackard](https://www.quickdatabasediagrams.com/](https://github.com/ricardodelosrios/sql-challenge/blob/main/Images/QuickDBD-Pewlett%20Hackard.png)).
  
    * The folder called `Resources` will find 6 CSV files that were used to complete this challenge. Listed below are the names of the files you will find:

      * [Departments.csv](https://github.com/ricardodelosrios/sql-challenge/blob/main/Resources/Departments.csv)
      * [dept_emp.csv](https://github.com/ricardodelosrios/sql-challenge/blob/main/Resources/dept_emp.csv)
      * [dept_manager.csv](https://github.com/ricardodelosrios/sql-challenge/blob/main/Resources/dept_manager.csv)
      * [employees.csv](https://github.com/ricardodelosrios/sql-challenge/blob/main/Resources/employees.csv)
      * [salaries.csv](https://github.com/ricardodelosrios/sql-challenge/blob/main/Resources/salaries.csv)
      * [titles.csv](https://github.com/ricardodelosrios/sql-challenge/blob/main/Resources/titles.csv)

* It will find **4 Files** in this project:
  
    * [Schema Powlett_Hackard.sql](https://github.com/ricardodelosrios/sql-challenge/blob/main/Schema%20Powlett_Hackard.sql): There is a schema that was built in Quick Database Diagram.
    * [Queries_Powlett_Hackard.sql](https://github.com/ricardodelosrios/sql-challenge/blob/main/Queries_Powlett_Hackard.sql): In this file are the queries to solve the questions. For this point it was used PostgreSQL.
    * [Bonus_Powlett_Hackard.ipynb](https://github.com/ricardodelosrios/sql-challenge/blob/main/Bonus__Powlett_Hackard.ipynb): There is a Jupyter notebook of the analysis, where it used pandas and sqlalchemy libraries.
    * [.gitignore](https://github.com/ricardodelosrios/sql-challenge/blob/main/.gitignore):In this file, it saved the password to access to PGAdmin and be able to create the connection with the sqlalchemy library.

## Data modeling

To carry out the modeling, it was used the webside Quick Database Diagrams, which serve as a visual representation of the structure of a database, helping to illustrate the relationships between different tables, entities and attributes within the database. 

This diagram was built using [Quick Database Diagram](https://www.quickdatabasediagrams.com/).

![alt text](https://github.com/ricardodelosrios/sql-challenge/blob/main/Images/QuickDBD-Pewlett%20Hackard.png)

## Data engineering

The information provided by the Entity Relationship Diagram was used to create a table schema for each of the six CSV files, and then, the data from each of the CSV files was imported into PostgreSQL.

It can see the tables with their relationships in the [Schema](https://github.com/ricardodelosrios/sql-challenge/blob/main/Schema%20Powlett_Hackard.sql).

## Data analysis

Taking into the data from the 6 tables related to information from the employees of the Pewlett Hackard company, the following questions were answered:

* List the employee number, last name, first name, sex, and salary of each employee.

```
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY e.emp_no;
```

* List the first name, last name, and hire date for the employees who were hired in 1986.

```
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date;
```
* List the manager of each department along with their department number, department name, employee number, last name, and first name.

```
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from dept_manager dm
INNER JOIN departments d on dm.dept_no = d.dept_no
INNER JOIN employees e on dm.emp_no = e.emp_no;
```

* List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

```
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de on de.emp_no = e.emp_no
INNER JOIN departments d on d.dept_no = de.dept_no;
```

* List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

```
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and  last_name LIKE 'B%' 
ORDER BY last_name;
```
* List each employee in the Sales department, including their employee number, last name, and first name.

```
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employees e
INNER JOIN dept_emp de on de.emp_no = e.emp_no
INNER JOIN departments d on d.dept_no = de.dept_no
WHERE dept_name = 'Sales'
ORDER BY e.emp_no;
```

* List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

```
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employees e
INNER JOIN dept_emp de on de.emp_no = e.emp_no
INNER JOIN departments d on d.dept_no = de.dept_no
WHERE dept_name in ('Sales', 'Development')
ORDER BY e.emp_no;
```

* List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

```
SELECT last_name, COUNT(last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY Frequency DESC;
```


