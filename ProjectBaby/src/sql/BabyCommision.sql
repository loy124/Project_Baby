drop table BABY_COMMISSION CASCADE CONSTRAINTS;

CREATE TABLE BABY_COMMISSION
(
    ID            VARCHAR2(300)    NOT NULL, 
    COMMISSION    VARCHAR2(3000)    NULL,
    
    
)

select * from BABY_COMMISSION;

ALTER TABLE BABY_COMMISSION
    ADD CONSTRAINT FK_BABY_COMMISSION_ID_BABY_MEM FOREIGN KEY (ID)
     
이름 =1111


favorites
나이: 11
희망시급 : 기재되지 않음
후기: 기재되지 않음
안전 보험 뱃지
최근 고용일자 :2020-02-13 15:01:40.0   REFERENCES BABY_MEMBER (ID)