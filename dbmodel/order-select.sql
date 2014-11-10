/* DISTINCT(중복 데이터 제거) 
=> distinct를 붙이지 않으면 default는 ALL 이다.
*/

/* 1) 모든 제품 번호를 출력하라. */
select /*ALL*/ PNO from PRODUCTS;

/* 2) 모든 주문제품의 번호를 출력하라. */
select /*ALL*/ PNO from ORDERS;

/* 3) 주문한 제품이 뭐뭐 있는지 목록을 출력하라. */
select distinct PNO from ORDERS;

/****************************************************************************/

/* ORDER BY(출력 결과를 정렬)
문법 : ORDER BY /*ASC*/ 컬럼명, /*ASC*/ 컬럼명, ...
ORDER BY DESC 컬럼명, ASC 컬럼명, ...
=> 나열된 컬럼 순서대로 정렬한다. 기본은 오름차순(ㄱ→ㅎ)이다.
정렬조건 : 
ACS(ENDING) => 오름차순
DESC(EUNDING) => 내림차순

ORDER BY 절 수행 후 SELECT 실행
*/

/* 1) 기본 출력 */
select UID,UNAME,EMAIL from MEMBERS;

/* 2) 이름을 오름차순으로 정렬하라 */
select UID,UNAME,EMAIL from MEMBERS order by /*ASC*/ UNAME;

/* 3) 이름을 내림차순으로 정렬하라 */
select UID,UNAME,EMAIL from MEMBERS order by UNAME DESC;

/* 4) 주문 정보를 제품 번호의 오름차순으로 정렬하라. */
select * from ORDERS order by PNO;

/* 5) 주문 정보를 제품 번호의 오름차순으로 정렬하고,
			사용자 아이디로 오름차순으로 정렬하라. */
select * from ORDERS order by PNO,UID;

/* 6) 주문 정보를 제품 번호의 오름차순으로 정렬하고,
			사용자 아이디로 내림차순으로 정렬하라. */
select * from ORDERS order by PNO,UID desc;

/* 6) 주문 정보를 제품 번호의 오름차순으로 정렬하고,
			사용자 아이디로 내림차순으로 정렬하라. 
	=> 정렬을 먼저 한 다음 select를 실행한다.
*/
select ONO,ODATE from ORDERS order by PNO,UID desc;

/****************************************************************************/

/* 별명 붙이기
문법 : SELECT 컬럼명 [AS] 별명, ... */
select ONO as NO, ODATE as "Order Date",
PNO 'Product No', UID ID from ORDERS;

/****************************************************************************/

/* WHERE
문법 : WHERE 조건1 (AND|OR) 조건2 ...*/

/* 연산자 사용 */
/* 1) 더하기 연산자 */
select ONO,QTY,QTY * 500000 
as TOTAL 
from ORDERS;

/* 2) 비교 연산자 */
select ONO,QTY 
from ORDERS
where QTY>2;

select ONO,QTY 
from ORDERS
where QTY=1;

select ONO,QTY 
from ORDERS
where QTY>1 
and QTY<=5;

/* 3) 문자열 비교 */
select UID,UNAME,EMAIL 
from MEMBERS
where UNAME='홍길동';

select UID,UNAME,EMAIL
from MEMBERS
where UNAME 
like '김%'; /* '%'는 0개 이상의 글자 */

select UID,UNAME,EMAIL
from MEMBERS
where UNAME 
like '김_진'; /* '_'는 1개의 글자 */

/* 제품명에 '럭시'라는 글자를 포함한 모든 제품 선택하기
주의 => 검색 속도가 매우 느리다. */
select PNO,PNAME
from PRODUCTS
where PNAME 
like '%럭시%';

/****************************************************************************/

/* IN
표현식 : IN (값,값,값,...)
=> 표현식이 IN에 들어있는 값과 일치하면 TRUE */

/* 삼성과 애플 제품을 출력하시오. */
select PNO,PNAME,MKNO
from PRODUCTS
where MKNO=1
or MKNO=2;

select PNO,PNAME,MKNO
from PRODUCTS
where MKNO
in(1,2);

/****************************************************************************/

/* NULL 여부 검사 */
select *
from PROD_PHOTOS
where PNO 
is NULL;

select * 
from PROD_PHOTOS 
where PNO 
is NOT NULL;

/****************************************************************************/

/* BETWEEN A AND B */
select *
from ORDERS
where QTY>=1
and QTY<=3;

select *
from ORDERS
where QTY
between 1 and 3;

/****************************************************************************/

/* UNION(결과의 결합)
두개의 결과를 합쳐서 하나로 다루고 싶을 때
*/

/* 1) 제품 이름과 제조사 이름을 알고싶다. */
select PNAME from PRODUCTS;
select MKNAME from MAKERS;

select PNAME from PRODUCTS
union /* 합집합 */
select MKNAME from MAKERS;

/* 2) 2014년 7월 이후, 애플 제품제품을 출력하시오. */
select * from ORDERS where ODATE >='2014-7-1'
union /* 두 결과 데이터를 합칠 때 중복 데이터 제거 */
select * from ORDERS where PNO IN (1,2,3);

select * from ORDERS where ODATE >='2014-7-1'
union all /* 두 결과 데이터가 중복되어도 모두 합쳐서 출력 */
select * from ORDERS where PNO IN (1,2,3);

/* 3) 2014년 7월 이후, 애플 제품제품을 제외하고 출력하시오. */
/* MINUS 문은 ORACLE용
select * from ORDERS where ODATE >='2014-7-1'
minus
select * from ORDERS where PNO IN (1,2,3); */
select * from ORDERS
where ODATE>='2014-7-1'
and PNO not in(1,2,3); /* 차집합 */

/****************************************************************************/

/* 서브 쿼리 */

/* 1) 주문 제품의 주문 번호와 제품명을 출력하라. */
select 
	ONO,
	PNO,
	(select PNAME from PRODUCTS where PNO=T1.PNO) as NAME,
	QTY
from ORDERS T1;

/* 2) 검색어와 일치하는 회사제품의 주문정보를 출력하시오. */
select * from ORDERS
where PNO in (select PNO from PRODUCTS where MKNO=1);

/* 3) 2014년 7월 이후, u01, u05가 주문한 것을 출력하시오*/
select * 
from (select * from ORDERS where ODATE>='2014-7-1') 
as T1
where UID in ('u01','u05');