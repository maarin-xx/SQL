select * from employees;
//�������� ������ ���� ����������� � ������ David
select * from employees where first_name='David';
//�������� ������ ���� �����������, � ������� job_id ����� FI_ACCOUNT
select * from employees where job_id='FI_ACCOUNT';
//�������� ���������� � �����, �������, �/� � ������ ������������ 
��� ����������� �� 50�� ������������ � ���������, ������� 4000
select first_name, last_name, salary, department_id from employees where department_id = 50 and salary>4000;
//�������� ������ ���� �����������, ������� �������� ��� � 20�, ��� � 
30� ������������.
select first_name, last_name, salary, department_id from employees where
department_id in(20,30);
//�������� ������ ���� �����������, � ������� ������ � ��������� ����� 
� ����� ����� 'a'
select * from employees where first_name like '_a%a';
//�������� ������ ���� ����������� �� 50�� � �� 80�� ������������, � 
//������� ���� �����(������������). ������������ ������ �� email
//(������������ �������)
select * from employees where department_id in(50,80) and commission_pct is not null order by email;
//�������� ������ ���� �����������, � ������� � ����� ���������� ������� 2 ����� 'n'
select * from employees where lower(first_name) like '%n%n%';
//�������� ������ ���� �����������, � ������� ����� ����� ������ 4 
����. ������������ ������ �� ������ ������������ (��������� 
�������) ���, ����� �������� �null� ���� � ����� �����
select * from employees where length(first_name)>=4 order by department_id  desc nulls last;
//�������� ������ ���� �����������, � ������� �������� ��������� � ���������� �� 3000 �� 7000 (������������), ��� ������ 
//(������������) � job_id ����� ��������� ���������: PU_CLERK, ST_MAN, ST_CLERK
select * from employees where salary between 3000 and 7000 and commission_pct is null and job_id in('PU_CLERK', 
'ST_MAN', 'ST_CLERK');
//�������� ������ ���� ����������� � ������� � ����� ���������� ������ '%'
select * from employees where first_name like '%$%%' escape '$';
//�������� ���������� � job_id, ����� � �/� ��� ����������, �������  id ������� ������ ��� ����� 120 � job_id �� ����� IT_PROG. 
//������������ ������ �� job_id (������������ �������) � ������ (��������� �������)
select job_id, first_name, last_name, salary from employees where employee_id>=120 and job_id !='IT_PROG' order by job_id asc, first_name desc;
