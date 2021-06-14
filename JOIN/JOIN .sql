select * from regions;
select * from countries;
select * from  locations;
select * from departments;
select * from employees;
select * from jobs;
//������� ���������� � �������� � ���-�� ����������� � ������ �������
select region_name, count(*) from employees e
    join departments d on (e.department_id=d.department_id)
    join locations l on (d.location_id=l.location_id)
    join countries c on (l.country_id=c.country_id)
    join regions r on (c.region_id=r.region_id)
group by region_name;
select region_name, count(*) from employees e
    join departments d using (department_id)
    join locations l using (location_id)
    join countries c using (country_id)
    join regions r using (region_id)
group by region_name;
//�������� ���������� � ������ ���������� first_name, last_name, department_name, job, street_adress, country_name, region_name
select first_name, last_name, d.department_name, j.job_title, l.street_address, c.country_name, r.region_name from employees
    join departments d using (department_id)
    join jobs j using(job_id)
    join locations l using (location_id)
    join countries c using (country_id)
    join regions r using (region_id);
//������� ���������� � ����������, ������� ����� � ���������� ������ 6 ����������� 
select e2.first_name,e2.last_name, count(*) 
from employees  em1 join employees e2 on (em1.manager_id=e2.employee_id) 
    group by e2.first_name, e2.last_name having count(*)>6;
//�������� ���� � �������� ���� ������������� ���-�� ����������, ���� � ������������ >30 �����������
select d.department_name, count(*) from employees e
    join departments d on (d.department_id=e.department_id)
    group by d.department_name
    having count(*)>30;
//�������� ���� �������������, ��� ��� �� ������ ����������    
select d.department_name from employees e
    right join departments d on (d.department_id=e.department_id) 
    where last_name is null;
// ������� ��� ���������� � �����������, ��������� ������� ��������� � 2005, ���� ��������� �� 2005
select emp.* from employees emp
     join employees sv on(emp.manager_id=sv.employee_id)
     where to_char(sv.hire_date,'YYYY')=2005 and to_char(emp.hire_date,'YYYY')<2005;
//������� �����������, ������� �������� ������ ��� ��� �/� �� �� �������������+1000
select emp.*, j.job_title,j.min_salary from employees emp 
    join jobs j on (emp.job_id=j.job_id)
    where emp.salary<j.min_salary+1000;
//������� ���������� ����� � ������� �����������, ������� ����� � ������� ��� ��������, ���������� � �����������, � ������� ������� ��� ����������
//��� ������ � ������� ��� ����������� ��������
select distinct em.first_name, em.last_name, c.country_name from employees em
    full outer join departments d on (em.department_id=d.department_id)
    full outer join locations l on (d.location_id=l.location_id)
    full outer join countries c on (l.country_id=c.country_id);
//�������� ����� � ������� ���� �����������, ������� ����� ������� �� �������� ��� ����������� ���������� �� ����� ��������
select em.first_name, em.last_name, c.country_name from employees em
    cross join countries c; 
//�������� ���������� � �������� � ���-�� ����������� � ������ �������  ��������� oracle join
select region_name, count(*) from employees e, departments d,locations l,countries c,regions r
    where (e.department_id=d.department_id and d.location_id=l.location_id and l.country_id=c.country_id and c.region_id=r.region_id)
    group by region_name;
