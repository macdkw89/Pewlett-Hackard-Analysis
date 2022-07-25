# Pewlett-Hackard-Analysis
SQL, MySQL, PostgreSQL, pgAdmin 4

## Overview
The purpose of this analysis is to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. The findings are described below.

## Results
Here are 4 takeaways from the analysis:

1. There are about 16,000 people who retired at the Engineer or Assistant Engineer level instead of the Senior Engineer level. This needs to be further explored to find out why these individuals were never promoted or why they were passed upon for promotion. If an employee has a history of low performance, maybe they shouldn't be considered for the mentorship program. ![image](/resources/retiring_titles.png)
2. According to this module, there are 1549 people eligible for the program. I feel like this is inaccurate since this just counted employees who were born in 1965. A better way to guage this is to find the number of employees who have been hired in the most recent year of data, which is 3232. The code to find this is displayed below:
```SQL
-- Refactored from deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, 
    e.birth_date, d.from_date, d.to_date, t.title
INTO potential_mentees FROM employees as e
INNER JOIN dept_emp as d ON (e.emp_no = d.emp_no)
INNER JOIN titles as t ON (e.emp_no = t.emp_no)
WHERE (d.to_date = '9999-01-01')
AND (d.from_date BETWEEN '2001-08-01' AND '2002-08-01')
ORDER BY e.emp_no;
SELECT COUNT(emp_no) FROM potential_mentees;
```
3. The number of employees eligible for the mentorship program by job title was not specifically requested, but will be included here for department managers to estimate their own department's participation compared to other departments.
![image](/resources/eligible_mentors_by_title.png)

4. There are a lot of opportunities to create additional datapoints from this data, such as accumulated salary or number of job titles held. We should also seek new information to add to the sheets such as reason for dismissal or number of HR complaints.

## Summary
>How many roles will need to be filled as the "silver tsunami" begins to make an impact?

There are 90398 people going into retirement. To find this, we used the following code: 
```SQL 
SELECT sum(count) from retiring_titles;
```

>Are there enough retirement-ready employees in the departments that are qualified to mentor the next generation of Pewlett Hackard employees?

Yes. The 90398 retiring employees, even after discounting those who opt out of the program, should be plenty to mentor the 1549-3232 newer employees. The number of eligible mentees was discussed above in 'Results', bullet #2.



