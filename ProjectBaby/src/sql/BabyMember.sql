CREATE TABLE BABY_MEMBER
(
    ID                    VARCHAR2(30)     NOT NULL, 
    PASSWORD              VARCHAR2(30)     NOT NULL, 
    NAME                  VARCHAR2(20)     NOT NULL, 
    AGE                   NUMBER(3)        NULL, 
    GENDER                VARCHAR2(5)      NULL, 
    ADDRESS               VARCHAR2(80)     NULL, 
    MONEY                 VARCHAR2(200)    NULL, 
    PHONE_NUMBER          VARCHAR2(30)     NULL, 
    BANK_ACCOUNT          VARCHAR2(200)    NULL, 
    BANK_ACCOUNT_MONEY    VARCHAR2(200)       NULL, 
    AUTH                  NUMBER(4)        NOT NULL, 
    POINT                 VARCHAR2(200)       NULL, 
    CUSTOMER_REQUEST    DATE             NULL, 
    REGISTER_DATE         DATE             NOT NULL, 
    UN_REGISTER_DATE      DATE             NULL, 
    CONSTRAINT BABY_MEMBER_PK PRIMARY KEY (ID)
)