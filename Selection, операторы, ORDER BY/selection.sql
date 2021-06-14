select * from employees;
//ѕолучите список всех сотрудников с именем David
select * from employees where first_name='David';
//ѕолучите список всех сотрудников, у которых job_id равен FI_ACCOUNT
select * from employees where job_id='FI_ACCOUNT';
//¬ыведите информацию о имени, фамилии, з/п и номере департамента 
дл€ сотрудников из 50го департамента с зарплатой, большей 4000
select first_name, last_name, salary, department_id from employees where department_id = 50 and salary>4000;
//ѕолучите список всех сотрудников, которые работают или в 20м, или в 
30м департаменте.
select first_name, last_name, salary, department_id from employees where
department_id in(20,30);
//ѕолучите список всех сотрудников, у которых втора€ и последн€€ буква 
в имени равна 'a'
select * from employees where first_name like '_a%a';
//ѕолучите список всех сотрудников из 50го и из 80го департамента, у 
//которых есть бонус(комиссионные). ќтсортируйте строки по email
//(возрастающий пор€док)
select * from employees where department_id in(50,80) and commission_pct is not null order by email;
//ѕолучите список всех сотрудников, у которых в имени содержатс€ минимум 2 буквы 'n'
select * from employees where lower(first_name) like '%n%n%';
//ѕолучить список всех сотрудников, у которых длина имени больше 4 
букв. ќтсортируйте строки по номеру департамента (убывающий 
пор€док) так, чтобы значени€ УnullФ были в самом конце
select * from employees where length(first_name)>=4 order by department_id  desc nulls last;
//ѕолучите список всех сотрудников, у которых зарплата находитс€ в промежутке от 3000 до 7000 (включительно), нет бонуса 
//(комиссионных) и job_id среди следующих вариантов: PU_CLERK, ST_MAN, ST_CLERK
select * from employees where salary between 3000 and 7000 and commission_pct is null and job_id in('PU_CLERK', 
'ST_MAN', 'ST_CLERK');
//ѕолучите список всех сотрудников у которых в имени содержитс€ символ '%'
select * from employees where first_name like '%$%%' escape '$';
//¬ыведите информацию о job_id, имене и з/п дл€ работников, рабочий  id которых больше или равен 120 и job_id не равен IT_PROG. 
//ќтсортируйте строки по job_id (возрастающий пор€док) и именам (убывающий пор€док)
select job_id, first_name, last_name, salary from employees where employee_id>=120 and job_id !='IT_PROG' order by job_id asc, first_name desc;
