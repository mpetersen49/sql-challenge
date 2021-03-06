-- List of employees with salary
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
join salaries as s
on e.emp_no = s.emp_no;

-- List of employees hired in 1986
select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986;

-- List of department managers
select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from employees as e
left join dept_manager as dm
on e.emp_no = dm.emp_no
left join departments as d
on d.dept_no = dm.dept_no;

-- List of employees and their department
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
left join departments as d
on de.dept_no = d.dept_no;

-- List of employees with the first name "Hercules" and last name beginning with "B"
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- List of employees in the sales department
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
left join departments as d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

-- List of employees in the sales and development departments
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
left join departments as d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales'
or d.dept_name = 'Development';

-- List of frequency count of last name in descending order
select last_name, count(last_name) as "Count"
from employees
group by last_name
order by "Count" desc;
