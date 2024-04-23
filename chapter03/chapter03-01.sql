-- �ּ�
-- SQL �Ұ�
-- Documents\dev\database\workspace\chapter03\chapter03-01.sql
-- DBMS�� ���ϴ� ������ ���� ���� �˷� �ְ� ����� ��µ� ����ϴ�
-- �����ͺ��̽� ���� �� SQL�̴�. 
-- �౸�� ������ ������ ���ǻ�� ������ �˰� �ʹ�.
select bookname, publisher, price
from book
where bookname like '�౸�� ����';
-- SQL - Structured Query Language
-- SQL�� ��ɿ� ���� ������ ���Ǿ�, ������ ���۾�, ������ ������ ������.
-- ������ ���Ǿ� DDL-���̺��̳� ������ ������ �����ϴµ� ���
-- create, alter, drop �� ���� �ִ�.
-- ������ ���۾� DML - ���̺� �����͸� �˻�, ����, ����, �����ϴµ� ����ϸ� 
-- select, insert, delete, update �� ���� �ִ�. ���⼭ select ���� Ư����
-- ���Ǿ� (query)��� ������.
-- ������ ����� DCL - �������� ��� ������ �����ϴ� �� ����ϸ�
-- grant, revoke �� ���� �ִ�.
