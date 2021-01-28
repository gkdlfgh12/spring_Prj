
--댓글 시퀀스
CREATE SEQUENCE board_reply_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10000
    NOCYCLE
    NOCACHE;

    
   --댓글 테이블
create table board_reply(
rno NUMBER PRIMARY KEY,
no NUMBER REFERENCES MVC_BOARD(BOARD_NO),
content VARCHAR2(700) NOT NULL,
writer VARCHAR2(30) NOT NULL,
writeDate DATE DEFAULT sysdate
);