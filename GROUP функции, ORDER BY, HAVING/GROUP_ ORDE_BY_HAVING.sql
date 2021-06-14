// �������� ������ �� department_id � ����������� � ������������ ���������, � ����� ������ � ����� ������� ����� ������� �� ������ � 
//� ����������� �����������. ����������� �� ���������� ����������� (�� ��������).
select department_id, min(salary),max(salary), min(hire_date), max(hire_date), count(first_name) as c  from employees group by department_id order by c;
//�������� ���������� � ������ ����� ����� ���������� � ���������� ���, ������� ���������� � ���� �����. �������� ������ ��� ����, ��� 
//���������� ���, ������������ � �� ������ 1. ����������� �� ����������
select substr(first_name, 1, 1) as fl_first_name, count(substr(first_name, 1, 1)) as count from employees group by substr(first_name, 1, 1) order by substr(first_name, 1, 1);
//�������� id ������������, �/� � ���������� �����������, ������� �������� � ����� � ��� �� ������������ � �������� ���������� ��������
select department_id, salary, count(first_name) from employees group by department_id, salary order by department_id ;
//�������� ���� ������ � ���������� �����������, ������� ������� �� ������ � ���� ����
select to_char(hire_date, 'DY') as day,  count(*) from employees group by to_char(hire_date, 'DY');
//�������� id �������������, � ������� �������� ������ 30 ����������� � ����� �� �/�-� ������ 300000
select department_id from employees  group by department_id having count(*)>30 and sum(salary)>300000 ; 
//�� ������� countries ������� ��� region_id, ��� ������� ����� ���� ���� �� ����� ������ 50��
select region_id, count(*) from countries group by region_id having sum(length(country_name))>50;
//�������� ���������� � job_id � ����������� ������� �������� ���������� ��� ������� job_id
select job_id, round(avg(salary),2) from employees group by job_id;
//�������� ������ id �������������, � ������� �������� ���������� ���������� (>1) job_id
select department_id,count(job_id) from employees group by department_id having count(job_id)>1;
//�������� ���������� � department, job_id, ������������ � ����������� �/� ��� ���� ��������� department_id - job_id, ��� ������� �/� ������ 10000
select department_id, job_id, max(salary), min(salary) from employees group by  department_id,job_id having avg(salary)> 1000 order by department_id,job_id ;
//�������� ������ manager_id, � ������� ������� �������� ���� ��� �����������, �� ������� ������������, ��������� � ���������� �� 6000 �� 9000
select * from employees;
select manager_id from employees where commission_pct is null group by manager_id having avg(salary) between 6000 and 9000;
//�������� ���������� �� ����� (�� ��������) ������������ �������� ����� ���� ������� ������� �� �������������.
select department_id, round(avg(salary)) from employees group by department_id;