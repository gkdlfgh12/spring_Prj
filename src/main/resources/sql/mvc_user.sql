CREATE TABLE mvc_user(
    account VARCHAR2(30) PRIMARY KEY,
    password VARCHAR2(30) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    reg_date TIMESTAMP DEFAULT SYSDATE
);
/*컬럼 추가*/
ALTER TABLE mvc_user
ADD session_id
VARCHAR2(80) DEFAULT 'none' NOT NULL;

ALTER TABLE mvc_user
ADD limit_time DATE;


-- 자동 로그인 관련 컬럼 추가
ALTER TABLE mvc_user
ADD session_id VARCHAR2(80) 
DEFAULT 'none' NOT NULL;

ALTER TABLE mvc_user
ADD limit_time DATE;
