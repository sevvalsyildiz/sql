/* create a stored procedure with input parameter  

USE employees;
DROP PROCEDURE if exists emp_salary;
delimiter $$
CREATE  PROCEDURE emp_salary( in p_emp_no INTEGER)
BEGIN 
SELECT e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no 
WHERE e.emp_no = p_emp_no;
END $$  */


/* create a stored procedure with input and output parameter 

USE employees;
DROP PROCEDURE if exists emp_avg_salary_out;
delimiter $$
create procedure emp_avg_salary_out( in p_emp_no INT, out p_avg_salary decimal(10,2))
BEGIN
SELECT  AVG(s.salary)
INTO p_avg_salary FROM  employees e JOIN salaries s ON e.emp_no =s.emp_no
WHERE e.emp_no = p_emp_no ;
 END $$ */
 
 /* Create a procedure called ‘emp_info’ that uses as parameters 
 the first and the last name of an individual, and returns their employee number. 
 USE employees;
 DROP PROCEDURE if exists emp_info;
 delimiter $$
 CREATE PROCEDURE emp_info(in p_first_name varchar(14) ,in  p_last_name varchar(16) , out p_emp_no INT)
 BEGIN
 SELECT e_emp_no
 INTO p_emp_no
 FROM employees e 
 WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
 
 END$$ */
/*
SET @v_avg_salary = 0 ;
CALL employees.emp_avg_salary_out(11300,@v_avg_salary);
SELECT @v_avg_salary; */

            /* CREATE VAR.
 Create a variable, called ‘v_emp_no’, where you will store the output of the procedure
you created in the last exercise. Call the same procedure, 
inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively. 

SET @v_emp_no = 0;
CALL employees.emp_info(' Aruna', 'Journal', @v_emp_no);
SELECT @v_emp_no; */ 

