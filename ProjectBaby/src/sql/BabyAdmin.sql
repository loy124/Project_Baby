drop table BABY_ADMIN CASCADE CONSTRAINTS;
DROP SEQUENCE BABY_ADMIN_SEQ;

CREATE TABLE BABY_ADMIN
(
    SEQ        NUMBER(30)        NOT NULL, 
    ID         VARCHAR2(300)     NULL, 
    TITLE      VARCHAR2(200)     NULL, 
    CONTENT    VARCHAR2(2000)    NULL, 
    DEL        NUMBER(30)        NULL   
);

CREATE SEQUENCE BABY_ADMIN_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE BABY_ADMIN
    ADD CONSTRAINT FK_BABY_ADMIN_ID_BABY_MEMBER_I FOREIGN KEY (ID)
        REFERENCES BABY_MEMBER (ID)


CREATE OR REPLACE TRIGGER BABY_ADMIN_AI_TRG
BEFORE INSERT ON BABY_ADMIN 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT BABY_ADMIN_SEQ.NEXTVAL
    INTO :NEW.SEQ
    FROM DUAL;
END;

