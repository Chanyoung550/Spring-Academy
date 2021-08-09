create table tbl_board (
	bno int primary key auto_increment,
	title varchar(200) not null,
	content text,
	writer varchar(50) not null,
	regdate datetime default current_timestamp,
	updatedate datetime default current_timestamp on update current_timestamp
);

insert into tbl_board (title, content, writer) values('테스트 제목 00', '테스트 내용 00', 'user00');
insert into tbl_board (title, content, writer) values('테스트 제목 01', '테스트 내용 01', 'user01');
insert into tbl_board (title, content, writer) values('테스트 제목 02', '테스트 내용 02', 'user02');
insert into tbl_board (title, content, writer) values('테스트 제목 03', '테스트 내용 03', 'user03');
insert into tbl_board (title, content, writer) values('테스트 제목 04', '테스트 내용 04', 'user04');
insert into tbl_board (title, content, writer) values('테스트 제목 05', '테스트 내용 05', 'user05');
insert into tbl_board (title, content, writer) values('테스트 제목 06', '테스트 내용 06', 'user06');
insert into tbl_board (title, content, writer) values('테스트 제목 07', '테스트 내용 07', 'user07');
insert into tbl_board (title, content, writer) values('테스트 제목 08', '테스트 내용 08', 'user08');
insert into tbl_board (title, content, writer) values('테스트 제목 09', '테스트 내용 09', 'user09');

commit;

select * from tbl_board;

drop table tbl_board;

create table tbl_reply (
  rno integer primary key auto_increment, 
  bno integer not null,
  reply varchar(1000) not null,
  replyer varchar(50) not null, 
  replyDate datetime default current_timestamp, 
  updateDate datetime default current_timestamp on update current_timestamp
);

alter table tbl_reply  add constraint fk_reply_board  
foreign key (bno)  references  tbl_board (bno);

create index idx_reply on tbl_reply (bno desc, rno asc);

insert into tbl_reply (bno, reply, replyer)
(select bno, reply, replyer from tbl_reply);

create table tbl_sample1 (col1 varchar(500));
create table tbl_sample2 (col2 varchar(50));

alter table tbl_board add (replycnt int default 0);
update tbl_board set replycnt = (select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno);

create table tbl_attach (
	uuid varchar(100) not null,
	uploadPath varchar(200) not null,
	fileName varchar(100) not null,
	fileType char(1) default '1',
	bno integer
);

alter table tbl_attach add constraint pk_attach primary key (uuid);

alter table tbl_attach add constraint fk_board_attach foreign key (bno) references tbl_board (bno);

create table users (
    username varchar(50) not null primary key,
    password varchar(50) not null,
    enabled char(1) default '1'
);

create table authorities (
    username varchar(50) not null,
    authority varchar(50) not null,
    constraint fk_authorities_users foreign key(username) references users(username)
);

create unique index ix_auth_username on authorities (username, authority);

insert into users(username, password) values ('user00', 'pw00');
insert into users(username, password) values ('member00', 'pw00');
insert into users(username, password) values ('admin00', 'pw00');

insert into authorities (username, authority) values ('user00', 'ROLE_USER');
insert into authorities (username, authority) values ('member00', 'ROLE_MANAGER');
insert into authorities (username, authority) values ('admin00', 'ROLE_MANAGER');
insert into authorities (username, authority) values ('admin00', 'ROLE_ADMIN');

commit;

create table tbl_member (
	userid varchar(50) not null primary key,
	userpw varchar(100) not null,
	username varchar(100) not null,
	regdate datetime default current_timestamp,
	updatedate datetime default current_timestamp on update current_timestamp,
	enabled char(1) default '1'
);

create table tbl_member_auth (
	userid varchar(50) not null,
	auth varchar(50) not null,
	constraint fk_member_auth foreign key(userid) references tbl_member(userid)
);

create table persistent_logins (
	username varchar(64) not null,
	series varchar(64) primary key,
	token varchar(64) not null,
	last_used timestamp not null
);
