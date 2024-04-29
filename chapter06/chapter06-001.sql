-- Documents\dev\database\workspace\chapter06\chapter06-001.sql

-- summer ���̺��� �����ϰ� �����͸� ����
drop table summer;

create table summer(
    sid number,
    class varchar2(20),
    price number
);

insert into summer values(100,'fortran', 20000);
insert into summer values(150,'pascal', 15000);
insert into summer values(200,'c', 10000);
insert into summer values(250,'fortran', 20000);

select * from summer;

-- select���� �̿��� ��ȸ �۾�
-- �л��� �й� sid, �����ϴ� ������ class, ���� ������ ������� price
-- �����ϱ⸦ ��� �л��� �й��� �����ϴ� ������?
select sid class from summer;
-- �����ᰡ ���� ��� ������?
select distinct class from summer
where price=(select max(price) from summer);

-- ���� �̻�
-- 200�� �л��� �����б� ������û�� ����Ͻÿ�.
delete summer where sid=200;
select * from summer;

-- c ���� ������ ��ȸ
select price "c ������" from summer where class="C";

-- 200�� �л��� ������û�� ����Ͽ� ���� ������ �����Ͽ���
-- 200�� �л��� ������û�� �� ��� �Ǿ���
-- c������ �����Ḧ ��ȸ�� �� ���� �Ǿ���.
-- �л��� ������û�� ����ϸ鼭 �����ᵵ �Բ� �����Ͽ��� �����̴�
-- ���� �̻��� �߻��Ͽ���.

-- ���� �ǽ��� ���� 200�� �л� �ڷ� �ٽ� �Է�
insert into summer values (200, 'c', 10000);

-- �����̻�
-- �����б⿡ ���ο� �ڹ� ���¸� �����Ͻÿ�.
-- �ڹ� ���� ����
insert into summer values (null, 'java', 25000);
--  ��ü ������ ��ȸ
select * from summer;
-- ������ �л��� �Ѽ��� ���Ͻÿ�
select count(*) from summer;
-- ������ �л��� �Ѽ��� 4���ε� 5���̶�� ����� ���Դ�.
-- ���̺��� �����Ͱ� ���� �� ��ü �����͸� �����ϰ� �ľ��Ͽ�
-- sql ���� ������ �ϴ� ������ �ִ�.
select count(sid) from summer;
-- �����̻�
-- �ڹ� ���°� ���� �����Ǿ���
-- ������� 25000���̰� ���� ��û�� �л��� ����.
-- �ڹ� ���¸� �߰��ϱ� ���� insert���� ����ϴµ�
-- ��û�� �л��� ���� �й����� null ���� �Է� �Ǿ���.
-- null ���� ¡�� �Լ� ��� �� ������ �ʴ� ����� ����� �´�.

-- fortran ������ �����Ḧ 20000������ 15000������ �����Ͻÿ�.
update summer set price=15000 where class='fortran' and sid=100;

-- frotran �����Ḧ ��ȸ
select price from summer where class='fortran';
-- �ΰ��� ��ȸ�Ǿ� ������ ����ġ ���� �߻�

-- �����̻�
-- fortran ������ �����ᰡ 20000������ 15000������ ����Ǿ�
-- update���� �̿��Ͽ� �����Ͽ���.
-- update���� ���ǿ� �´� ���� �ϰ� ����������,
-- ������ �߸� �ָ� ������ ����ġ ������ �߻��Ѵ�

-- ������ �����ϱ� ���� ���̺�
-- ���̺��� ������ �����Ͽ� �̻������� �߻����� �ʵ��� �����.
-- summer ���̺��� summer_price�� summer_enroll���̺�� �и��Ѵ�.
-- summer_price���̺��� ���� ���� ������ ������ ����
-- summer_enroll���̺��� �л����� ������û ������ ����

DROP TABLE SummerPrice; /* ���� ���̺��� ������ ���� */
DROP TABLE SummerEnroll; /* ���� ���̺��� ������ ���� */
/* SummerPrice ���̺� ���� */
CREATE TABLE SummerPrice
( class VARCHAR(20),
  price INTEGER
);
INSERT INTO SummerPrice VALUES('FORTRAN', 20000);
INSERT INTO SummerPrice VALUES('PASCAL', 15000);
INSERT INTO SummerPrice VALUES('C', 10000);

select * from summerprice;

-- ���ο� �ܾ ���յɶ� �Ϲ������� ���̺��̳� �Ӽ��̸��� _�� �����Ѵ�
-- ��) summer_price, summer_enroll

-- summerEnroll ���̺� ����
drop table summer_enroll;
create table summer_enroll(
    sid integer,
    class varchar(20)
);
insert into summer_enroll values(100, 'fortran');
insert into summer_enroll values(150, 'pascal');
insert into summer_enroll values(200, 'c');
insert into summer_enroll values(250, 'fortran');

select * from summer_enroll;

-- 200�� �л��� �����б� ������û�� ����Ͻÿ�.
-- c ���� ������ ��ȸ
select price from summerprice where class='C' or class='c';
-- ���� ���
delete from summer_enroll where sid=200;
select * from summer_enroll;
-- c ���� ������ ��ȸ
select price from summerprice where class='C' or class='c';
-- �����̻� ����
-- 200�� �л��� ������û ��ҵ� �� ó�� �Ǿ���
-- ������� ������ ��Ÿ���� �ʾҴ�
-- c������ ������� ��ȸ �����ϴ�.

-- �����б⿡ ���ο� �ڹ� ���¸� �����Ͻÿ�.
insert into summerprice values('java', 25000);
select * from summerprice;
-- �����̻� ����
-- ���� ��û�� �л��� ������, null���� �Է��� �ʿ䰡 ����
-- �����̻� �߻� ����.

-- fortran ������ �����Ḧ 20000������ 15000������ �����Ͻÿ�,
select * from summerprice;
update summerprice set price=15000 where class='FORTRAN';
select price from summerprice where class='FORTRAN';
-- �����̻� ����
-- fortran ������ ������� �ϳ��� ����Ǿ� �����Ƿ� ���� ��
-- �������� ����ġ�� ����� �ʿ䰡 ����.

-- ���̺��� �и��� ���� �̻������� �ذ� �� �� �־���.

