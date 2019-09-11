SELECT * FROM TAB;
SELECT * FROM DICT;
SELECT * FROM user_indexes;

-- ����� ���� �Լ�
--�Լ��� ����� ��� - CREATE FUNCTION
-- �Ű� ���� ���� ����
--�Լ��� ��� ���� �� �� �ֱ� ������ OR REPLACE
CREATE OR REPLACE FUNCTION fnSum(n IN NUMBER) -- HEADER
RETURN NUMBER
IS --���� ����
    s NUMBER:=0; --�ʱⰪ(:=�� ==�� ���� ���̴�.)
    BEGIN
        FOR i IN 1..n LOOP s:=s+i; END LOOP;
        RETURN s;
        --for(int i = 0; i< n i++)
    END;
/
SELECT fnSum(100) FROM dual;

--�ֹι�ȣ �Է� ���� ��ȸ

CREATE OR REPLACE FUNCTION fnGender(sn IN VARCHAR) -- HEADER
RETURN VARCHAR
IS --���� ����
    -- ���� ����
    g VARCHAR(6):='����';--�ʱ�ȭ
    BEGIN
        IF LENGTH(SN) != 13 THEN RAISE_APPLICATION_ERROR(-20000, '�ֹι�ȣ�� 13�ڸ� �Դϴ�.'); END IF;
        IF MOD(SUBSTR(SN,7,1),2)=1 THEN g:='����'; END IF;--1,3 �̸� ���� 2,4�� ���� 
        RETURN g;
    END;
/
SELECT fngender('0107104000000') FROM DUAL;--����ǥ�� ���� ������ �ϴ� ������ 13�ڸ��ε� ó�� ���ڰ� 0�̸� �ڵ������� ���� �Ǳ� �������� ���� �־�� �Ѵ�.



CREATE OR REPLACE FUNCTION fnBirth(sn IN VARCHAR) -- HEADER
RETURN DATE
IS --���� ����
    BEGIN
        IF LENGTH(SN) != 13 THEN RAISE_APPLICATION_ERROR(-20000, '�ֹι�ȣ�� 13�ڸ� �Դϴ�.'); END IF;
        RETURN TO_DATE(SUBSTR(SN, 1, 6), 'RRMMDD');
    END;
/
SELECT fnBirth('0107104000000') FROM DUAL;--����ǥ�� ���� ������ �ϴ� ������ 13�ڸ��ε� ó�� ���ڰ� 0�̸� �ڵ������� ���� �Ǳ� �������� ���� �־�� �Ѵ�.

CREATE OR REPLACE FUNCTION fnAge(sn IN VARCHAR) -- HEADER
RETURN NUMBER
IS --���� ����
    BEGIN
        IF LENGTH(SN) != 13 THEN RAISE_APPLICATION_ERROR(-20000, '�ֹι�ȣ�� 13�ڸ� �Դϴ�.'); END IF;
        RETURN TO_NUMBER(TO_CHAR(SYSDATE, 'RRRR') - TO_CHAR(fnBirth(SN), 'RRRR'));
    END;
/
SELECT fnAge('0107104000000') FROM DUAL;

--Ʈ����
CREATE TABLE TR_MAIN( ID VARCHAR(1), VALUE VARCHAR(10));
CREATE TABLE TR_SUB( ID VARCHAR(1), VALUE VARCHAR(10));
SELECT * FROM TR_MAIN;
SELECT * FROM TR_SUB;
CREATE OR REPLACE TRIGGER TR_MAIN_SUB
    AFTER INSERT ON TR_MAIN  --TR_MAIN�� INSERT�� ���� �Ŀ�
    FOR EACH ROW -- �� �ึ�� Ȯ��
    BEGIN--INSERT �� �Ͼ�� ���� �� ��
        INSERT INTO TR_SUB(ID, VALUE) VALUES (:NEW.ID, :NEW.VALUE);--���� ���� �����͸� TR_SUB�� �־�� �ϱ� ������ :NEW, ������ ���� ���� �ǹ��ϴ� ���� :OLD
    END;
/
INSERT INTO TR_MAIN(ID, VALUE) VALUES ('1', 'TEST');
INSERT INTO TR_MAIN(ID, VALUE) VALUES ('2', 'AAAA');

--Ʈ���� ���º� ���� �ο� üũ
CREATE TABLE STDTBL( NAME VARCHAR(20) NOT NULL, SUBJECT VARCHAR(10));
CREATE TABLE SUBTBL( SUBJECT VARCHAR(10), CNT NUMBER(3) DEFAULT 0);--CNT�ʱⰪ�� 0���� �־���.
SELECT * FROM STDTBL;
SELECT * FROM SUBTBL;
INSERT INTO SUBTBL(SUBJECT) VALUES ('��ǻ��');
INSERT INTO SUBTBL(SUBJECT) VALUES ('������');
INSERT INTO SUBTBL(SUBJECT) VALUES ('�濵');--DEFALUT�� �ֱ� ������ CNT�� ���Ծ� ���־ �ȴ�.

CREATE OR REPLACE TRIGGER SUB_TRG
    AFTER INSERT ON STDTBL  --TR_MAIN�� INSERT�� ���� �Ŀ�
    FOR EACH ROW -- �� �ึ�� Ȯ��
    BEGIN--INSERT �� �Ͼ�� ���� �� ��
        DBMS_OUTPUT.PUT_line('�л��� �߰��Ǿ����ϴ�.');-- �޽��� ���� ���
        UPDATE SUBTBL SET CNT = CNT + 1 WHERE SUBJECT = :NEW.SUBJECT;
    END;
/
SET SERVEROUTPUT ON;--�޽����� ���� ���ؼ� ���� ���Ѿ� ��
INSERT INTO STDTBL(NAME, SUBJECT) VALUES ('������','��ǻ��');
INSERT INTO STDTBL(NAME, SUBJECT) VALUES ('�����','��ǻ��');
INSERT INTO STDTBL(NAME, SUBJECT) VALUES ('������','������');
INSERT INTO STDTBL(NAME, SUBJECT) VALUES ('�۾���','�濵');
INSERT INTO STDTBL(NAME, SUBJECT) VALUES ('���Ƹ�','�濵');
INSERT INTO STDTBL(NAME, SUBJECT) VALUES ('aa','�濵');