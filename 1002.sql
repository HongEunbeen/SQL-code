--equi join(110)(emp는 null 1개 dept는 null 16개)
SELECT employee_id, first_name, job_id, emp.department_id, dept.department_id, department_name 
FROM employees emp, departments dept 
WHERE emp.department_id=dept.department_id;

--outer join(기준 테이블에 있느 값은 다 나오기 때문에 111)
SELECT employee_id, first_name, job_id, emp.department_id, dept.department_id, department_name 
FROM employees emp, departments dept 
WHERE emp.department_id=dept.department_id(+);

--outer join(기준 테이블에 있느 값은 다 나오기 때문에 126)
SELECT employee_id, first_name, job_id, emp.department_id, dept.department_id, department_name 
FROM employees emp, departments dept 
WHERE emp.department_id(+)=dept.department_id;

--full outer join (모든 null이 추가된다. 127(equi join 결과 + equi join 결과 값 null + equi join 결과 값 null ))
--UNOIN은 합집합이다.
SELECT employee_id, first_name, job_id, emp.department_id, dept.department_id, department_name 
FROM employees emp, departments dept 
WHERE emp.department_id=dept.department_id(+) 
UNION SELECT employee_id, first_name, job_id, emp.department_id, dept.department_id, department_name
FROM employees emp, departments dept
WHERE emp.department_id(+)=dept.department_id;

--EQUI JOIN(27)
SELECT department_id, department_name, loc.location_id, city
FROM departments dept, locations loc
WHERE dept.location_id=loc.location_id; 

--OUTER JOIN(27 - DEPT NULL 존재 X)
SELECT department_id, department_name, loc.location_id, city
FROM departments dept, locations loc
WHERE dept.location_id=loc.location_id(+); 

--OUTER JOIN(43 - LOC NULL 16개 존재)
SELECT department_id, department_name, loc.location_id, city
FROM departments dept, locations loc
WHERE dept.location_id(+)=loc.location_id; 

--FULL OUTER JOIN(43)
SELECT department_id, department_name, loc.location_id, city
FROM departments dept, locations loc
WHERE dept.location_id(+)=loc.location_id
UNION SELECT department_id, department_name, loc.location_id, city
FROM departments dept, locations loc
WHERE dept.location_id=loc.location_id(+);

--급여를 2000보다 많이 받는 사원들의 이름, 급여, 부서번호, 부서명 조회(모든 부서테이블 조인)
SELECT E.FIRST_NAME, E.SALARY, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E ,DEPARTMENTS D
WHERE  E.SALARY(+) > 2000 and E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID;

--SELF JOIN
SELECT emp.employee_id 사원번호, emp.first_name 사원명, emp.manager_id 관리자번호, man.first_name 관리자명
FROM employees emp, employees man 
WHERE emp.first_name='Ellen' AND emp.manager_id=man.employee_id; 

--사원번호, 사원이름, 사원의 관리자번호, 관리자이름 조회
SELECT emp.employee_id 사원번호, emp.first_name 사원명, emp.manager_id 관리자번호, man.first_name 관리자명
FROM employees emp, employees man 
WHERE emp.manager_id=man.employee_id; 

--관리자별 관리하는 사람 인원수
SELECT man.first_name 관리자명, COUNT(*)
FROM employees emp, employees man 
WHERE emp.manager_id=man.employee_id
GROUP BY MAN.first_name
ORDER BY 1;
    --join없앤 결과
    SELECT manager_id, COUNT(*)
    FROM employees
    GROUP BY manager_id
    ORDER BY 1;

--Steven이 관리하지 않는 사람들 찾기1
SELECT man.first_name 관리자명, COUNT(*), man.manager_id
FROM employees emp, employees man 
WHERE emp.manager_id=man.employee_id AND MAN.MANAGER_ID NOT IN (SELECT EMPLOYEE_ID FROM employees WHERE manager_id IS NULL)
GROUP BY MAN.first_name,man.manager_id;

--Steven이 관리하지 않는 사람들 찾기2
SELECT man.first_name 관리자명, COUNT(*), man.manager_id
FROM employees emp, employees man 
WHERE emp.manager_id=man.employee_id AND MAN.MANAGER_ID NOT IN (SELECT EMPLOYEE_ID FROM employees WHERE FIRST_NAME = 'Steven')
GROUP BY MAN.first_name,man.manager_id;

SELECT * FROM employees
WHERE FIRST_NAME = 'Steven';

















