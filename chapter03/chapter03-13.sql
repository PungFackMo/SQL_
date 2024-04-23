
-- Documents\dev\database\workspace\chapter03\chapter03-13.sql

-- ������ ���۾� - ����, ����, ����
-- ���α׷��� �⺻ ��� CRUD - create, read, update, delete
-- ������� ���̺� ����(��)�� ����, ����, �����ϴ� ���

-- insert ��
-- ���̺� ���ο� ��Ǯ�� �����ϴ� ����̴�

-- insert �� ����
-- insert into ���̺��̸�[(�Ӽ�����Ʈ)]
-- values (������Ʈ);

-- book ���̺� ���ο� ���� '������ ����' �� �����Ͻÿ�.
-- ������ ������ �Ѽ����м������� �Ⱓ������ ������ 90000���̴�.
select * from book;
INSERT INTO BOOK (BOOKID, BOOKNAME, PUBLISHER, PRICE) VALUES(11, '������ ����', '�Ѽ����м���', 90000);

-- ���ο� ������ ������ �� �Ӽ��� �̸��� ������ �� �ִ�
-- �̶� �������� �Է� ������ �Ӽ��� ������ ��ġ�ؾ� �Ѵ�.

INSERT INTO BOOK
        VALUES(12,'����������','�Ѽ����м���',90000);
        
-- �Ӽ��� �̸��� ������ �ٲٰ� �Ǹ� �������� ������ �ٲٸ� �ȴ�.
INSERT INTO BOOK (BOOKID, BOOKNAME, PRICE, PUBLISHER) 
        VALUES(13, '������ ����', 90000, '�Ѽ����м���');
        
-- �� ���� �Ӽ��� �Է��ؾ� �Ѵٸ� �ش�Ǵ� �Ӽ��� ����ϸ� �ȴ�.

-- BOOK ���̺� ���ο� ���� '������ ����'�� �����Ͻÿ�
-- ������ ������ �Ѽ����м������� �Ⱓ������ ������ �����̴�
INSERT INTO BOOK (BOOKID, BOOKNAME, PUBLISHER) 
        VALUES(14, '������ ����', '�Ѽ����м���');
        
-- INSERT���� SELECT���� ����Ͽ� �ۼ��� �� �� �ִ�
-- �Ѳ����� �������� ������ �����ϴ� �������
-- �뷮 ����(BULK INSET)�̶�� �Ѵ�

-- ���Ե��� ���(INPORTED_BOOK)�� BOOK ���̺� ��� �����Ͻÿ�
SELECT * FROM IMPORTED_BOOK;
SELECT * FROM BOOK;

insert into imported_book values (21, 'Zen Golf', 'Pearson', 12000);
insert into imported_book values (22, 'Soccer Skills', 'Human Kinetics', 15000);

INSERT INTO BOOK(BOOKID, BOOKNAME, PRICE, PUBLISHER)
         SELECT BOOKID, BOOKNAME, PRICE, PUBLISHER
         FROM IMPORTED_BOOK;
         
delete from IMPORTED_BOOK
where bookid=22;
         
-- ������ ���̽��� �̸� ��Ģ
-- ���ο� �ܾ ���� �� �� �����(_)�� ���°� �Ϲ����̴�
-- IMPORTED_BOOK
-- ������ ���̽� ���� ���̺귯������ ImportedBook ī�� ǥ������� �Ǿ��ִ�
-- �̸��� ����ٷ� �ڵ� ��ȯ ����� ��κ� �ִ�.


-- update��
-- Ư�� �Ӽ� ���� �����ϴ� ����̴�
-- ����
-- update ���̺�Ѥ��̸�
-- set �Ӽ��̸� 1=�� 1[, �Ӽ��̸� 2= ��2, ...]
-- [where <�˻�����>];

-- customer ���̺��� ����ȣ�� 5�� ���� �ּҸ�
-- '���ѹα� �λ�'���� �����Ͻÿ�.

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
    values (1, '������', '���� ��ü��Ÿ', '000-5000-0001');
insert into customer
    values (2, '�迬��', '���ѹα� ����', '000-6000-0001');
insert into customer
    values (3, '��̶�', '���ѹα� ������', '000-7000-0001');
insert into customer
    values (4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
insert into customer(custid, name, address)
    values (5, '�ڼ���', '���ѹα� ����');
    
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
set address='���ѹα� �λ�'
where custid=2;

select *
from customer;

--update���� �ٸ� ���̺��� �Ӽ����� �̿��� ���� �ִ�.

--customer���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.
update customer
set address=(select address from customer
    where name='�迬��')
where name = '�ڼ���';

-- updete�� �ۼ� �� ���� ����
update customer
set address='���ѹα� ����';
-- ��� ���� �ּҰ� ���ѹα� ����� �ٲ��.
-- update���� �Ϲ������� Ư�� ���� �����ϹǷ� where ���� ��������
-- ���� �ؾ� �Ѵ�


-- delete��
-- ���̺� �ִ�
-- ����
-- delete from ���̺��̸�
-- [where �˻�����];

-- delete���� <�˻�����>�� �ش�Ǵ� ������ �����Ѵ�.
-- <�˻�����>�� ������ ��� ������ �����Ѵ�.
-- delete���� where���ǹ��� �������� Ư�� ���� �ؾ��Ѵ�.

-- customer ���̺��� ����ȣ�� 5�� ���� ������ �� ����� Ȯ���Ͻÿ�.
delete from customer
where custid=5;

select * from customer;

-- ��� ���� �����Ͻÿ�.
delete from customer;
-- ������ �߻� �ȴ�
-- orders���̺��� customer.custid �Ӽ��� �ܷ�Ű�� �����ϰ� �ִ�.


