create table tbl_member (
  userid varchar(50) not null, 
  userpw varchar(50) not null,
  username varchar(50) not null,
  email varchar(100),
  regdate timestamp default now(),
  updatedate timestamp default now(),
  primary key(userid)
);



CREATE TABLE tbl_board (
   bno INT NOT NULL AUTO_INCREMENT,
   title VARCHAR(200) NOT NULL,
   content TEXT NULL,
   writer VARCHAR(50) NOT NULL,
   regdate TIMESTAMP NOT NULL DEFAULT now(),
   viewcnt INT DEFAULT 0,
   PRIMARY KEY (bno));



create table tbl_reply (
 rno int NOT NULL AUTO_INCREMENT,
 bno int not null default 0,
 replytext varchar(1000) not null, 
 replyer varchar(50)  not null, 
 regdate TIMESTAMP NOT NULL DEFAULT now(),
 updatedate TIMESTAMP NOT NULL DEFAULT now(),
 primary key(rno)
);

alter table tbl_reply add constraint fk_board 
foreign key (bno) references tbl_board (bno);


create table tbl_user ( 
 uid varchar(50) NOT NULL, 
 upw varchar(50) NOT NULL,
 uname varchar(100) NOT NULL,
 upoint int NOT NULL DEFAULT 0,
 primary key(uid)
);


insert into tbl_user(uid, upw, uname) values ('user00','user00','IRON MAN');
insert into tbl_user(uid, upw, uname) values ('user01','user01','CAPTAIN');
insert into tbl_user(uid, upw, uname) values ('user02','user02','HULK');
insert into tbl_user(uid, upw, uname) values ('user03','user03','Thor');
insert into tbl_user(uid, upw, uname) values ('user10','user10','Quick Silver');


create table tbl_message (
 mid int not null auto_increment,
 targetid varchar(50) not null, 
 sender varchar(50) not null, 
 message text not null,
 opendate timestamp,
 senddate timestamp not null default now(),
 primary key(mid)
);

alter table tbl_message add constraint fk_usertarget 
foreign key (targetid) references tbl_user (uid); 

alter table tbl_message add constraint fk_usersender 
foreign key (sender) references tbl_user (uid); 


alter table tbl_board add column replycnt int default 0;

create table tbl_attach (
  fullName varchar(150) not null,
  bno int not null,
  regdate timestamp default now(),
  primary key(fullName)
);


alter table tbl_attach add constraint fk_board_attach 
foreign key (bno) references tbl_board (bno);





alter table tbl_user add column 
  sessionkey varchar(50) not null default 'none';
  
alter table tbl_user 
  add column sessionlimit timestamp;
[출처] MYSQL SQL입니다. (구멍가게코딩단) | 작성자 쿠키