CREATE TABLE SITTER_BOARD
(
    SEQ                   NUMBER(8)        NOT NULL, 
    ID                    VARCHAR2(30)     NULL, 
    TITLE                 VARCHAR2(20)     NULL, 
    CONTENT               VARCHAR2(200)    NULL, 
    FILE_NAME             VARCHAR2(100)    NULL, 
    ORIGINAL_FILE_NAME    VARCHAR2(200)    NULL, 
    READCOUNT             NUMBER(8)        NULL, 
    REGISTER_DATE         DATE             NULL, 
    CONSTRAINT SITTER_BOARD_PK PRIMARY KEY (SEQ)
);

CREATE SEQUENCE SITTER_BOARD_SEQ
START WITH 1
INCREMENT BY 1;



ALTER TABLE SITTER_BOARD
    ADD CONSTRAINT FK_SITTER_BOARD_ID_BABY_MEMBER FOREIGN KEY (ID)
        REFERENCES BABY_MEMBER (ID);

        
CREATE OR REPLACE TRIGGER SITTER_BOARD_AI_TRG
BEFORE INSERT ON SITTER_BOARD 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT SITTER_BOARD_SEQ.NEXTVAL
    INTO :NEW.SEQ
    FROM DUAL;
END;