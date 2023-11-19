select * from authors
select * from members
select * from publishers
select * from books
select * from borrow_records

--where
select b.book_id,a.author_name from books b,authors a where b.author_id = a.author_id
--on
select b.book_id,a.author_name from books b join authors a on b.author_id = a.author_id
--order by
select borrow_id, issue_date from borrow_records order by issue_date asc
--distinct
select distinct (designation) from members

--set function-union
select book_name, genre from books where genre = 'Mystery' union select book_name, genre from books where genre = 'Romance'
--in
select book_name, genre from books where genre in ('Mystery', 'Romance')
--subquery
select distinct author_id from books where genre = 'Mystery' and book_id in (select author_id from books where genre = 'Romance')
--like
select b.book_name,b.genre from books b,authors a where b.author_id = a.author_id and a.author_name like '%Adams%'

--natural join
select * from books natural join borrow_records
select * from (books natural join borrow_records) natural join publishers
select * from (books natural join borrow_records) join authors using (author_id);

--natural left join
select * from books natural left join borrow_records
--natural right join
select * from books natural right join borrow_records	--both outputs are same. They are symmetric.
--inner join
select * from books inner join authors using (author_id)
--right outer join
select * from members right outer join borrow_records on members.member_id = borrow_records.member_id
EXPLAIN select * from members right outer join borrow_records on members.member_id = borrow_records.member_id

--view
create view writer as select author_id, author_name,email_id from authors
select * from writer
drop view writer

--index
create index ind on books(book_id)
select * from members
drop index ind;

--domain
create domain mem as varchar(20) not null
constraint abc check(value>='10')
create table members_family(mem_fam_id mem,
						   mem_fam_name varchar(20))
drop domain mem
drop table members_family	


--granting roles
create role records
grant select on borrow_records to records
revoke select on borrow_records from records
drop role records

--computed columns

--borrow count for each member
select count(book_id) from borrow_records group by book_id






