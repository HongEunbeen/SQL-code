--equi join(110)(emp�� null 1�� dept�� null 16��)
SELECT employee_id, first_name, job_id, emp.department_id, dept.department_id, department_name 
FROM employees emp, departments dept 
WHERE emp.department_id=dept.department_id;

--outer join(���� ���̺� �ִ� ���� �� ������ ������ 111)
SELECT employee_id, first_name, job_id, emp.department_id, dept.department_id, department_name 
FROM employees emp, departments dept 
WHERE emp.department_id=dept.department_id(+);

--outer join(���� ���̺� �ִ� ���� �� ������ ������ 126)
SELECT employee_id, first_name, job_id, emp.department_id, dept.department_id, department_name 
FROM employees emp, departments dept 
WHERE emp.department_id(+)=dept.department_id;

--full outer join (��� null�� �߰��ȴ�. 127(equi join ��� + equi join ��� �� null + equi join ��� �� null ))
--UNOIN�� �������̴�.
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

--OUTER JOIN(27 - DEPT NULL ���� X)
SELECT department_id, department_name, loc.location_id, city
FROM departments dept, locations loc
WHERE dept.location_id=loc.location_id(+); 

--OUTER JOIN(43 - LOC NULL 16�� ����)
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

--�޿��� 2000���� ���� �޴� ������� �̸�, �޿�, �μ���ȣ, �μ��� ��ȸ(��� �μ����̺� ����)
SELECT E.FIRST_NAME, E.SALARY, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E ,DEPARTMENTS D
WHERE  E.SALARY(+) > 2000 and E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID;

--SELF JOIN
SELECT emp.employee_id �����ȣ, emp.first_name �����, emp.manager_id �����ڹ�ȣ, man.first_name �����ڸ�
FROM employees emp, employees man 
WHERE emp.first_name='Ellen' AND emp.manager_id=man.employee_id; 

--�����ȣ, ����̸�, ����� �����ڹ�ȣ, �������̸� ��ȸ
SELECT emp.employee_id �����ȣ, emp.first_name �����, emp.manager_id �����ڹ�ȣ, man.first_name �����ڸ�
FROM employees emp, employees man 
WHERE emp.manager_id=man.employee_id; 

--�����ں� �����ϴ� ��� �ο���
SELECT man.first_name �����ڸ�, COUNT(*)
FROM employees emp, employees man 
WHERE emp.manager_id=man.employee_id
GROUP BY MAN.first_name
ORDER BY 1;
    --join���� ���
    SELECT manager_id, COUNT(*)
    FROM employees
    GROUP BY manager_id
    ORDER BY 1;

--Steven�� �������� �ʴ� ����� ã��1
SELECT man.first_name �����ڸ�, COUNT(*), man.manager_id
FROM employees emp, employees man 
WHERE emp.manager_id=man.employee_id AND MAN.MANAGER_ID NOT IN (SELECT EMPLOYEE_ID FROM employees WHERE manager_id IS NULL)
GROUP BY MAN.first_name,man.manager_id;

--Steven�� �������� �ʴ� ����� ã��2
SELECT man.first_name �����ڸ�, COUNT(*), man.manager_id
FROM employees emp, employees man 
WHERE emp.manager_id=man.employee_id AND MAN.MANAGER_ID NOT IN (SELECT EMPLOYEE_ID FROM employees WHERE FIRST_NAME = 'Steven')
GROUP BY MAN.first_name,man.manager_id;

SELECT * FROM employees
WHERE FIRST_NAME = 'Steven';

















