-- Documents\dev\database\workspace\chapter07\chapter07-001.sql

-- commit ���� rollback ��
select * from customer;

-- �� ���̺��� 5�� ���� �����Ѵ�
delete from customer where custid=5;
select * from customer;

-- �Ͻ������� �ݿ��� �����͸� ������Ű���� rollback ��ɾ ����Ѵ�,
rollback;
select * from customer;

-- �ٽ� �� ���̺��� 5�� ���� �����Ѵ�.
delete from customer where custid=5;
select * from customer;

-- commit ��ɾ�� �����ͺ��̽��� ���� �۾��� �ݿ����� ����
commit;

-- �ٽ� rollback ��ɾ� ���
rollback;
select * from customer;

-- commit �̶�� ��ɾ�� ���� commit �������� �����ߴ�
-- sql���� ������ �����ϴ� ��ɾ�
-- rollback ������ commit��ɾ������� �ǵ����� ��ɾ� �Դϴ�.

insert into customer values(5,'�ڼ���','���ѹα� ����',null);