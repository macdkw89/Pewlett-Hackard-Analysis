# DELIVERABLE 1

## Steps 1 - 7
SELECT 
    e.emp_no, e.first_name, e.last_name,
    t.title, t.from_date, t.to_date
INTO retirement_titles FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

SELECT * FROM retirement_titles

## Steps 8 - 15
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, 
first_name, 
last_name, 
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

## Steps 16 - 22
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

# DELIVERABLE 2

## Steps 1 - 11
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, 
    e.birth_date, d.from_date, d.to_date, t.title
INTO mentorship_eligibility FROM employees as e
INNER JOIN dept_emp as d ON (e.emp_no = d.emp_no)
INNER JOIN titles as t ON (e.emp_no = t.emp_no)
WHERE (d.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;

# Deliverable 3, see README.md

