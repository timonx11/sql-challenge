-- List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e JOIN salaries s 
ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT  e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE e.hire_date >= '1986-01-01' AND e.hire_date <= '1986-12-31'

-- List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager dm JOIN departments d ON dm.dept_no = d.dept_no 
					 JOIN employees e ON e.emp_no = dm.emp_no
ORDER BY d.dept_no		

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT d.dept_no, demp.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d JOIN dept_emp demp ON d.dept_no = demp.dept_no 
				   JOIN employees e ON e.emp_no = demp.emp_no
ORDER BY d.dept_no

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no 
				   JOIN employees e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales'


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no 
				   JOIN employees e ON e.emp_no = de.emp_no					 
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT e.last_name, COUNT(e.last_name) AS "frequency count"
FROM employees e
GROUP BY e.last_name
ORDER BY "frequency count" DESC
