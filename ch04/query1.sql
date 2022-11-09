-- ERD 연습

insert into dept (dno, dname, budget) values ('D1', 'Marketing', '10M'), ('D2', 'Development', '12M'), ('D3', 'Research', '5M');
insert into emp (eno, ename, dno, salary) values ('E1', 'Lopez', 'D1', '40K'), ('E2', 'Cheng', 'D1', '42K'), ('E3', 'Finzi', 'D2', '30K'), ('E4', 'Saito', 'D2', '35K');
select * from dept;
select * from emp; 


