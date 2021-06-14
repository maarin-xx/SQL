//�������� ������ ���� �����������, � ������� ����� ����� ������ 10 ����
select * from employees where length(first_name)>10;
//�������� ������ ���� �����������, �������� ������� ������ 1000
select * from employees where MOD(salary,1000)=0;
//�������� ���������� ����� � ������ 3� ������� ����� �����������  ������ ����������, ���� ��� ����� ����������� � �������
//���.���.���� 
select phone_number, substr(phone_number,1,3) as first_n from employees where phone_number like'___.___.____';
select phone_number, substr(phone_number,1,3) as first_n from employees where  REGEXP_LIKE(phone_number, '\d{3}[.]\d{3}[.]\d{4}');
//�������� ������ ���� �����������, � ������� ��������� ����� � �����  ����� 'm' � ����� ����� ������ 5��
select * from employees where first_name like '%m' and length (first_name)>5;
//�������� ���� ��������� �������
select next_day(sysdate,6) from dual;
//�������� ������ ���� �����������, ������� �������� � �������� ������ 12 ��� � 6�� ������� (150 �������)
select * from employees where months_between(sysdate, hire_date)>150;
//�������� ���������� �����, ������� � �������� PHONE_NUMBER ��� '.' �� '-'
select replace(phone_number, '.', '-') from employees;
//�������� ���, email, job_id ��� ���� ���������� � �������: STEVEN sking Ad_Pres
select rpad(first_name, 40, ' '), rpad(email,40, ' '), job_id from employees; 
//�������� ���������� � ����� ��������� � ��� �/�, �� ��������� ������ || , � ����� ����: Steven24000
select Concat(first_name,salary) from employees;
//�������� ���������� � ���� ����� ���������� �� ������,  ���������� ���� ����� �� ������ �� ������ � ������ ��� ���� 
//����� �� ������
select first_name, last_name, hire_date, round(hire_date,'MM') as pound_mm, round(hire_date,'YYYY') as pound_yy from employees;
//�������� ���������� � ����� � ������� ���� ����������. ��� ������ �������� �� 10 �������� � ���� ����� ����� ������ 10, �� 
//���������� �� 10 �������� ������ $. ������� ������ �������� �� 15 �������� � ���� ����� ������� ������ 15, �� ����� �������� 
//������� ������� ������ ! ������� ����������
select rpad(first_name, 10, '$'), lpad(last_name, 15, '!') from employees; 
//�������� ��� ���������� � ������� ������ ����� �a� � ��� �����
select first_name, instr(first_name, 'a',1,2) as posotion from employees;
//�������� �� ����� ����� '!!!HELLO!! MY FRIEND!!!!!!!!' � ��� �� �����, ��  ��� ������� ��������������� ���� � ������ � ����� ������
select '!!!HELLO!! MY FRIEND!!!!!!!!' as string, trim('!' from '!!!HELLO!! MY FRIEND!!!!!!!!') from dual; 
//�������� ���������� �:? �/� ���������,? �/� ���������� �� ����������� 3.1415 ,? ���������� �� ������ �������� ������� ����������� �/�-��, 
//? ����� ���������� ����� �� ����������� �/�.
select salary, salary*3.1415, round(salary*3.1415), trunc(salary*3.1415)  from employees;
//�������� ���������� �:? ���� ����� ���������� �� ������,? ����, ������� ���� ����� ��� ����, ����� �������� ���������� �� 
//������,? ���� ���������� ��� � ������ �������� ���������� �� ������
select hire_date, add_months(hire_date, 6),last_day(hire_date) from employees;