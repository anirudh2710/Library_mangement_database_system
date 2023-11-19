drop table if exists authors;
create table authors	(author_id varchar(20) NOT NULL primary key,
						 author_name varchar(200) NOT NULL,
						 first_name varchar(200) NOT NULL,
						 last_name varchar(200) NOT NULL,
						 email_id varchar(200)	NOT NULL,
						 contact_num varchar(10)	NOT NULL);
						 
						 
drop table if exists publishers;
create table publishers	(pub_id varchar(20) NOT NULL primary key,
						 pub_name varchar(200) NOT NULL,
						 pub_email_id varchar(200) NOT NULL,
						 pub_contact_number varchar(10) NOT NULL);


drop table if exists members;					 
create table members	(member_id varchar(20) NOT NULL primary key,
						 member_name varchar(200) NOT NULL,
						 member_email_id varchar(30)	NOT NULL,
						 designation varchar(20) NOT NULL);

drop table if exists books;
create table books(book_id varchar(30)NOT NULL primary key,
					book_name varchar(200) NOT NULL,
					genre varchar(200) NOT NULL,
					author_id varchar(20) NOT NULL,
					book_issue_date timestamp NOT NULL,
					publisher_id varchar(20) NOT NULL,
					book_total_count int,
					foreign key(publisher_id) references publishers(pub_id),
					foreign key(author_id) references authors(author_id));
				   	 

drop table if exists borrow_records;
create table borrow_records(borrow_id varchar(20) NOT NULL primary key,
							book_id varchar(30)NOT NULL,
							member_id varchar(20) NOT NULL,
							author_id varchar(20) NOT NULL,
							issue_date timestamp NOT NULL check (issue_date<=return_date),
							return_date timestamp,
							borrow_fee float default '2',
				 			foreign key(book_id) references books(book_id),
				   			foreign key(author_id) references authors(author_id),
						    foreign key(member_id) references members(member_id));



					

