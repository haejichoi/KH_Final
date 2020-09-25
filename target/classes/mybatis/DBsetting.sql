----- SELECT 테이블
SELECT * FROM MEMBER;
SELECT * FROM ROOM;
SELECT * FROM DETAIL;
SELECT * FROM FACILITY;
SELECT * FROM SAFETY;
SELECT * FROM USER_ALL_TABLES; 
SELECT * FROM REQUIREMENTS;
----------------------------------------------------------------------
-----SEQUENCE 제거
DROP SEQUENCE SEQ_M;
DROP SEQUENCE SEQ_H;
DROP SEQUENCE SEQ_RM;
DROP SEQUENCE SEQ_DETAIL;
DROP SEQUENCE SEQ_FACILITY;
DROP SEQUENCE SEQ_SAFETY;
DROP SEQUENCE SEQ_RULE;
DROP SEQUENCE SEQ_INTRO;
DROP SEQUENCE SEQ_RP;
DROP SEQUENCE SEQ_RE;
DROP SEQUENCE SEQ_MATE;
DROP SEQUENCE SEQ_CR;
DROP SEQUENCE SEQ_C;
DROP SEQUENCE SEQ_L;
DROP SEQUENCE SEQ_RQ;

-----SEQUENCE 생성
CREATE SEQUENCE SEQ_M NOCACHE;
CREATE SEQUENCE SEQ_H NOCACHE;
CREATE SEQUENCE SEQ_RM NOCACHE;
CREATE SEQUENCE SEQ_DETAIL NOCACHE;
CREATE SEQUENCE SEQ_FACILITY NOCACHE;
CREATE SEQUENCE SEQ_SAFETY NOCACHE;
CREATE SEQUENCE SEQ_RULE NOCACHE;
CREATE SEQUENCE SEQ_INTRO NOCACHE;
CREATE SEQUENCE SEQ_RP NOCACHE;
CREATE SEQUENCE SEQ_RE NOCACHE;
CREATE SEQUENCE SEQ_MATE NOCACHE;
CREATE SEQUENCE SEQ_CR NOCACHE;
CREATE SEQUENCE SEQ_C NOCACHE;
CREATE SEQUENCE SEQ_L NOCACHE;
CREATE SEQUENCE SEQ_RQ NOCACHE;

-----테이블 DROP 순서
DROP TABLE MATE;
DROP TABLE RESERVATION;
DROP TABLE CHAT;
DROP TABLE CHATROOM;
DROP TABLE LOVE;
DROP TABLE ROOM_P;
DROP TABLE INTRO;
DROP TABLE RULE;
DROP TABLE SAFETY;
DROP TABLE FACILITY;
DROP TABLE DETAIL;
DROP TABLE ROOM;
DROP TABLE HOST;
DROP TABLE MEMBER;
DROP TABLE REQUIREMENTS;

----------------------------------------------------------------------
-----테이블 생성
CREATE TABLE MEMBER (
	SEQ_M	NUMBER	PRIMARY KEY,
	ID	VARCHAR2(100)	NOT NULL,
	PW	VARCHAR2(50)	NOT NULL,
	NAME	VARCHAR2(15)	NOT NULL,
	GENDER	CHAR(3)	NOT NULL,
	AGE	NUMBER NOT NULL,
	EMAIL VARCHAR2(100) NOT NULL,
	PHONE	VARCHAR2(100)	NOT NULL,
	PROFILE	VARCHAR2(30),
	ROLE	VARCHAR2(20),
	CONSTRAINT MEMBER_GENDER_CHK CHECK (GENDER IN('M','F')),
	CONSTRAINT MEMBER_ROLE_CHK CHECK (ROLE IN('Y','N'))
);

---------------------------------------------------------------------
CREATE TABLE HOST (
	SEQ_H	NUMBER	PRIMARY KEY,
	SEQ_M	NUMBER	NOT NULL,
	STATE	VARCHAR2(6),
	CONSTRAINT HOST_STATE_CHK CHECK (STATE IN('Y','N')),
	CONSTRAINT FK_MEMBER_TO_HOST_1 FOREIGN KEY(SEQ_M) REFERENCES MEMBER(SEQ_M) ON DELETE CASCADE
);

---------------------------------------------------------------------
-- 체크인 시간, 체크아웃 시간 추가
CREATE TABLE ROOM (
	SEQ_RM	NUMBER	PRIMARY KEY,
	ROOM_NAME	VARCHAR2(500),
	ADDR	VARCHAR2(500),
	PERSON	NUMBER,
	PRICE	NUMBER,
	INTRO	VARCHAR2(3000),
	R_TYPE	VARCHAR2(100),
	BED_ROOM	NUMBER,
	BED	NUMBER,
	BATH_ROOM	NUMBER,
	CHECKIN	VARCHAR2(100),
	SEQ_H	NUMBER	NOT NULL,
	CHECKIN_TIME VARCHAR2(100),
	CHECKOUT_TIME VARCHAR2(100),
	CONSTRAINT FK_HOST_TO_ROOM_1 FOREIGN KEY (SEQ_H) REFERENCES HOST(SEQ_H) ON DELETE CASCADE
);

---------------------------------------------------------------------
CREATE TABLE DETAIL (
	SEQ_DETAIL	NUMBER	PRIMARY KEY,
	ESSENTIAL	VARCHAR2(100),
	HEATING	VARCHAR2(100),
	AIRCONDITION	VARCHAR2(100),
	IRON	VARCHAR2(100),
	TV	VARCHAR2(100),
	SHAMPOO	VARCHAR2(100),
	HAIRDRY	VARCHAR2(100),
	DESK	VARCHAR2(100),
	CLOSET	VARCHAR2(100),
	WIFI	VARCHAR2(100),
	SEQ_RM	NUMBER	NOT NULL,
	CONSTRAINT FK_ROOM_TO_DETAIL_1 FOREIGN KEY (SEQ_RM) REFERENCES ROOM(SEQ_RM) ON DELETE CASCADE
);

---------------------------------------------------------------------
CREATE TABLE FACILITY (
	SEQ_FACILITY	NUMBER	PRIMARY KEY,
	WASHER	VARCHAR2(100),
	DRYER	VARCHAR2(100),
	KITCHEN	VARCHAR2(100),
	POOL	VARCHAR2(100),
	FITNESS	VARCHAR2(100),
	PARKING	VARCHAR2(100),
	SEQ_RM	NUMBER	NOT NULL,
	CONSTRAINT FK_ROOM_TO_FACILITY_1 FOREIGN KEY (SEQ_RM) REFERENCES ROOM(SEQ_RM) ON DELETE CASCADE
);

---------------------------------------------------------------------
CREATE TABLE SAFETY (
	SEQ_SAFETY	NUMBER	PRIMARY KEY,
	FIRE_SENSOR	VARCHAR2(100),
	CO_SENSOR	VARCHAR2(100),
	E_KIT	VARCHAR2(100),
	FIRE_OFF	VARCHAR2(100),
	SEQ_RM	NUMBER	NOT NULL,
	CONSTRAINT FK_ROOM_TO_SAFETY_1 FOREIGN KEY (SEQ_RM) REFERENCES ROOM(SEQ_RM) ON DELETE CASCADE
);

---------------------------------------------------------------------
CREATE TABLE RULE (
	SEQ_RULE	NUMBER	PRIMARY KEY,
	KID	VARCHAR2(100),
	BABY	VARCHAR2(100),
	PET	VARCHAR2(100),
	SMOKE	VARCHAR2(100),
	PARTY	VARCHAR2(100),
	SEQ_RM	NUMBER	NOT NULL,
	CONSTRAINT FK_ROOM_TO_RULE_1 FOREIGN KEY (SEQ_RM) REFERENCES ROOM(SEQ_RM) ON DELETE CASCADE
);

---------------------------------------------------------------------
CREATE TABLE INTRO (
	SEQ_INTRO	NUMBER	PRIMARY KEY,
	TITLE	VARCHAR2(1000),
	CONTEXT	VARCHAR2(3000),
	SEQ_RM	NUMBER	NOT NULL,
	CONSTRAINT FK_ROOM_TO_INTRO_1 FOREIGN KEY (SEQ_RM) REFERENCES ROOM(SEQ_RM) ON DELETE CASCADE
);

---------------------------------------------------------------------
CREATE TABLE ROOM_P (
	SEQ_RP	NUMBER	PRIMARY KEY,
	P_PATH	VARCHAR2(2000)	NULL,
	SEQ_INTRO	NUMBER	NOT NULL,
	CONSTRAINT FK_INTRO_TO_ROOM_P_1 FOREIGN KEY (SEQ_INTRO) REFERENCES INTRO(SEQ_INTRO) ON DELETE CASCADE
);

---------------------------------------------------------------------
CREATE TABLE RESERVATION (
	SEQ_RE	NUMBER	PRIMARY KEY,
	PEOPLE	NUMBER,
	R_DATE	DATE,
	CHECK_IN	DATE	NOT NULL,
	CHECK_OUT	DATE	NOT NULL,
	SEQ_M	NUMBER	NOT NULL,
	SEQ_RM	NUMBER	NOT NULL,
	MATE	CHAR(2),
	CONSTRAINT FK_MEMBER_TO_RESERVATION_1 FOREIGN KEY (SEQ_M) REFERENCES MEMBER(SEQ_M) ON DELETE CASCADE,
	CONSTRAINT FK_ROOM_TO_RESERVATION_1 FOREIGN KEY (SEQ_RM) REFERENCES ROOM(SEQ_RM) ON DELETE CASCADE
);
-- 예약테이블 추가 
ALTER TABLE RESERVATION ADD TOTALPRICE NUMBER NOT NULL;

---------------------------------------------------------------------
CREATE TABLE MATE (
	SEQ_MATE	NUMBER	PRIMARY KEY,
	SEQ_RE	NUMBER	NOT NULL,
	CONSTRAINT FK_RESERVATION_TO_MATE_1 FOREIGN KEY (SEQ_RE) REFERENCES RESERVATION(SEQ_RE) ON DELETE CASCADE
);

---------------------------------------------------------------------
CREATE TABLE CHATROOM (
	SEQ_CR	NUMBER	PRIMARY KEY,
	CHAT_ROOM	VARCHAR2(100)	NOT NULL,
	SEQ_M	NUMBER	NOT NULL,
	CONSTRAINT FK_MEMBERE_TO_CHATROOM_1 FOREIGN KEY (SEQ_M) REFERENCES MEMBER(SEQ_M) ON DELETE CASCADE
);

---------------------------------------------------------------------
CREATE TABLE CHAT (
	SEQ_C	NUMBER	PRIMARY KEY,
	TEXT	VARCHAR2(2000)	NOT NULL,
	T_DATE	DATE	NOT NULL,
	SEQ_CR	NUMBER	NOT NULL,
	CONSTRAINT FK_CHATROOM_TO_CHAT_1 FOREIGN KEY (SEQ_CR) REFERENCES CHATROOM (SEQ_CR) ON DELETE CASCADE
);

---------------------------------------------------------------------
CREATE TABLE LOVE (
	SEQ_L	NUMBER	PRIMARY KEY,
	SEQ_M	NUMBER	NOT NULL,
	SEQ_RM	NUMBER	NOT NULL,
	CONSTRAINT FK_MEMBER_TO_LIKE_1 FOREIGN KEY (SEQ_M) REFERENCES MEMBER(SEQ_M) ON DELETE CASCADE,
	CONSTRAINT FK_ROOM_TO_LIKE_1 FOREIGN KEY (SEQ_RM) REFERENCES ROOM(SEQ_RM) ON DELETE CASCADE
);

---------------------------------------------------------------------

CREATE TABLE REQUIREMENTS(
	SEQ_RQ	NUMBER	PRIMARY KEY,
	RQ_ID		VARCHAR2(50)	NOT NULL,
	RQ_NAME		VARCHAR2(15)	NOT NULL,
	RQ_TITLE	VARCHAR2(100)	NOT NULL,
	RQ_CONTEXT	VARCHAR2(2000)	NOT NULL,
	RQ_DATE		DATE	NOT NULL
);








