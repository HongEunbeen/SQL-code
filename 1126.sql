--������ sales�� �ּ� �� �� �̻��� ������� �޿��� ���� �޴� ����� �̸�, �޿�, �����ڵ带 �޿� ������ ��ȸ
SELECT FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE SALARY > ANY (SELECT SALARY FROM EMPLOYEES JOIN JOBS USING (JOB_ID) WHERE JOB_TITLE LIKE '%sales%' OR JOB_TITLE LIKE 'Sales%')
ORDER BY SALARY;