
--1 List the following details of each employee: employee number, last name, first name, gender, and salary

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY emp_no;

--2 List employees who were hired in 1986

SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date
BETWEEN '1986-01-01' AND '1986-12-31';

--3 List the manager of each department with the following information: department number, department name, 
  --the manager's employee number, last name, first name, and start and end employment dates.
  
SELECT d.dept_no, departments.dept_name, d.emp_no, e.last_name, e.first_name, d.from_date, d.to_date
FROM dept_manager d
LEFT JOIN departments ON d.dept_no = departments.dept_no
INNER JOIN employees e ON d.emp_no = e.emp_no;

--4 List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments ON departments.dept_no = dept_emp.dept_no
ORDER BY emp_no;

--5 List all employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.first_name, employees.last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6 List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM employees e
INNER JOIN  dept_emp ON dept_emp.emp_no = e.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

--7 List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM employees e
INNER JOIN  dept_emp ON dept_emp.emp_no = e.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT COUNT(emp_no) as "emp_count", last_name
FROM employees
GROUP BY last_name
ORDER BY emp_count desc;
