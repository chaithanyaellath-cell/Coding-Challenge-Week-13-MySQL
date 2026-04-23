create database emp;
use emp;
create table Employee ( 
Employee_id int AUTO_INCREMENT PRIMARY KEY, 
First_name VARCHAR(50), 
Last_name VARCHAR(50), 
Salary int, 
Joining_date Date, 
Departement VARCHAR(50));
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date, Departement) VALUES
(1, 'Bob', 'Kinto', 1000000, '2019-01-20', 'Finance'),
(2, 'Jerry', 'Kansxo', 6000000, '2019-01-15', 'IT'),
(3, 'Philip', 'Jose', 8900000, '2019-02-05', 'Banking'),
(4, 'John', 'Abraham', 2000000, '2019-02-25', 'Insurance'),
(5, 'Michael', 'Mathew', 2200000, '2019-02-28', 'Finance'),
(6, 'Alex', 'chreketo', 4000000, '2019-05-10', 'IT'),
(7, 'Yohan', 'Soso', 1230000, '2019-06-20', 'Banking');
select * from Employee;
###########################################################################################################################################
create table reward (
Employee_ref_id INT, 
    date_reward DATE, 
    amount INT, 
    FOREIGN KEY (Employee_ref_id) 
    REFERENCES Employee(Employee_id) 
);
INSERT INTO reward (Employee_ref_id, date_reward, amount) VALUES
(1, '2019-05-11', 1000),
(2, '2019-02-15', 5000),
(3, '2019-04-22', 2000),
(1, '2019-06-20', 8000);
select * from reward;
#############################################################################################################################################
-- length of the text in the “First_name” column.
select First_name ,length(First_name) as name_length from employee; 
#############################################################################################################################################
-- employee’s first name after replacing ‘o’ with ‘#’.
select replace(First_name,'o','#') as modified_name from employee;
#############################################################################################################################################
-- employee’s last name and first name in a single column separated by a ‘_’.
select concat(First_name,'_',Last_name) as full_name from employee;
#############################################################################################################################################
-- year, month, and day from the “Joining_date” column.
select year(Joining_date) as year,
month(Joining_date) as month,
day(Joining_date) as day from employee;
#############################################################################################################################################
-- all employees in ascending order by first name. 
select * from employee order by First_name asc;
#############################################################################################################################################
-- all employees in descending order by first name. 
select * from employee order by First_name desc;
#############################################################################################################################################
-- all employees in ascending order by first name and descending order by salary.
select * from employee order by First_name asc,Salary desc;
#############################################################################################################################################
-- employees whose first name is “Bob”.
select * from employee where First_name ='Bob';
#############################################################################################################################################
-- employees whose first name is “Bob” or “Alex”. 
select * from employee where First_name in ('Bob','Alex');
#############################################################################################################################################
 -- employees whose first name is neither “Bob” nor “Alex”.
 select * from employee where First_name not in ('Bob','Alex');
 ############################################################################################################################################
 -- employees whose first name begins with ‘B’.
 select * from employee where First_name like 'B%';
 ############################################################################################################################################
 -- employees whose first name contains ‘o’. 
 select * from employee where First_name like '%o%';
 ############################################################################################################################################
  --  employees whose first name ends with ‘n’. 
  select * from employee where First_name like '%n';
  ###########################################################################################################################################
  -- employees whose first name ends with ‘n’ and contains 4 letters.
  select * from employee where First_name like '___n';
  ###########################################################################################################################################
  -- employees whose first name begins with ‘J’ and contains 4 letters.
  select * from employee where First_name like 'j___';
  ###########################################################################################################################################
  -- employees whose salary is over 3,000,000. 
  select * from employee where Salary > 3000000;
  ###########################################################################################################################################
  -- employees whose salary is less than 3,000,000. 
  select * from employee where Salary < 3000000;
  ###########################################################################################################################################
   -- employees with a salary between 2,000,000 and 5,000,000.
   select * from employee where salary between 2000000 and 5000000;
  ##########################################################################################################################################
  -- employees whose joining year is “2019”. 
  select * from employee where year(Joining_date)=2019;
  ###########################################################################################################################################
  -- employees whose participation month (Joining_date) is “January”
  select * from employee where month(Joining_date)=1;
  ###########################################################################################################################################
  -- employees who joined before March 1, 2019 
  select * from employee where Joining_date < '2019-03-01';
  ###########################################################################################################################################
  -- employees who joined after March 31, 2019 
  select * from employee where Joining_date > '2019-03-31';
  ###########################################################################################################################################
   -- date and time of the employee’s enrollment.
   select now() as current_datetime;
  ##########################################################################################################################################
  -- date and time, including milliseconds of the employee’s membership.
  select current_timestamp(3);
  ##########################################################################################################################################
  -- difference between the “Joining_date” and “date_reward” column
  select e.First_name, datediff(r.date_reward,e.Joining_date) as days_difference from employee e
  join reward r on e.Employee_id = r.Employee_ref_id;
  ###########################################################################################################################################
 --  current date and time.
 select now();
 ############################################################################################################################################
  -- first names of employees who have the character ‘%’. Example: ‘Jack%’.
select First_name 
from Employee 
where First_name like '%\%%';

INSERT INTO Employee 
(Employee_id, First_name, Last_name, Salary, Joining_date, Departement)
VALUES
(8, 'Jack%', 'Thomas', 3000000, '2019-07-10', 'IT');
-- run qery again you will get Jack%
#############################################################################################################################################
-- employee name (Last_name) after replacing the special character with white space.    
select replace(Last_name,'%',' ') as cleaned_name from employee;
#############################################################################################################################################
-- employee’s department and total salary, grouped by department.
select Departement ,sum(Salary) as total_salary
from employee group by Departement;
#############################################################################################################################################
