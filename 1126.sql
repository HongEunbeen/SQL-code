--������ sales�� �ּ� �� �� �̻��� ������� �޿��� ���� �޴� ����� �̸�, �޿�, �����ڵ带 �޿� ������ ��ȸ
--min()�� ����
SELECT FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE SALARY > ANY (SELECT SALARY FROM EMPLOYEES JOIN JOBS USING (JOB_ID) WHERE JOB_TITLE LIKE '%sales%' OR JOB_TITLE LIKE '%Sales%')
ORDER BY SALARY;

--IN������ - ���������� ��°���� �ϳ��� ��ġ�ϸ� ���� �ȴ�.
--ALL ������ - ���������� ��°���� ��� ��ġ�ϸ� ���̵ȴ�.
--ANY, SOME ������ - ���������� ��°���� �ϳ��̻��� ������ �����ϸ� ���� �ȴ�.

SELECT FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE SALARY > ALL (SELECT SALARY FROM EMPLOYEES JOIN JOBS USING (JOB_ID) WHERE JOB_TITLE LIKE '%sales%' OR JOB_TITLE LIKE '%Sales%')
ORDER BY SALARY;






