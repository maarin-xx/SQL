//�������� � ����� ������� ���������� � ������ �/� �����, ����������� �� id ���������, �� job_id, �� id ������������. ������ 
//������ ��������� 4 �������: id ���������, job_id, id ������������, ������������� �/�

select NVL2(manager_id,to_char(manager_id)||' ��������', '��� ���������') as group_, sum(salary) from employees group by manager_id
union all
select job_id, sum(salary) from employees group by job_id
union all 
select NVL2(department_id, to_char(department_id)||' �����������','��� ������������'), sum(salary) from employees group by department_id;

//�������� id ��� �������������, ��� �������� �������� � 100 � �� �������� ��������� � 145, 201
select department_id from employees where manager_id=100
intersect 
select department_id from employees where manager_id!=145
intersect 
select department_id from employees where manager_id!=201
order by department_id;

//��������� SET ��������� � �� ��������� ���������� ���������, �������� ���������� ���������� � ������, �������� � �/� 
//�����������, ������ ������ � ������ ������� ����� ��, � ������� �������� ����� �s� ��� ����������� �� ��������. ������������ 
//��������� �� �/� �� ��������.
select first_name, last_name, salary from employees where first_name like '_a%'
intersect
select first_name, last_name, salary from employees where lower(last_name) like '%s%'
order by salary desc;

//��������� SET ��������� � �� ��������� ���������� ���������, �������� ���������� � id �������, �������� ���� � ������ ��� 
//�������, ������� ��������� � ������ ��� ��������. � ����� ��� �������, �������� ��� ������� �������� ����� �9�
select location_id, postal_code, city from locations where country_id like  'IT'
union 
select location_id, postal_code, city from locations where country_id like  'DE'
intersect 
select location_id, postal_code, city from locations where postal_code like '%9%';

//. ��������� SET ��������� � �� ��������� ���������� ���������, �������� ��� ���������� ���������� ��� �����, ����� ��� 
//������� ������ 8 ��������. � ����� ��� �����, ������� ��������� �� � ����������� �������. ������� ������� ������ ���������� id, country, 
//region. ������ ������������ �� �������� ����� �� ���������

select country_id id, country_name country, region_id region from countries 
where length(country_name)>8
intersect
select country_id, country_name, region_id  from countries where region_id!=1;

select country_id id, country_name country, region_name region from countries natural join regions
where length(country_name)>8
intersect
select country_id, country_name, region_name  from countries natural join regions where region_id!=1;


