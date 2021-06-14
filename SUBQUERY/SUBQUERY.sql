//�������� ��� ���������� � �����������, � ����� ������� ������
select * from employees where length(first_name)=(select max(length(first_name)) as l from employees);
//�������� ��� ���������� � �����������, � ��������� ������� ������� �������� ���� �����������
select * from employees where salary>(select avg(salary) from employees);
//�������� �����/������, ��� ���������� � ����� ������������ ������ �����
    
    
    select city, sum(salary) as l from 
    employees join departments using (department_id)
    join locations using (location_id)
    group by city
    having sum(salary)=(select min(m) from
                        (select city, sum(salary) as m from 
                        employees join departments using (department_id)
                        join locations using (location_id)
                        group by city));
   
// �������� ��� ���������� � �����������, � ������� �������� �������� �������� ������ 15000

select emp.*, sv.employee_id, sv.first_name from employees emp join 
    employees sv on (emp.employee_id=sv.manager_id) 
    where sv.salary>15000;
    
select * from employees where 
    manager_id IN (select employee_id from employees where salary>15000);
    
//�������� ��� ���������� � �������������, � ������� ��� �� ������ 
����������

select * from departments where
    department_id in
    (select d.department_id from employees e right outer join departments d on(e.department_id=d.department_id) where first_name is null);
    
//�������� ��� ���������� � �����������, ������� �� �������� �����������
select * from employees where 
    employee_id not in (select distinct manager_id from employees where manager_id is not null);

//�������� ��� ���������� � ����������, ������� ����� � ���������� ������ 6�� �����������
select  * from employees where employee_id in
    (select manager_id from employees group by manager_id having count(*)>6);

//�������� ��� ���������� � �����������, ������� �������� � ������������ � ��������� IT
select * from employees where department_id in
    (select department_id from departments where department_name like 'IT');

//�������� ��� ���������� � �����������, ��������� ������� ���������� �� ������ � 2005�� ����, �� ��� ��� ���� ��������� ���������� �� ������ �� 2005 ����
select * from employees where to_char(hire_date, 'YYYY')<2005 and manager_id in
    (select employee_id from employees where to_char(hire_date, 'YYYY')=2005);

//�������� ��� ���������� � �����������, ��������� �������  ���������� �� ������ � ������ ������ ����, � ����� job_title ���� 
����������� ������ 15�� ��������
select * from employees where manager_id in
    (select manager_id from employees where to_char(hire_date, 'MM')=01) and job_id in
        (select job_id from jobs where length(job_title)>15);

    


