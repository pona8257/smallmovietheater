-- 시퀀스 드랍
DROP SEQUENCE PAYMENT_SEQ;
DROP SEQUENCE RESERVATION_SEQ;
DROP SEQUENCE USER_SEQ;
DROP SEQUENCE MOVIE_SEQ;
DROP SEQUENCE PRODUCT_SEQ;
DROP SEQUENCE CART_SEQ;
DROP SEQUENCE SCREEN_DATE_SEQ;
DROP SEQUENCE MOVIE_REVIEW_SEQ;
DROP SEQUENCE MOVIE_STILL_CUT_SEQ;
DROP SEQUENCE ORDER_SEQ;
DROP SEQUENCE ORDER_DETAIL_SEQ;
DROP SEQUENCE COUPON_SEQ;
DROP SEQUENCE INGUIRY_SEQ;
DROP SEQUENCE SLEEP_USER_SEQ;
DROP SEQUENCE REVIEW_NO_SEQ;
DROP SEQUENCE STILLCUT_NO_SEQ;
DROP SEQUENCE NOTICE_NO_SEQ;

-- 시퀀스 생성
CREATE SEQUENCE PAYMENT_SEQ         NOCACHE;
CREATE SEQUENCE RESERVATION_SEQ     NOCACHE;
CREATE SEQUENCE USER_SEQ            NOCACHE;
CREATE SEQUENCE MOVIE_SEQ           NOCACHE;
CREATE SEQUENCE PRODUCT_SEQ         NOCACHE;
CREATE SEQUENCE CART_SEQ            NOCACHE;
CREATE SEQUENCE SCREEN_DATE_SEQ     NOCACHE;
CREATE SEQUENCE MOVIE_REVIEW_SEQ    NOCACHE;
CREATE SEQUENCE MOVIE_STILL_CUT_SEQ NOCACHE;
CREATE SEQUENCE ORDER_SEQ           NOCACHE;
CREATE SEQUENCE ORDER_DETAIL_SEQ    NOCACHE;
CREATE SEQUENCE COUPON_SEQ          NOCACHE;
CREATE SEQUENCE INGUIRY_SEQ         NOCACHE;
CREATE SEQUENCE SLEEP_USER_SEQ      NOCACHE;
CREATE SEQUENCE REVIEW_NO_SEQ       NOCACHE;
CREATE SEQUENCE STILLCUT_NO_SEQ     NOCACHE;
CREATE SEQUENCE NOTICE_NO_SEQ       NOCACHE;

-- 테이블 드랍
DROP TABLE SLEEP_USER_T;
DROP TABLE INGUIRY_T;
DROP TABLE LEAVE_USER_T;
DROP TABLE NOTICE_T;
DROP TABLE ORDER_DETAIL_T;
DROP TABLE RESERVATION_T;
DROP TABLE PAYMENT_T;
DROP TABLE SCREEN_DATE_T;
DROP TABLE ORDER_T;
DROP TABLE MOVIE_STILL_CUT_T;
DROP TABLE MOVIE_REVIEW_T;
DROP TABLE USER_ACCESS_T;
DROP TABLE CART_T;
DROP TABLE COUPON_T;
DROP TABLE MOVIE_T;
DROP TABLE PRODUCT_T;
DROP TABLE USER_T;

-- 테이블 생성
CREATE TABLE USER_T (
   USER_NO                NUMBER               NOT NULL,
   USER_ID                VARCHAR2(40 BYTE)   NOT NULL UNIQUE,
   USER_PASSWORD        VARCHAR2(64 BYTE)   NOT NULL,
   USER_NAME            VARCHAR2(40 BYTE)       NULL,
   USER_GENDER            VARCHAR2(2 BYTE)       NULL,
   USER_EMAIL            VARCHAR2(100 BYTE)   NOT NULL UNIQUE,
   USER_MOBILE            VARCHAR2(15 BYTE)       NULL,
   USER_BIRTHYEAR        VARCHAR2(4 BYTE)       NULL,
   USER_BIRTHDATE        VARCHAR2(4 BYTE)       NULL,
   AGREECODE            NUMBER               NOT NULL,
   JOINED_AT            DATE                   NULL,
   PW_MODIFIED_AT        DATE                   NULL,
   AUTOLOGIN_ID        VARCHAR2(32 BYTE)       NULL,
   AUTOLOGIN_EXPIRED_AT DATE                   NULL,
   POSTCODE            VARCHAR2(5 BYTE)       NULL,
   ROAD_ADDRESS        VARCHAR2(100 BYTE)       NULL,
   JIBUN_ADDRESS        VARCHAR2( 100 BYTE)   NULL,
   DETAIL_ADDRESS        VARCHAR2(100 BYTE)       NULL,
   EXTRA_ADDRESS        VARCHAR2(100 BYTE)       NULL
);
CREATE TABLE PRODUCT_T (
   PRODUCT_NO       NUMBER              NOT NULL,
   PRODUCT_NAME     VARCHAR2(30 BYTE)  NOT NULL,
   PRICE           NUMBER              NOT NULL,
   PRODUCT_CONTENT   VARCHAR2(300 BYTE) NOT NULL,
   REGISTRATION      VARCHAR2(30 BYTE)       NULL,
   COUNT           NUMBER                  NULL,
   REMOVES           NUMBER                  NULL,
   IMAGE_PATH      VARCHAR2(500 BYTE)      NULL,
    IMAGE_NAME      VARCHAR2(50 BYTE)      NULL
);
CREATE TABLE MOVIE_T (
   MOVIE_ID     NUMBER              NOT NULL,
   GENRE        VARCHAR2(40 BYTE)  NOT NULL,
   TITLE        VARCHAR2(100 BYTE)  NOT NULL,
   DIRECTOR     VARCHAR2(90 BYTE)      NULL,
   START_DATE   VARCHAR2(30 BYTE)      NULL,
   RUNNINGTIME  NUMBER                  NULL,
   PLOT         CLOB                  NULL,
   RATING       NUMBER                 NULL,
   POSTER_PATH   VARCHAR2(300 BYTE)     NULL,
   POSTER_NAME   VARCHAR2(300 BYTE)     NULL
);
CREATE TABLE COUPON_T (
   COUPON_NO   NUMBER              NOT NULL,
   COUPON_NAME VARCHAR2 (20 BYTE) NOT NULL,
   SALE       NUMBER              NOT NULL,
   START_DATE   DATE              NOT NULL,
   END_DATE   DATE              NOT NULL
);
CREATE TABLE CART_T (
   CART_NO      NUMBER NOT NULL,
   USER_ID      VARCHAR2(40 BYTE)   NOT NULL UNIQUE,
   PRODUCT_NO NUMBER NOT NULL,
   COUNT      NUMBER NOT NULL
);
CREATE TABLE USER_ACCESS_T (
   USER_ID         VARCHAR2(40 BYTE)   NOT NULL UNIQUE,
   LAST_LOGIN_AT   DATE                 NULL
);
CREATE TABLE MOVIE_REVIEW_T (
   MOVIE_ID      NUMBER            NOT NULL,
   REVIEW_NO      NUMBER            NOT NULL,
   REVIEW_CONTENT VARCHAR2(40 BYTE)     NULL,
   REVIEW_RATING  NUMBER                NULL,
   REVIEW_DATE_AT VARCHAR2(50 BYTE)     NULL
);
CREATE TABLE MOVIE_STILL_CUT_T (
   MOVIE_ID     NUMBER           NOT NULL,
   STILLCUT_NO     NUMBER           NOT NULL,
   STILLCUT_NAME VARCHAR2(80 BYTE)   NOT NULL,
   STILLCUT_DIR  VARCHAR2(100 BYTE)   NOT NULL
);
CREATE TABLE ORDER_T (
   ORDER_NO   NUMBER NOT NULL,
   USER_NO      NUMBER NOT NULL,
   ORDER_DATE VARCHAR2(30 BYTE)     NOT NULL
);
CREATE TABLE SCREEN_DATE_T (
   SCREEN_DATE_NO NUMBER            NOT NULL,
   MOVIE_ID      NUMBER            NOT NULL,
   SCREEN_DATE      VARCHAR2(10 BYTE)   NOT NULL,
   SCREEN_TIME      VARCHAR2(10 BYTE) NOT NULL,
   DISCOUNT_PCT   NUMBER            NOT NULL
);
CREATE TABLE PAYMENT_T (
   ITEM_NO         VARCHAR2(20 BYTE) NOT NULL,
   USER_NO         NUMBER           NOT NULL,
   ORDER_NO     NUMBER           NOT NULL,
   PAYMENT_PRICE NUMBER           NOT NULL,
   PAYMENT_DATE  DATE               NOT NULL,
   PRICE_OPTION  NUMBER           NOT NULL
);
CREATE TABLE RESERVATION_T (
   RESERVATION_NO      NUMBER            NOT NULL,
   USER_NO              NUMBER            NOT NULL,
   SCREEN_DATE_NO      NUMBER            NOT NULL,
   MOVIE_ID          NUMBER            NOT NULL,
   RESERVATION_ROW      VARCHAR2(5 BYTE)    NOT NULL,
   RESERVATION_COLUMN VARCHAR2(5 BYTE)  NOT NULL,
   PAYMENT_OPTION      VARCHAR2(25 BYTE) NOT NULL,
   PAYMENT_COMPANY      VARCHAR2(20 BYTE)    NULL,
   PAYMENT_CARDNO      VARCHAR2(25 BYTE)    NULL,
   RESERVATION_STATUS NUMBER            NOT NULL,
   RESERVATION_AT      DATE                NOT NULL,
   PAYMENT_TOTAL_COST NUMBER            NOT NULL
);
CREATE TABLE ORDER_DETAIL_T (
   PRODUCT_NO       NUMBER    NOT NULL,
   ORDER_DETAIL_NO   NUMBER   NOT NULL,
   ORDER_NO       NUMBER   NOT NULL,
   CART_NO           NUMBER   NOT NULL,
   COUPON_NO       NUMBER   NOT NULL
);
CREATE TABLE NOTICE_T (
   NOTICE_NO         NUMBER             NOT NULL,
   NOTICE_TITLE     VARCHAR2(100 BYTE) NULL,
   REGISTRATION_DATE DATE                NULL,
   CONTENT             CLOB                NULL
);
CREATE TABLE LEAVE_USER_T (
   USER_ID      VARCHAR2(40 BYTE)  NOT NULL,
   USER_EMAIL VARCHAR2(100 BYTE) NOT NULL UNIQUE,
   JOINED_AT  DATE                     NULL,
   LEAVED_AT  DATE                     NULL
);
CREATE TABLE INGUIRY_T (
   INGUIRY_NO       NUMBER              NOT NULL,
   CONTENT_TYPE   VARCHAR2(20 BYTE)  NOT NULL,
   INGUIRY_TITLE   VARCHAR2(40 BYTE)  NOT NULL,
   INGUIRY_CONTENT   VARCHAR2(200 BYTE) NOT NULL,
   PATH           VARCHAR2(100 BYTE)      NULL,
   CREATED_AT       DATE              NOT NULL
);
CREATE TABLE SLEEP_USER_T (
   USER_NO          NUMBER              NOT NULL,
   USER_ID          VARCHAR2(40 BYTE)   NOT NULL UNIQUE,
   USER_PASSWORD  VARCHAR2(64 BYTE)   NOT NULL,
   USER_NAME      VARCHAR2(40 BYTE)       NULL,
   USER_GENDER      VARCHAR2(2 BYTE)          NULL,
   USER_EMAIL      VARCHAR2(100 BYTE)  NOT NULL UNIQUE,
   USER_MOBILE      VARCHAR2(15 BYTE)       NULL,
   USER_BIRTHYEAR VARCHAR2(4 BYTE)          NULL,
   USER_BIRTHDATE VARCHAR2(4 BYTE)          NULL,
   AGREECODE      NUMBER              NOT NULL,
   JOINED_AT      DATE                      NULL,
   PW_MODIFIED_AT DATE                      NULL,
   POSTCODE      VARCHAR2(5 BYTE)          NULL,
   ROAD_ADDRESS   VARCHAR2(100 BYTE)      NULL,
   JIBUN_ADDRESS  VARCHAR2( 100 BYTE)     NULL,
   DETAIL_ADDRESS VARCHAR2(100 BYTE)      NULL,
   EXTRA_ADDRESS  VARCHAR2(100 BYTE)      NULL,
   SLEPT_AT      DATE                      NULL
);

-- PK
ALTER TABLE USER_T         ADD CONSTRAINT PK_USER         PRIMARY KEY (USER_NO);
ALTER TABLE PRODUCT_T      ADD CONSTRAINT PK_PRODUCT      PRIMARY KEY (PRODUCT_NO);
ALTER TABLE MOVIE_T        ADD CONSTRAINT PK_MOVIE        PRIMARY KEY (MOVIE_ID);
ALTER TABLE COUPON_T       ADD CONSTRAINT PK_COUPON       PRIMARY KEY (COUPON_NO);
ALTER TABLE CART_T         ADD CONSTRAINT PK_CART         PRIMARY KEY (CART_NO);
ALTER TABLE ORDER_T        ADD CONSTRAINT PK_ORDER        PRIMARY KEY (ORDER_NO);
ALTER TABLE SCREEN_DATE_T  ADD CONSTRAINT PK_SCREEN_DATE  PRIMARY KEY (SCREEN_DATE_NO);
ALTER TABLE PAYMENT_T      ADD CONSTRAINT PK_PAYMENT      PRIMARY KEY (ITEM_NO);
ALTER TABLE RESERVATION_T  ADD CONSTRAINT PK_RESERVATION  PRIMARY KEY (RESERVATION_NO);
ALTER TABLE ORDER_DETAIL_T ADD CONSTRAINT PK_ORDER_DETAIL PRIMARY KEY (ORDER_DETAIL_NO);
ALTER TABLE NOTICE_T       ADD CONSTRAINT PK_NOTICE       PRIMARY KEY (NOTICE_NO);
ALTER TABLE SLEEP_USER_T   ADD CONSTRAINT PK_SLEEP_USER   PRIMARY KEY (USER_NO);

-- FK
ALTER TABLE CART_T            ADD CONSTRAINT FK_PRODUCT_CART              FOREIGN KEY (PRODUCT_NO)     REFERENCES PRODUCT_T     (PRODUCT_NO)     ON DELETE CASCADE;
ALTER TABLE USER_ACCESS_T     ADD CONSTRAINT FK_USER_ACCESS_USER          FOREIGN KEY (USER_ID)        REFERENCES USER_T        (USER_ID)        ON DELETE CASCADE;
ALTER TABLE MOVIE_REVIEW_T    ADD CONSTRAINT FK_MOVIE_MOVIE_REVIEW        FOREIGN KEY (MOVIE_ID)       REFERENCES MOVIE_T       (MOVIE_ID)       ON DELETE CASCADE;
ALTER TABLE MOVIE_STILL_CUT_T ADD CONSTRAINT FK_MOVIE_MOVIE_STILL_CUT     FOREIGN KEY (MOVIE_ID)       REFERENCES MOVIE_T       (MOVIE_ID)       ON DELETE CASCADE;
ALTER TABLE ORDER_T           ADD CONSTRAINT FK_USER_ORDER                FOREIGN KEY (USER_NO)        REFERENCES USER_T        (USER_NO)        ON DELETE CASCADE;
ALTER TABLE SCREEN_DATE_T     ADD CONSTRAINT FK_MOVIE_SCREEN_DATE         FOREIGN KEY (MOVIE_ID)       REFERENCES MOVIE_T       (MOVIE_ID)       ON DELETE CASCADE;
ALTER TABLE PAYMENT_T         ADD CONSTRAINT FK_USER_PAYMENT              FOREIGN KEY (USER_NO)        REFERENCES USER_T        (USER_NO)        ON DELETE CASCADE;
ALTER TABLE PAYMENT_T         ADD CONSTRAINT FK_ORDER_PAYMENT             FOREIGN KEY (ORDER_NO)       REFERENCES ORDER_T       (ORDER_NO)       ON DELETE CASCADE;
ALTER TABLE RESERVATION_T     ADD CONSTRAINT FK_USER_RESERVATION          FOREIGN KEY (USER_NO)        REFERENCES USER_T        (USER_NO)        ON DELETE CASCADE;
ALTER TABLE RESERVATION_T     ADD CONSTRAINT FK_SCREEN_DATE_RESERVATION_1 FOREIGN KEY (SCREEN_DATE_NO) REFERENCES SCREEN_DATE_T (SCREEN_DATE_NO) ON DELETE CASCADE;
ALTER TABLE RESERVATION_T     ADD CONSTRAINT FK_SCREEN_DATE_RESERVATION_2 FOREIGN KEY (MOVIE_ID)       REFERENCES MOVIE_T       (MOVIE_ID)       ON DELETE CASCADE;
ALTER TABLE ORDER_DETAIL_T    ADD CONSTRAINT FK_ORDER_ORDER_DETAIL        FOREIGN KEY (ORDER_NO)       REFERENCES ORDER_T       (ORDER_NO)       ON DELETE CASCADE;
ALTER TABLE ORDER_DETAIL_T    ADD CONSTRAINT FK_CART_ORDER_DETAIL         FOREIGN KEY (CART_NO)        REFERENCES CART_T        (CART_NO)        ON DELETE CASCADE;
ALTER TABLE ORDER_DETAIL_T    ADD CONSTRAINT FK_COUPON_ORDER_DETAIL       FOREIGN KEY (COUPON_NO)      REFERENCES COUPON_T      (COUPON_NO)      ON DELETE CASCADE;
COMMIT;


-- INSERT
-- PRODUCT_T
INSERT INTO PRODUCT_T (PRODUCT_NO, PRODUCT_NAME, PRICE, PRODUCT_CONTENT, REGISTRATION, COUNT, REMOVES, IMAGE_PATH, IMAGE_NAME)
       VALUES (PRODUCT_SEQ.NEXTVAL, '더블 콤보', 13000, '감자맛이 나는 팝콘 2개 + 탄산음료(R) 2개', NULL, 50, NULL, NULL, 'popcon1');
INSERT INTO PRODUCT_T (PRODUCT_NO, PRODUCT_NAME, PRICE, PRODUCT_CONTENT, REGISTRATION, COUNT, REMOVES, IMAGE_PATH, IMAGE_NAME)
       VALUES (PRODUCT_SEQ.NEXTVAL, '라지 콤보', 18000, '감자맛이 나는 왕 팝콘 2개 + 탄산음료(R) 2개', NULL, 30, NULL, NULL, 'popcon2');
INSERT INTO PRODUCT_T (PRODUCT_NO, PRODUCT_NAME, PRICE, PRODUCT_CONTENT, REGISTRATION, COUNT, REMOVES, IMAGE_PATH, IMAGE_NAME)
       VALUES (PRODUCT_SEQ.NEXTVAL, '나혼자 콤보', 20000, '감자맛이 나는 왕 팝콘 + 탄산음료(R) 2개', NULL, 40, NULL, NULL, 'popcon3');
INSERT INTO PRODUCT_T (PRODUCT_NO, PRODUCT_NAME, PRICE, PRODUCT_CONTENT, REGISTRATION, COUNT, REMOVES, IMAGE_PATH, IMAGE_NAME)
       VALUES (PRODUCT_SEQ.NEXTVAL, '스몰 세트', 20000, '감자맛이 나는 작은 팝콘', NULL, 20, NULL, NULL, 'popcon4');
INSERT INTO PRODUCT_T (PRODUCT_NO, PRODUCT_NAME, PRICE, PRODUCT_CONTENT, REGISTRATION, COUNT, REMOVES, IMAGE_PATH, IMAGE_NAME)
       VALUES (PRODUCT_SEQ.NEXTVAL, '더블 치즈 팝콘', 8000, '치즈가 두 장 들어간 감자맛 팝콘', NULL, 20, NULL, NULL, 'spopcon1');
INSERT INTO PRODUCT_T (PRODUCT_NO, PRODUCT_NAME, PRICE, PRODUCT_CONTENT, REGISTRATION, COUNT, REMOVES, IMAGE_PATH, IMAGE_NAME)
       VALUES (PRODUCT_SEQ.NEXTVAL, '바질 어니언 팝콘', 9000, '양파가 들어간 감자맛 팝콘', NULL, 20, NULL, NULL, 'spopcon2');
INSERT INTO PRODUCT_T (PRODUCT_NO, PRODUCT_NAME, PRICE, PRODUCT_CONTENT, REGISTRATION, COUNT, REMOVES, IMAGE_PATH, IMAGE_NAME)
       VALUES (PRODUCT_SEQ.NEXTVAL, '코카콜라(M)', 3000, '작은 콜라', NULL, 20, NULL, NULL, 'coke');
INSERT INTO PRODUCT_T (PRODUCT_NO, PRODUCT_NAME, PRICE, PRODUCT_CONTENT, REGISTRATION, COUNT, REMOVES, IMAGE_PATH, IMAGE_NAME)
       VALUES (PRODUCT_SEQ.NEXTVAL, '코카콜라(R)', 3500, '큰 콜라', NULL, 20, NULL, NULL, 'coke1');
COMMIT;

-- 상영일
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 1, '20230523', '10:00', 50);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 1, '20230524', '14:00', 20);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 1, '20230525', '19:00', 1);

INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 2, '20230523', '15:00', 15);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 2, '20230524', '09:00', 90);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 2, '20230525', '08:00', 99);

INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 3, '20230523', '22:00', 5);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 3, '20230524', '21:00', 3);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 3, '20230525', '12:00', 12);

INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 4, '20230526', '10:00', 22);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 4, '20230526', '21:00', 8);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 4, '20230528', '08:00', 70);

INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 5, '20230527', '09:00', 45);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 5, '20230528', '13:00', 10);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 5, '20230527', '21:00', 5);

INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 6, '20230529', '09:00', 86);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 6, '20230530', '21:00', 10);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 6, '20230531', '15:00', 10);

INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 7, '20230529', '20:00', 10);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 7, '20230530', '10:00', 93);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 7, '20230531', '22:00', 10);

INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 8, '20230529', '14:00', 10);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 8, '20230530', '15:00', 10);
INSERT INTO SCREEN_DATE_T (SCREEN_DATE_NO, MOVIE_ID, SCREEN_DATE, SCREEN_TIME, DISCOUNT_PCT)
VALUES (SCREEN_DATE_SEQ.NEXTVAL, 8, '20230531', '11:00', 10);
COMMIT;

-- 영화
INSERT INTO MOVIE_T(MOVIE_ID, GENRE, TITLE, DIRECTOR, START_DATE, RUNNINGTIME, PLOT, RATING, POSTER_PATH, POSTER_NAME) 
VALUES(MOVIE_SEQ.NEXTVAL, '액션', '범죄도시3', '이상용', '2023-05-31', 105, '베트남 납치 살해범 검거 후 7년 뒤,"마석도"(마동석)는 새로운 팀원들과 함께 살인사건을 조사한다.', 4.5,'/movieimg', 'image1.jpg');

INSERT INTO MOVIE_T(MOVIE_ID, GENRE, TITLE, DIRECTOR, START_DATE, RUNNINGTIME, PLOT, RATING, POSTER_PATH, POSTER_NAME) 
VALUES(MOVIE_SEQ.NEXTVAL, '액션', '분노의 질주', '루이스 리터리어', '2023-05-17', 141, '돔(빈 디젤)과 그의 패밀리 앞에 나타난 운명의 적 단테(제이슨 모모아).', 4.2,'/movieimg', 'image2.jpg');

INSERT INTO MOVIE_T(MOVIE_ID, GENRE, TITLE, DIRECTOR, START_DATE, RUNNINGTIME, PLOT, RATING, POSTER_PATH, POSTER_NAME) 
VALUES(MOVIE_SEQ.NEXTVAL, '판타지 ', '인어공주', '롭 마샬', '2023-05-24', 135, '아틀란티카 바다의 왕 ‘트라이튼’의 사랑스러운 막내딸인 인어 "에리얼"은 늘 인간들이 사는 바다 너머 세상으로의 모험을 꿈꾼다.', 4.1,'/movieimg', 'image3.jpg');

INSERT INTO MOVIE_T(MOVIE_ID, GENRE, TITLE, DIRECTOR, START_DATE, RUNNINGTIME, PLOT, RATING, POSTER_PATH, POSTER_NAME) 
VALUES(MOVIE_SEQ.NEXTVAL, '액션', '가디언즈 오브 갤럭시3', '제임스 건 ', '2023-05-03', 149, '"가모라"를 잃고 슬픔에 빠져 있던 "피터 퀼"이 위기에 처한 은하계와 동료를 지키기 위해 다시 한번 가디언즈 팀과 힘을 모으고, 성공하지 못할 경우 그들의 마지막이 될지도 모르는 미션에 나서는 이야기', 3.9, '/movieimg', 'image4.jpg');

INSERT INTO MOVIE_T(MOVIE_ID, GENRE, TITLE, DIRECTOR, START_DATE, RUNNINGTIME, PLOT, RATING, POSTER_PATH, POSTER_NAME) 
VALUES(MOVIE_SEQ.NEXTVAL, '애니메이션 ', '더 퍼스트 슬램덩크', '이노우에 다케히코', '2023-01-04', 125, '전국 제패를 꿈꾸는 북산고 농구부 5인방의 꿈과 열정, 멈추지 않는 도전을 그린 영화', 2.5,'/movieimg', 'image5.jpg');

INSERT INTO MOVIE_T(MOVIE_ID, GENRE, TITLE, DIRECTOR, START_DATE, RUNNINGTIME, PLOT, RATING, POSTER_PATH, POSTER_NAME) 
VALUES(MOVIE_SEQ.NEXTVAL, '애니메이션 ', '스즈메의 문단속', '신카이 마코토', '2023-03-08', 122, '“이 근처에 폐허 없니? 문을 찾고 있어” 규슈의 한적한 마을에 살고 있는 소녀 "스즈메"는 문을 찾아 여행 중인 청년 "소타"를 만난다.', 3.7,'/movieimg', 'image6.jpg');

INSERT INTO MOVIE_T(MOVIE_ID, GENRE, TITLE, DIRECTOR, START_DATE, RUNNINGTIME, PLOT, RATING, POSTER_PATH, POSTER_NAME) 
VALUES(MOVIE_SEQ.NEXTVAL, '멜로/로맨스', '롱디', '임재완', '2023-05-10', 101, '사회초년생 "도하"와 인디 뮤지션 "태인"이 장거리 연애를 시작하면서 벌이는 언택트 러브 스토리', 3.8,'/movieimg', 'image7.jpg');

INSERT INTO MOVIE_T(MOVIE_ID, GENRE, TITLE, DIRECTOR, START_DATE, RUNNINGTIME, PLOT, RATING, POSTER_PATH, POSTER_NAME) 
VALUES(MOVIE_SEQ.NEXTVAL, '애니메이션', '슈퍼 마리오 브라더스', '아론 호바스', '2023-04-26', 92, '따단-딴-따단-딴 전 세계를 열광시킬 올 타임 슈퍼 어드벤처의 등장! 뉴욕의 평범한 배관공 형제 "마리오"와 "루이지"는 배수관 고장으로 위기에 빠진 도시를 구하려다 미스터리한 초록색 파이프 안으로 빨려 들어가게 된다.', 2.9,'/movieimg', 'image8.jpg');
COMMIT;
