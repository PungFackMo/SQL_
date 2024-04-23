
-- Documents\dev\database\workspace\chapter03\chapter03-13.sql

-- 데이터 조작어 - 삽입, 수정, 삭제
-- 프로그램의 기본 기능 CRUD - create, read, update, delete
-- 만들어진 테이블에 투플(행)을 삽입, 삭제, 수정하는 방법

-- insert 문
-- 테이블에 새로운 투풀을 삽입하는 명령이다

-- insert 문 문법
-- insert into 테이블이름[(속성리스트)]
-- values (값리스트);

-- book 테이블에 새로운 도서 '스포츠 의학' 을 삽입하시오.
-- 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90000원이다.
select * from book;
INSERT INTO BOOK (BOOKID, BOOKNAME, PUBLISHER, PRICE) VALUES(11, '스포츠 의학', '한솔의학서적', 90000);

-- 새로운 투플을 삽입할 때 속성의 이름은 생략할 수 있다
-- 이때 데이터의 입력 순서는 속성의 순서와 일치해야 한다.

INSERT INTO BOOK
        VALUES(12,'스포츠의학','한솔의학서적',90000);
        
-- 속성의 이름의 순서를 바꾸게 되면 데이터의 순서도 바꾸면 된다.
INSERT INTO BOOK (BOOKID, BOOKNAME, PRICE, PUBLISHER) 
        VALUES(13, '스포츠 의학', 90000, '한솔의학서적');
        
-- 몇 개의 속성만 입력해야 한다면 해당되는 속성만 명시하면 된다.

-- BOOK 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오
-- 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정이다
INSERT INTO BOOK (BOOKID, BOOKNAME, PUBLISHER) 
        VALUES(14, '스포츠 의학', '한솔의학서적');
        
-- INSERT문은 SELECT문을 사용하여 작성할 수 도 있다
-- 한꺼번에 여러개의 투플을 삽입하는 방법으로
-- 대량 삽입(BULK INSET)이라고도 한다

-- 수입도서 목록(INPORTED_BOOK)을 BOOK 테이블에 모두 삽입하시오
SELECT * FROM IMPORTED_BOOK;
SELECT * FROM BOOK;

insert into imported_book values (21, 'Zen Golf', 'Pearson', 12000);
insert into imported_book values (22, 'Soccer Skills', 'Human Kinetics', 15000);

INSERT INTO BOOK(BOOKID, BOOKNAME, PRICE, PUBLISHER)
         SELECT BOOKID, BOOKNAME, PRICE, PUBLISHER
         FROM IMPORTED_BOOK;
         
delete from IMPORTED_BOOK
where bookid=22;
         
-- 데이터 베이스의 이름 규칙
-- 새로운 단어가 조합 될 때 언더바(_)를 쓰는게 일반적이다
-- IMPORTED_BOOK
-- 데이터 베이스 접속 라이브러리에서 ImportedBook 카멜 표기법으로 되어있는
-- 이름을 언더바로 자동 변환 기능이 대부분 있다.


-- update문
-- 특정 속성 값을 수정하는 명령이다
-- 문법
-- update 테이브ㅡㄹ이름
-- set 속성이름 1=값 1[, 속성이름 2= 값2, ...]
-- [where <검색조건>];

-- customer 테이블에서 고객번호가 5인 고객의 주소를
-- '대한민국 부산'으로 변경하시오.

drop table customer;
select *
from customer;

create table customer(
    custid number,
    name varchar(20),
    address varchar(30),
    phone varchar(20),
    primary key (custid));
    
insert into customer
    values (1, '박지성', '영국 맨체스타', '000-5000-0001');
insert into customer
    values (2, '김연아', '대한민국 서울', '000-6000-0001');
insert into customer
    values (3, '장미란', '대한민국 강원도', '000-7000-0001');
insert into customer
    values (4, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into customer(custid, name, address)
    values (5, '박세리', '대한민국 대전');
    
create table orders(
    orderid number primary key,
    custid number,
    bookid number,
    saleprice number,
    orderdate date,
    foreign key (custid) references customer(custid),
    foreign key (bookid) references book(bookid));
    
select *
from orders;

insert into orders values (1, 1, 1, 6000, '2020-07-01');
insert into orders values (2, 1, 3, 21000, '2020-07-03');
insert into orders values (3, 2, 5, 8000, '2020-07-03');
insert into orders values (4, 3, 6, 6000, '2020-07-04');
insert into orders values (5, 4, 7, 20000, '2020-07-05');
insert into orders values (6, 1, 2, 12000, '2020-07-07');
insert into orders values (7, 4, 8, 13000, '2020-07-07');
insert into orders values (8, 3, 10, 12000, '2020-07-08');
insert into orders values (9, 2, 10, 7000, '2020-07-09');
insert into orders values (10, 3, 8, 13000, '2020-07-10');


update customer
set address='대한민국 부산'
where custid=2;

select *
from customer;

--update문은 다른 테이블의 속성값을 이용할 수도 있다.

--customer테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.
update customer
set address=(select address from customer
    where name='김연아')
where name = '박세리';

-- updete문 작성 시 주의 사항
update customer
set address='대한민국 서울';
-- 모든 고객의 주소가 대한민국 서울로 바뀐다.
-- update문은 일반적으로 특정 값만 변경하므로 where 문이 빠졌는지
-- 주의 해야 한다


-- delete문
-- 테이블에 있는
-- 문법
-- delete from 테이블이름
-- [where 검색조건];

-- delete문은 <검색조건>에 해당되는 투플을 삭제한다.
-- <검색조건>이 없으면 모든 투플을 삭제한다.
-- delete문도 where조건문이 빠졌는지 특히 주의 해야한다.

-- customer 테이블에서 고객번호가 5인 고객을 삭제한 후 결과를 확인하시오.
delete from customer
where custid=5;

select * from customer;

-- 모든 고객을 삭제하시오.
delete from customer;
-- 오류가 발생 된다
-- orders테이블에서 customer.custid 속성을 외래키로 참조하고 있다.


