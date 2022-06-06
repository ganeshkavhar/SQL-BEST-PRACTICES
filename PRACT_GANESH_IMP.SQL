SELECT first_name || ' ' || last_name || ‘, '||job_id EMP
FROM employees;

SELECT ROUND(47.842,2), ROUND(47.842,0), ROUND(47.842,-1)
FROM DUAL;


Select employee_id, first_name, round(salary+(salary*10)/100)
INCREMENTED_SALARY
from employees;

Select *
From Employees
Where (salary * 12) = 72000;


--find 4 errors
Select first_name, job_id, salary*12 as Annualsalary
From Employees
Where salary = 6000 and hire_date Like' %05';

--Create a query that displays first name, salary, and commission percent for all
--employees working as sales representatives.
select first_name,salary,commission_pct
from employees
where job_id='SA_MAN';

/* Fetch first name, last name, and department number of all employees in department
10 and 20 in alphabetical order of last name. Also, join the two name columns, and
set title to Employees */
select first_name||last_name as Employees,department_id
from employees
where department_id in (10,20)
order by last_name;

--9. Display a list of all employees containing ‘y’ in their last names.
select * from mycode
where last_name like '%y%';

--Display list of employees availing no commission and are enrolled in department number 90.
select * from mycode
where commission_pct is null 
and department_id=90;

--Query the Employees table and fetch names of all employees along with hire dates
--employed between 1 st July 03 and 30th September 03. 
--Display result in ascending order on hire date.

select first_name,last_name,hire_date
from mycode
where to_char(hire_date,'dd-mon-yy') between '1-Jul-03' and '30-Sept-03';

--Show names and salaries of all employees who are not making between 3000 and 10000.
select first_name,salary
from employees
where salary not between 3000 and 10000;

--Write a query that list names and salaries of employees working in department 10,
--20, or 30 and earning more than 3000.
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM MYCODE
WHERE DEPARTMENT_ID=10 OR DEPARTMENT_ID=20 OR DEPARTMENT_ID=30
AND SALARY >3000;


--Display last_name, salary, and commission percent from the Employees table.
--Calculate annual commission of employees who earn a commission. Use the IN
--operator in the search condition. Also add an alias to the calculated column
SELECT LAST_NAME,SALARY,COMMISSION_PCT
FROM MYCODE
WHERE COMMISSION_PCT IS NOT NULL
AND (COMMISSION_PCT*12)AS  TOTCOMM;

--List the name of employees with their hiring dates who were not hired in 2003
SELECT * FROM MYCODE
WHERE TO_CHAR(HIRE_DATE,'YYYY')='2003';

--Retrieve the DEPARTMENT_ID column for all rows in the Employees table.
--Suppress duplicate values and sort the output in descending order.
SELECT DISTINCT DEPARTMENT_ID FROM MYCODE
ORDER BY DEPARTMENT_ID DESC;

--Display last name, department number and salary columns from the Employees
--table for those employees who work either in department number 50 or 90 and also
--earn more than or equal to 5800.
SELECT LAST_NAME,DEPARTMENT_ID,SALARY
FROM MYCODE
WHERE DEPARTMENT_ID=50 OR DEPARTMENT_ID=90
AND
SALARY>=5800;

--NEST DAY
SELECT 'Next Friday will be on '||NEXT_DAY(sysdate,'Friday') "Next Friday"
FROM dual;

--LAST DAY
SELECT sysdate, LAST_DAY(sysdate), LAST_DAY('16-DEC-22')
FROM dual;

--
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') AS "Current Date"
FROM dual;

--Create a query that calculates 10% incremented salary for each employee. 
--Display the new values under the name “INCREMENTED_SALARY” and as whole numbers
SELECT EMPLOYEE_ID,FIRST_NAME,round(salary+(salary*10)/100) AS INCREMENTED_SALARY
FROM MYCODE;

--Create a query that produces the following output for all employees. Use the
--CONCAT function to join names.
SELECT concat(concat(first_name,' '),last_name)||' ['||DEPARTMENT_ID||']' "Employee and Job_ID" 
FROM MYCODE;

--SALARY
SELECT concat(concat(first_name,' '),last_name)||' ['||SALARY||']' "Employee and Job_ID" 
FROM MYCODE;
--DEPARTMENT_ID
SELECT concat(concat(first_name,' '),last_name)||' ['||DEPARTMENT_ID||']' "Employee and Job_ID" 
FROM MYCODE;


--Create a query that produces the following output for all employees. Use the
--CONCAT function to join names.
Select last_name, to_char(hire_date, 'fmDD "of" Month YYYY') HIRE_DATE
from employees
where hire_date like '%03';

--4. Count number of characters in each department’s name as shown below:
SELECT DEPARTMENT_NAME,LENGTH(DEPARTMENT_NAME) 
FROM DEPARTMENTS;

--Provide a list of employees as illustrated below. The output displays the first name
--of each employee with his/her manager number. If the manager number is null,
--display a text “No Manager” instead.

SELECT FIRST_NAME EMPLOYEE,NVL(TO_CHAR(MANAGER_ID),'NO MANAGER') MANAGER
FROM MYCODE;

--Pick three letters from the first name of each employee starting from the second position, like this:
SELECT FIRST_NAME,SUBSTR(FIRST_NAME,2,3)
FROM MYCODE;

--7. Display hire dates of Jennifer in yyyy.dd.mon format.
Select first_name||' '||last_name employee,
to_char(hire_date,'yyyy.dd.mm') hired_on
from employees
where first_name='Jennifer';

--Produce the following list which displays employees whose employment tenure is
--greater than 100 months
SELECT EMPLOYEE_ID,HIRE_DATE,MONTHS_BETWEEN(SYSDATE,HIRE_DATE) TENURE
FROM MYCODE
WHERE MONTHS_BETWEEN(SYSDATE,HIRE_DATE)>100;

--Create a statement to display the number of employees for each job category within each department.
SELECT DEPARTMENT_ID,JOB_ID,COUNT(*) NUMBER_OF_EMPLOYEES
FROM MYCODE  
GROUP BY DEPARTMENT_ID,JOB_ID
ORDER BY DEPARTMENT_ID;

--Display the minimum salary for each job id having a minimum salary more than 15000.
SELECT JOB_ID,MIN(SALARY) MIN_SALARY
FROM MYCODE
GROUP BY JOB_ID
HAVING MAX(SALARY)>15000;

--FIND ERRORS
SELECT first_name, job_id, department_id
FROM employees
WHERE department_id IN
( SELECT department_id
FROM employees
WHERE first_name='Adam')
ORDER BY department_id;

-- Display name, job id and salary columns for all employees having the same salary as Karen Colmenares.
SELECT FIRST_NAME,LAST_NAME,JOB_ID,SALARY
FROM EMPLOYEES
WHERE SALARY =
(SELECT SALARY FROM EMPLOYEES
WHERE FIRST_NAME='Karen' AND last_name='Colmenares');

--Create a query which returns first name, department id, and job title for all employees enrolled under location number 1700 and 2400;
SELECT FIRST_NAME,DEPARTMENT_ID,JOB_ID
FROM MYCODE
WHERE DEPARTMENT_ID IN
(SELECT DEPARTMENT_ID FROM DEPARTMENTS where location_id in (1700,2400));

--Display a list of employees (comprising id, first name, and salary columns) who earn more than the average salary.
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY
FROM MYCODE
WHERE SALARY > 
(SELECT AVG(SALARY) FROM EMPLOYEES);

--7. Display name and department number of employees who report to Steven King.
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID
FROM EMPLOYEES
WHERE MANAGER_ID IN 
(SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE first_name='Steven' and last_name='King');

--Create a query which displays name of employees with their department names aS FOLLOWS:
Select e.first_name||' '||e.last_name EMPLOYEE,d.department_name DEPARTMENT
from employees e, departments d
where e.department_id = d.department_id;

--USING ON
Select e.first_name||' '||e.last_name EMPLOYEE,d.department_name DEPARTMENT
from employees e JOIN  departments d
ON e.department_id = d.department_id;

--JOIN WITH USING 
Select e.first_name||' '||e.last_name EMPLOYEE,d.department_name DEPARTMENT
from employees e JOIN  departments d
USING(department_id);

--7. Write a query to display the name of employees and department names for John.
SELECT E.FIRST_NAME||' '||E.LAST_NAME AS NAME,D.DEPARTMENT_NAME DEPT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.department_ID=D.department_ID
WHERE E.FIRST_NAME='John';

-- Form a statement which shows the first name, department name, and city (from the
--Locations table) of all employees who earn a commission.
SELECT E.FIRST_NAME,D.DEPARTMENT_NAME,L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
JOIN LOCATIONS L
ON D.LOCATION_ID=L.LOCATION_ID
WHERE E.COMMISSION_PCT IS NOT NULL;

--Form a statement by joining Countries and Locations tables to display the
--following output. Use the OUTERJOIN operator to find missing countries in the Locations table.
Select c.country_id, c.country_name, l.city
from countries c 
INNER JOIN locations l 
ON c.country_id=l.country_id(+)
order by c.country_id;




