
-- this syntax is awesome
select * from (values(1),(2)) t(c1)
select * from (values(1,'A'), (2, 'B'), (3, 'C')) t(c1, c2)

-- q3
select 1+'1'
-- q4
select avg(c1) from (values(2),(null), (4)) t(c1)
-- q5
select cast(3 as decimal)/1000


-- Q1
select * from (values(1),(2)) t(c1) 
union 
select * from (values(2),(3)) t2(c1)
-- Q2
begin tran
begin tran
rollback
if @@ERROR=0 select @@TRANCOUNT
-- Q3
select c,
rank() over(order by c) ,
ROW_NUMBER()  over(order by c),
DENSE_RANK()  over(order by c)
from(values(1),(1),(2),(2)) T(c)
-- Q4
select * from(values(1))t(c1) for xml auto


-- Q5
create table t1(c1 nvarchar(100), c2 nvarchar(100))
go
select * into t2 from t1 where 1=0
go
create trigger tr2 on t1
instead of update
as
declare @int varchar(100)
select @int =c1 from deleted
update t1 set c1=a.c1, c2=a.c1+'XXX'
from inserted a where t1.c1 = @int
go
insert t1 values(N'a', N'a')
insert t1 values(N'b', N'b')
update t1 set c1=N'aa', c2=N'abcd' where c1=N'a'
select * from t1
drop table t1
drop table t2
-- Q12
create table tb(PK int primary key)
go
begin tran
  insert tb values(1)
  begin tran
    insert tb values(2)
  commit
rollback
go
select * from tb
drop table tb

-- Q13
create table tb(PK int primary key)
go
begin tran
insert tb values(1)
insert tb values(1)
commit tran
go
select * from tb
drop table tb