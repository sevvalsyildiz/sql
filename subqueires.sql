SELECT first_name, last_name 
FROM employees.employees
join employees.dept_manager on dept_manager.emp_no = employees.emp_no
;

SELECT 
    e.first_name, e.last_name
FROM
    employees.employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            employees.dept_manager dm); 
            
/*Extract the information about all department managers who were hired between 
the 1st of January 1990 and the 1st of January 1995. */
              /*  SQL SUB QUEIRES IN embedded inside WHERE */
SELECT 
    *
FROM
    employees.dept_manager dm
WHERE
    dm.emp_no IN (SELECT 
            e.emp_no
        FROM
            employees.employees e
        WHERE
            hire_date BETWEEN '01.01.1990' AND '01.06.2000');
            
            /* SUB QUERIES EXIST- NOT EXISTS nested inside WHERE */
/* it returns a boolean value exists = true not =F
Select the entire information for all employees whose job title is “Assistant Engineer”. 
 */
 SELECT
    *
FROM
    employees.employees e
WHERE
    e.emp_no IN ( SELECT
            t.emp_no
        FROM
            employees.titles t
        WHERE
title = 'Assistant Engineer'); 

SELECT 
    *
FROM
    employees.employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            employees.titles t
        WHERE
            t.emp_no = e.emp_no
                AND title = 'Assistant Engineer');
                
                /* SUB QUERIES NESTED IN SELECT FROM */
/* 110022yi 10020nin manageri , 110039u da 10021-10040in manageri yap.*/
Insert INTO emp_manager SELECT 
U.* FROM 
(SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    employees.dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees.employees e
    JOIN employees.dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
    UNION 
    SELECT 
    B.*
FROM 
    ( SELECT e.emp_no AS employee_id ,
    MIN(de.dept_no) AS department_code,
    (SELECT 
            emp_no
        FROM
            employees.dept_manager
        WHERE
            emp_no = 110039) AS manager_ID
	FROM  employees.employees e JOIN employees.dept_emp de ON e.emp_no = de.emp_no
    WHERE e.emp_no BETWEEN 10021 AND 10040 GROUP BY e.emp_no ORDER BY e.emp_no)  AS B
    UNION 
    SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    employees.dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees.employees e
    JOIN employees.dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022 
            GROUP BY e.emp_no) AS C
        UNION
    
    SELECT 
    D.*
FROM 
(SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    employees.dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees.employees e
    JOIN employees.dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039 GROUP BY e.emp_no) AS D ) AS U;


    
    
