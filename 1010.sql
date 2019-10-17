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

--JOIN은 여러개가 함께 사용된다.
--사원번호, 사원이름, 사원의 관리자번호, 관리자이름 조회 + (self join + outer join)
SELECT emp.employee_id 사원번호, emp.first_name 사원명, emp.manager_id 관리자번호, man.first_name 관리자명
FROM employees emp, employees man 
WHERE emp.manager_id=man.employee_id(+)
ORDER BY 1;

--사원명 뒤에 '관리자는' 문자열을 결합하여 관리자명(관리자정보)이 나오도록 조회(관리자가 없는 사원도 결과에 나오도록 한다) 하여 사원명 순으로 정렬
--(self join + outer join)
SELECT emp.first_name || ' 관리자는 '|| NVL(man.first_name,'없음') AS 관리자정보
FROM employees emp, employees man 
WHERE emp.manager_id=man.employee_id(+)
ORDER BY 1;

--지금까지 JOIN은 ORACLE에서만 사용할 수 있는 JOIN

--공통적으로 사용하는 JOIN
--ANSL JOIN
--CROSS JOIN, NATURAL JOIN, JOIN USING, JOIN ON, LEFT|RIGHT|FULL OUTER JOIN ON
--USING은 같은 이름 등호일때 사용
--ON은 다른이름 등호 아닐때 사용

--NATURAL JOIN
SELECT * FROM EMPLOYEES NATURAL JOIN DEPARTMENTS;
SELECT * FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.MANAGER_ID = D.MANAGER_ID;--ORACLE JOIN
SELECT * FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID, MANAGER_ID);

--JOIN USING
SELECT * FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID);
SELECT * FROM EMPLOYEES E, DEPARTMENTS D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--JOIN ON
SELECT * FROM EMPLOYEES JOIN DEPARTMENTS ON (EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID);
SELECT * FROM EMPLOYEES E JOIN DEPARTMENTS D ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

--OUTER JOIN
SELECT * FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;
SELECT * FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;--EMPLOYEES가 기준
SELECT * FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;--DEPARTMENT가 기준

--CORSS JOIN
--카티시안 곱(2997개)
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_NAME FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D;
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_NAME FROM EMPLOYEES E, DEPARTMENTS D;

--NATURAL JOIN
SELECT * FROM JOBS NATURAL JOIN JOB_HISTORY;











