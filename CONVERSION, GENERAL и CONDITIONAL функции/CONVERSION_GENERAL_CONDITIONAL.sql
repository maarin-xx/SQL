// ��������� �������, �������� ������ ���� ����������� � ������� � ����� ���� ����� 'b' (��� ����� ��������).
select * from employees where lower(first_name) like '%b%';
//��������� �������, �������� ������ ���� ����������� � ������� � ����� ���������� ������� 2 ����� 'a'
select * from employees where instr(lower(first_name), 'a', 1,2)>0;
//�������� ������ ����� �� ����� ������������, ��� ��� �������������, � ������� �������� ������� ������, ��� �� ������ �����
select substr(department_name,1,instr(department_name,' ')) as part_department_name from departments where REGEXP_LIKE(department_name, '.+[[:space:]].*');
//�������� ����� ����������� ��� ������ � ��������� ����� � �����
select substr(first_name, 2, length(first_name)-2) from employees;
//�������� ������ ���� �����������, � ������� � �������� job_id ����� ����� '_' ��� ������� 3 �������, �� ��� ���� ��� �������� ����� '_' �� ����� 'CLERK'
select * from employees where instr(job_id,'_')<=length(job_id)-3 and job_id not like '%_CLERK';
//�������� ������ ���� �����������, ������� ������ �� ������ � ������ ���� ������ ������
select * from employees where hire_date=round(hire_date, 'mm');
//�������� ������ ���� �����������, ������� ������ �� ������ � 2008�� ����
select * from employees where to_char(hire_date, 'YYYY') = 2008;
select * from employees where extract( year from hire_date) = 2008; 
//�������� ���������� ���� � �������: Tomorrow is Second day of January
select 'Tomorrow is '||to_char(sysdate+1, 'fmDdTHSP')||' day of '||to_char(sysdate+1, 'Month') from dual;
//�������� ��� ���������� � ���� ��� ������� �� ������ � �������: 21st of June, 2007
select first_name, last_name, to_char(hire_date, 'fmDdTH" of "Month," "YYYY') from employees;
//�������� ������ ���������� � ������������ ���������� �� 20%. �������� �������� � �������: $28,800.00
select first_name, last_name, to_char(salary*100/20,'$9999,999.99') as salary from employees;
//�������� ���������� ���� (��������), + �������, + ������, + ���, + ����, + �����, + ���. (�� ��� �� ����������� ������������ � ���������� ����)
select to_char(sysdate)||' '|| to_char(sysdate, 'ss')||' '|| to_char(sysdate, 'mi')||' '|| to_char(sysdate, 'hh')||' '|| to_char(sysdate, 'dd')
||' '|| to_char(sysdate, 'mm')||' '|| to_char(sysdate, 'yy') as datee from dual;
//�������� ��� ����������, ��� �/� � ����� �/�, ������� ����� ������ ���� ��� �������� ������ �$12,345.55�.
select first_name, last_name, salary, salary+to_number('$12,345.55','$99999999999.999') as new_salary from employees;
//�������� ��� ����������, ���� ��� ���������������, � ����� ���������� ������� ����� ��� ��� ��������������� � �����, ������� 
//���������� �������� �� ������ �SEP, 18:45:00 18 2009�
select first_name, last_name, hire_date, trunc(months_between(to_date('SEP, 18:45:00 18 2009','MON, HH24:MI:SS DD YYYY' ),hire_date)) as months from employees;
//�������� ��� ����������, ��� �/�, � ����� ������ �/� (salary + commission_pct(%)) � �������: $24,000.00
select first_name, last_name, to_char(NVL2(commission_pct,salary+salary*commission_pct,salary),'$999999999999,999.99') as salary from employees;
//.�������� ��� ����������, ��� �������, � ����� ��������� �different length�, ���� ����� ����� �� ����� ����� ������� ��� ��������� 
//�same length�, ���� ����� ����� ����� ����� �������. �� ����������� conditional functions
select first_name, last_name,NVL2(NULLIF(length(first_name),length(last_name)),'different length','same length') from employees;
//�������� ��� ����������, ��� ������������, � ����� ���������� �  ������� ������� � �������� � ���� �� � ���� ������������ (Yes/No)
select first_name, last_name, commission_pct, NVL2(commission_pct,'Yes','No') from employees;
//�������� ��� ���������� � �������� ������� ��� ����� ���������������: �������� ������������, ���� ������������, ���� ���, �� id ��� ���������, ���� � ��� �����������, �� ��� �/�.
select first_name, last_name, NVL2(commission_pct,commission_pct,NVL2(manager_id,manager_id,salary))from employees;
//��� ������ ������ �������� ������, � ������� ��� ���������: 1-Europe, 2-America, 3-Asia, 4-Africa . ��������� ������ �������, �� ��������� ���������� JOIN. ����������� DECODE
select country_name, Decode(region_id,1,'Europe',2,'America', 3,'Asia',4,'Africa') as region from countries;
//��� ������ ������ �������� ������, � ������� ��� ���������: 1-Europe, 2-America, 3-Asia, 4-Africa . ��������� ������ �������, �� ��������� ���������� JOIN. ����������� case
select country_name, 
case region_id
when  1 then 'Europe'
when  2 then 'America'
when  3 then 'Asia'
when  4 then 'Africa'
end  as region
from countries;
