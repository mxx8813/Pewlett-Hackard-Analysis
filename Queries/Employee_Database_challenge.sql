
--- Deliverable 1: The Number of Retiring Employees by Title

---Create A list of Retirement Titles
SELECT 
	e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no DESC;


---Create a list of Unique Titles Current Employees
select Distinct(emp_no)emp_no,
	first_name, 
	last_name,
	title
INTO unique_titles
From retirement_titles
Where to_date = '9999-01-01'
ORDER BY emp_no ASC;


---# of retirees by title
select count(title),title
From unique_titles
Group BY title
ORDER BY count desc


---Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT Distinct ON (e.emp_no)e.emp_no,
	e.first_name, 
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC;
