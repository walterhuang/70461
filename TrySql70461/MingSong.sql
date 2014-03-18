--Member存放會員資料
--Song存放歌曲記錄
--MemberSong存放會員點歌記錄,會員編號與歌曲編號合起來不重複

--請用T-SQL產生"每個會員必點的歌曲"

--a
--Member(MID,Password,MName)

--create table Member (MID int not null primary key , MName varchar(10))

--insert Member values (1,'John')
--insert Member values (2,'Mary')
--insert Member values (3,'Tom')

----Song (SID,SName)

--create table Song(SID int not null primary key , SName nvarchar(10))
----drop table Song
--insert Song values (1,'星星')
--insert into Song values (2,N'月亮')
--insert Song values (3,N'太陽')

----MemberSong(MID,SID)

--create table MemberSong(MID int , SID int)

--insert MemberSong values (1,1),(1,2),(1,3),(2,1),(3,1)
--insert membersong values(2,3)
--select * from Member 
--select * from Song 

select * from MemberSong 
--insert membersong values(2,2)
-- insert membersong values(3,2)
select sid
from membersong
group by sid 
having count(*) = (select count(*) from member)

select Song.SID,Song.SName 
from Song inner join
(Select Song.SID,COUNT(MemberSong.SID) as count 
from Song inner join MemberSong on Song.SID = MemberSong.SID
group by Song.SID
having COUNT(MemberSong.SID)=(Select COUNT(*) from Member)
)
as a 
on Song.SID = a.SID

--select * 
--from membersong A
--join membersong B on A.MID <> B.MID and A.SID = B.SID
--order by 1, 2


