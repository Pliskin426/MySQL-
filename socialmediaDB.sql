create database if not exists socialmedia;

use socialmedia;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;

create table users (
	id int(11) not null auto_increment,
	user_name varchar(20) not null, 
	email varchar (40) not null,
	password varchar (128) not null,
	primary key (id)
);

create table posts (
	id int(11) not null auto_increment, 
	date_posted datetime default current_timestamp not null,
	user_id int(11) not null, 
	description text (480) not null,
	comments text (480) not null,
	primary key (id),
	foreign key (user_id) references users(id)
);

create table comments (
	id int(11) not null auto_increment,
	user_id int(11) not null,
	time_stamp datetime default current_timestamp not null,
	post_id int(11),
	description text (480),
	primary key (id),
	foreign key (user_id) references users(id),
	foreign key (post_id) references posts(id)
);