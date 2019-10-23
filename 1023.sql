--JOIN~USING
--EMPLOYEES, DEPARTMENTS 테이블을 이용해 사원명, 부서번호, 부서명을 USING 절을 이용해서 조회
--USING에서도 QUALIFIER를 사용하면 안된다.
SELECT  FIRST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME 
FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID);

SELECT  FIRST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME 
FROM EMPLOYEES NATURAL JOIN DEPARTMENTS;
--NATURAL 과 USING은 같이 사용하지 않는다.

--JOIN~ON
--DEPARTMENTS, LOCATIONS 테이블을 이용해 부서번호, 부서명, 지역코드, 도시 정보를 USING 절을 이용해서 조회
--(단, 부서번호 20,50,80,110번만 부서번호 순으로 조회)
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID, CITY
FROM DEPARTMENTS JOIN LOCATIONS USING (LOCATION_ID)
WHERE DEPARTMENT_ID IN (20,50,80,110)
ORDER BY DEPARTMENT_ID;

--사원명, 부서명, 근무도시 정보 조회(USING절 사용)
SELECT FIRST_NAME, DEPARTMENT_NAME, CITY
FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID) JOIN LOCATIONS USING (LOCATION_ID);


