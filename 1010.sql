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

--JOIN�� �������� �Բ� ���ȴ�.
--�����ȣ, ����̸�, ����� �����ڹ�ȣ, �������̸� ��ȸ + (self join + outer join)
SELECT emp.employee_id �����ȣ, emp.first_name �����, emp.manager_id �����ڹ�ȣ, man.first_name �����ڸ�
FROM employees emp, employees man 
WHERE emp.manager_id=man.employee_id(+)
ORDER BY 1;

--����� �ڿ� '�����ڴ�' ���ڿ��� �����Ͽ� �����ڸ�(����������)�� �������� ��ȸ(�����ڰ� ���� ����� ����� �������� �Ѵ�) �Ͽ� ����� ������ ����
--(self join + outer join)
SELECT emp.first_name || ' �����ڴ� '|| NVL(man.first_name,'����') AS ����������
FROM employees emp, employees man 
WHERE emp.manager_id=man.employee_id(+)
ORDER BY 1;

--���ݱ��� JOIN�� ORACLE������ ����� �� �ִ� JOIN

--���������� ����ϴ� JOIN
--ANSL JOIN
--CROSS JOIN, NATURAL JOIN, JOIN USING, JOIN ON, LEFT|RIGHT|FULL OUTER JOIN ON
--USING�� ���� �̸� ��ȣ�϶� ���
--ON�� �ٸ��̸� ��ȣ �ƴҶ� ���

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
SELECT * FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;--EMPLOYEES�� ����
SELECT * FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;--DEPARTMENT�� ����

--CORSS JOIN
--īƼ�þ� ��(2997��)
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_NAME FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D;
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_NAME FROM EMPLOYEES E, DEPARTMENTS D;

--NATURAL JOIN
SELECT * FROM JOBS NATURAL JOIN JOB_HISTORY;











