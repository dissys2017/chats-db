DROP DATABASE IF EXISTS ChatsDB;
CREATE DATABASE ChatsDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE ChatsDB;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	`uid` INT(16) AUTO_INCREMENT PRIMARY KEY COMMENT 'User ID',
    `username` VARCHAR(256) NOT NULL UNIQUE COMMENT 'Username',
    `password` VARCHAR(256) NOT NULL COMMENT 'password'
);

USE ChatsDB;
DROP TABLE IF EXISTS users_logout;
CREATE TABLE users_logout (
	`uid` INT(16) NOT NULL COMMENT 'User ID',
    `logouttime` TIMESTAMP(3) NOT NULL COMMENT 'Log Out Time',
    
    CONSTRAINT pk_users_logout_1 PRIMARY KEY (`uid`, `logouttime`),
    CONSTRAINT fk_users_logout_1 FOREIGN KEY (`uid`) REFERENCES `users`(`uid`)
);

USE ChatsDB;
DROP TABLE IF EXISTS users_login;
CREATE TABLE users_login (
	`uid` INT(16) NOT NULL COMMENT 'User ID',
    `logintime` TIMESTAMP(3) NOT NULL COMMENT 'Log In Time',

    CONSTRAINT pk_users_login_1 PRIMARY KEY (`uid`, `logintime`),
    CONSTRAINT fk_users_login_1 FOREIGN KEY (`uid`) REFERENCES `users`(`uid`)
);
 

USE ChatsDB;
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
	`gid` VARCHAR(16) PRIMARY KEY COMMENT 'Group ID',
    `groupname` VARCHAR(256) NOT NULL COMMENT 'Group Name',
    `createtime` TIMESTAMP(3) NOT NULL COMMENT 'Group Creation Time'
);

USE ChatsDB;
DROP TABLE IF EXISTS belongs_to;
CREATE TABLE belongs_to (
	`uid` INT(16) NOT NULL COMMENT 'User ID',
    `gid` VARCHAR(16) NOT NULL COMMENT 'Group ID',
    `registertime` TIMESTAMP(3) NOT NULL COMMENT 'User Register to Group Time',
    
    CONSTRAINT pk_belongs_to_1 PRIMARY KEY (`uid`, `gid`),
    CONSTRAINT fk_belongs_to_1 FOREIGN KEY (`uid`) REFERENCES `users`(`uid`),
    CONSTRAINT fk_belongs_to_2 FOREIGN KEY (`gid`) REFERENCES `groups`(`gid`)
);

USE ChatsDB;
DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	`uid` INT(16) NOT NULL COMMENT 'User ID',
    `gid` VARCHAR(16) NOT NULL COMMENT 'Group ID',
    `message` TEXT COMMENT 'Message',
    `time` TIMESTAMP(3) NOT NULL COMMENT 'Message Send Time',
    
    CONSTRAINT pk_messages_1 PRIMARY KEY (`uid`, `gid`, `time`),
    CONSTRAINT fk_messages_1 FOREIGN KEY (`uid`) REFERENCES `users`(`uid`),
    CONSTRAINT fk_messages_2 FOREIGN KEY (`gid`) REFERENCES `groups`(`gid`)
);

USE ChatsDB;
DROP TABLE IF EXISTS breaks_from;
CREATE TABLE breaks_from (
    `uid` INT(16) NOT NULL COMMENT 'User ID',
    `gid` VARCHAR(16) NOT NULL COMMENT 'Group ID',
    `breaktime` TIMESTAMP(3) NOT NULL COMMENT 'Time broke from group',

    CONSTRAINT pk_breaks_from_1 PRIMARY KEY (`uid`, `gid`, `breaktime`)
);


