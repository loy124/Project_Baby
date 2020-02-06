CREATE TABLE SITTER_MEMBER
(
    ID                 VARCHAR2(30)      NOT NULL, 
    LICENSE            VARCHAR2(20)      NULL, 
    WANT_PAY           VARCHAR2(50)         NULL, 
    CAREER             VARCHAR2(40)      NULL, 
    HIRE_DATE          DATE              NULL, 
    EXPIRE_DATE        DATE              NULL, 
    PROFILE_PHOTO      VARCHAR2(2000)    NULL, 
    INTRODUCE          VARCHAR2(300)     NULL, 
    START_WORK_DATE    DATE              NULL, 
    END_WORK_DATE      DATE              NULL, 
    WANT_DATE          VARCHAR2(10)      NULL, 
    WANT_LOCAL         VARCHAR2(40)      NULL, 
    WANT_TIME          VARCHAR2(30)      NULL   
);

ALTER TABLE SITTER_MEMBER
    ADD CONSTRAINT FK_SITTER_MEMBER_ID_BABY_MEMBE FOREIGN KEY (ID)
        REFERENCES BABY_MEMBER (ID);
        