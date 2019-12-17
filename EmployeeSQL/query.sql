-- List: employee number, last name, first name, gender, and salary.
select a.emp_no,a.last_name,a.first_name,a.gender,b.salary
	from employees a
	left join
	salaries b
	on a.emp_no=b.emp_no;
--List employees who were hired in 1986.
select *
	from employees
	where extract(year from hire_date)>1986;

-- List the manager: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select a.dept_no,b.dept_name,a.emp_no,c.last_name,c.first_name,a.from_date,a.to_date
	from dept_manager a
	left join
	departments b
	on a.dept_no=b.dept_no
	left join
	employees c
	on a.emp_no=c.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select a.emp_no,a.last_name,a.first_name,b.dept_name
	from employees a
	left join
	(select c.dept_name,d.emp_no 
	 	from departments c 
		join dept_emp d
		on c.dept_no=d.dept_no) b
	on a.emp_no=b.emp_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name
	from employees
	where first_name='Hercules' and substr(last_name,1,1)='B';--or last_name like 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select a.emp_no,a.last_name,a.first_name,b.dept_name
	from employees a
	left join
	(select c.dept_name,d.emp_no 
	 	from departments c 
		join dept_emp d
		on c.dept_no=d.dept_no) b
	on a.emp_no=b.emp_no
	where b.dept_name='Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select a.emp_no,a.last_name,a.first_name,b.dept_name
	from employees a
	left join
	(select c.dept_name,d.emp_no 
	 	from departments c 
		join dept_emp d
		on c.dept_no=d.dept_no) b
	on a.emp_no=b.emp_no
	where b.dept_name in ('Sales','Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select count(last_name) as last_name_count,last_name
	from employees
	group by last_name
	order by last_name_count desc;