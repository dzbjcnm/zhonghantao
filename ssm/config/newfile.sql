drop database if exists ssm;

create database ssm default character set utf8;

use ssm;

drop table if exists user;


/*============================*/
/* Table: 用戶表结构 		  */
/*============================*/
create table user
(
   /* 用戶编号,自动增长 */
   user_id                  int not null auto_increment,
   /* 用戶登录名  */
   user_name               varchar(20),
   /* 用戶姓名  */
   user_pass                varchar(20),
   /* 用戶密码 */
   primary key (user_id)
);

/* 添加用戶数据, */
insert into user (user_name,user_pass) values ('admin','123');
insert into user (user_name,user_pass) values ('Jekin','123');

select * from user;
