--number 1
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e 
	JOIN 
	salaries as s 
		ON e.emp_no = s.emp_no;
		
--number 2
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

--number 3
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
	JOIN 
	employees AS e
		ON e.emp_no = dm.emp_no
			JOIN 
			departments AS d
				ON dm.dept_no = d.dept_no;
				
--number 4
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM departments AS d
	JOIN 
	dept_emp AS de
		ON d.dept_no = de.dept_no 
			JOIN 
			employees AS e
				ON de.emp_no = e.emp_no;
				
--number 5
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';
	
--number 6
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
WHERE e.emp_no IN
	(SELECT de.emp_no 
	 FROM dept_emp AS de
	 WHERE de.dept_no = 
		(SELECT d.dept_no
		 FROM departments AS d
		 WHERE d.dept_name = 'Sales'));

--number 7
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees AS e
	JOIN 
	dept_emp AS de
		ON e.emp_no = de.emp_no 
			JOIN 
			departments AS d
				ON de.dept_no = d.dept_no 
				WHERE d.dept_name = 'Sales' 
					OR d.dept_name = 'Development';
					
--number 8
SELECT e.last_name, COUNT(e.last_name) AS last_name_count
FROM employees AS e
GROUP BY e.last_name
ORDER BY last_name DESC;
