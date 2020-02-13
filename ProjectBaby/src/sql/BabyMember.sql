drop table BABY_MEMBER CASCADE CONSTRAINTS;


select * from BABY_MEMBER;

CREATE TABLE BABY_MEMBER
(
    ID                    VARCHAR2(300)      NOT NULL, 
    PASSWORD              VARCHAR2(300)      NOT NULL, 
    NAME                  VARCHAR2(200)      NOT NULL, 
    AGE                   NUMBER(30)         NULL, 
    GENDER                VARCHAR2(50)       NULL, 
    ADDRESS               VARCHAR2(800)      NULL, 
    MONEY                 VARCHAR2(2000)     NULL, 
    PHONE_NUMBER          VARCHAR2(300)      NULL, 
    BANK_ACCOUNT          VARCHAR2(2000)     NULL, 
    BANK_ACCOUNT_MONEY    VARCHAR2(2000)     NULL, 
    AUTH                  NUMBER(30)         NOT NULL, 
    POINT                 VARCHAR2(2000)     NULL, 
    CUSTOMER_REQUEST_DATE  DATE              NULL, 
    REGISTER_DATE         DATE              NOT NULL, 
    UN_REGISTER_DATE      DATE              NULL, 
    LICENSE               VARCHAR2(200)      NULL, 
    WANT_PAY              VARCHAR2(500)      NULL, 
    CAREER                VARCHAR2(400)      NULL, 
    HIRE_DATE             DATE              NULL, 
    EXPIRE_DATE           DATE              NULL, 
    PROFILE_PHOTO         VARCHAR2(2000)    NULL, 
    INTRODUCE             VARCHAR2(3000)     NULL, 
    START_WORK_DATE       DATE              NULL, 
    END_WORK_DATE         DATE              NULL, 
    WANT_DATE             VARCHAR2(500)      NULL, 
    WANT_LOCAL            VARCHAR2(400)      NULL, 
    WANT_TIME             VARCHAR2(300)      NULL, 
    CONSTRAINT BABY_MEMBER_PK PRIMARY KEY (ID)
);

SELECT SUM(TO_NUMBER(NVL(POINT, 0))) FROM  BABY_MEMBER;

UPDATE BABY_MEMBER SET POINT = '9999' WHERE ID = 'admin';

INSERT INTO BABY_MEMBER(ID, PASSWORD, NAME, AUTH, REGISTER_DATE) VALUES('ADMIN', 'ADMIN', '관리자', 1, SYSDATE);
INSERT INTO BABY_MEMBER(ID, PASSWORD, NAME, AUTH, REGISTER_DATE) VALUES('admin', 'admin', '관리자', 1, SYSDATE);

select * from baby_member where id = 'dhsdb1541@naver.com';