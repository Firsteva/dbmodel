CREATE TABLE MENUS (
	MNO    INTEGER     NOT NULL COMMENT '메뉴번호', -- 메뉴번호
	MNAME  VARCHAR(50) NULL     COMMENT '메뉴명', -- 메뉴명
	MPRICE INTEGER     NULL     COMMENT '메뉴가격', -- 메뉴가격
	RDATE  DATE        NULL     COMMENT '등록일시' -- 등록일시
)
CREATE TABLE ORDER_MENUS (
	MNO  INTEGER NOT NULL COMMENT '메뉴번호', -- 메뉴번호
	ONO  INTEGER NOT NULL COMMENT '주문번호', -- 주문번호
	OMNO INTEGER NOT NULL COMMENT '주문메뉴번호' -- 주문메뉴번호
	NUM INTEGER NOT NULL DEFAULT 1 COMMENT '수량' -- 주문수량
)
CREATE TABLE TORDERS (
	ONO    INTEGER NOT NULL COMMENT '주문번호', -- 주문번호
	TNO    INTEGER NULL     COMMENT '테이블번호', -- 테이블번호
	TPRICE INTEGER NULL     COMMENT '총액', -- 총액
	ODATE  DATE    NULL     COMMENT '주문일시' -- 주문일시
)


insert into MENUS(MNAME, MPRICE, RDATE) values('아메리카노', 2000, '2014-11-21');
insert into MENUS(MNAME, MPRICE, RDATE) values('카페모카', 3000, '2014-11-21');
insert into MENUS(MNAME, MPRICE, RDATE) values('카페라떼', 2500, '2014-11-21');
insert into MENUS(MNAME, MPRICE, RDATE) values('바닐라라떼', 3000, '2014-11-21');
insert into MENUS(MNAME, MPRICE, RDATE) values('카페오레', 2500, '2014-11-21');
insert into MENUS(MNAME, MPRICE, RDATE) values('카푸치노', 3000, '2014-11-21');
insert into MENUS(MNAME, MPRICE, RDATE) values('마끼아또', 2500, '2014-11-21');
insert into MENUS(MNAME, MPRICE, RDATE) values('아포가또', 3500, '2014-11-21');
insert into MENUS(MNAME, MPRICE, RDATE) values('생과일주스', 4000, '2014-11-21');
insert into MENUS(MNAME, MPRICE, RDATE) values('모카초코', 3000, '2014-11-21');

-- 칼럼 수정
alter table ORDER_MENUS MODIFY NUM INTEGER NOT NULL DEFAULT 1;

insert into TORDERS (TNO, TPRICE, ODATE) values(1,7000,'2014-11-22');
insert into ORDER_MENUS (MNO, ONO, NUM) values(1, 1, 2);
insert into ORDER_MENUS (MNO, ONO) values(2, 1); 
insert into TORDERS (TNO, TPRICE, ODATE) value(2,9000,'2014-11-22');
insert into ORDER_MENUS (MNO, ONO, NUM) values(1, 2, 1);
insert into ORDER_MENUS (MNO, ONO, NUM) values(9, 2, 1);
insert into ORDER_MENUS (MNO, ONO, NUM) values(10, 2, 1);
insert into TORDERS (TNO, TPRICE, ODATE) value(3,4000,'2014-11-22');
insert into ORDER_MENUS (MNO, ONO, NUM) values(1, 3, 2);
insert into TORDERS (TNO, TPRICE, ODATE) value(4,6000,'2014-11-22');
insert into ORDER_MENUS (MNO, ONO, NUM) values(2, 4, 2);
insert into TORDERS (TNO, TPRICE, ODATE) value(5,2500,'2014-11-22');
insert into ORDER_MENUS (MNO, ONO, NUM) values(5, 5, 1);
insert into TORDERS (TNO, TPRICE, ODATE) value(6,4000,'2014-11-22');
insert into ORDER_MENUS (MNO, ONO, NUM) values(1, 6, 2);
insert into TORDERS (TNO, TPRICE, ODATE) value(7,6000,'2014-11-22');
insert into ORDER_MENUS (MNO, ONO, NUM) values(1, 7, 3);
insert into TORDERS (TNO, TPRICE, ODATE) value(8,12000,'2014-11-22');
insert into ORDER_MENUS (MNO, ONO, NUM) values(9, 8, 3);
insert into TORDERS (TNO, TPRICE, ODATE) value(9,6000,'2014-11-22');
insert into ORDER_MENUS (MNO, ONO, NUM) values(1, 9, 3);
 


















CREATE TABLE TABLE1 (
	
)