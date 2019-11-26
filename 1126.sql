--업무가 sales인 최소 한 명 이상의 사원보다 급여를 많이 받는 사원의 이름, 급여, 업무코드를 급여 순으로 조회
--min()과 같다
SELECT FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE SALARY > ANY (SELECT SALARY FROM EMPLOYEES JOIN JOBS USING (JOB_ID) WHERE JOB_TITLE LIKE '%sales%' OR JOB_TITLE LIKE '%Sales%')
ORDER BY SALARY;

--IN연산자 - 서브쿼리의 출력결과중 하나라도 일치하면 참이 된다.
--ALL 연산자 - 서브쿼리의 출력결과와 모두 일치하면 참이된다.
--ANY, SOME 연산자 - 서브쿼리의 출력결과와 하나이상의 조건이 만족하면 참이 된다.

SELECT FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE SALARY > ALL (SELECT SALARY FROM EMPLOYEES JOIN JOBS USING (JOB_ID) WHERE JOB_TITLE LIKE '%sales%' OR JOB_TITLE LIKE '%Sales%')
ORDER BY SALARY;






