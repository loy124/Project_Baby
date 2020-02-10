drop table BABY_MEMBER CASCADE CONSTRAINTS;


select * from BABY_MEMBER;

CREATE TABLE BABY_MEMBER
(
    ID                    VARCHAR2(30)      NOT NULL, 
    PASSWORD              VARCHAR2(30)      NOT NULL, 
    NAME                  VARCHAR2(20)      NOT NULL, 
    AGE                   NUMBER(3)         NULL, 
    GENDER                VARCHAR2(5)       NULL, 
    ADDRESS               VARCHAR2(80)      NULL, 
    MONEY                 VARCHAR2(200)     NULL, 
    PHONE_NUMBER          VARCHAR2(30)      NULL, 
    BANK_ACCOUNT          VARCHAR2(200)     NULL, 
    BANK_ACCOUNT_MONEY    VARCHAR2(200)     NULL, 
    AUTH                  NUMBER(4)         NOT NULL, 
    POINT                 VARCHAR2(200)     NULL, 
    CUSTOMER_REQUEST_DATE  DATE              NULL, 
    REGISTER_DATE         DATE              NOT NULL, 
    UN_REGISTER_DATE      DATE              NULL, 
    LICENSE               VARCHAR2(20)      NULL, 
    WANT_PAY              VARCHAR2(50)      NULL, 
    CAREER                VARCHAR2(40)      NULL, 
    HIRE_DATE             DATE              NULL, 
    EXPIRE_DATE           DATE              NULL, 
    PROFILE_PHOTO         VARCHAR2(2000)    NULL, 
    INTRODUCE             VARCHAR2(300)     NULL, 
    START_WORK_DATE       DATE              NULL, 
    END_WORK_DATE         DATE              NULL, 
    WANT_DATE             VARCHAR2(50)      NULL, 
    WANT_LOCAL            VARCHAR2(40)      NULL, 
    WANT_TIME             VARCHAR2(30)      NULL, 
    CONSTRAINT BABY_MEMBER_PK PRIMARY KEY (ID)
);

INSERT INTO BABY_MEMBER(ID, PASSWORD, NAME, AUTH, REGISTER_DATE) VALUES('ADMIN', 'ADMIN', '관리자', 1, SYSDATE);
INSERT INTO BABY_MEMBER(ID, PASSWORD, NAME, AUTH, REGISTER_DATE) VALUES('admin', 'admin', '관리자', 1, SYSDATE);

select * from baby_member where id = 'dhsdb1541@naver.com';