DROP DATABASE IF EXISTS ChatsDB;
CREATE DATABASE ChatsDB;

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
    `logouttime` TIMESTAMP NOT NULL COMMENT 'Logout Time',
    
    CONSTRAINT pk_users_logout_1 PRIMARY KEY (`uid`, `logouttime`),
    CONSTRAINT fk_users_logout_1 FOREIGN KEY (`uid`) REFERENCES `users`(`uid`)
);


USE ChatsDB;
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
	`gid` VARCHAR(16) PRIMARY KEY COMMENT 'Group ID',
    `groupname` VARCHAR(256) NOT NULL COMMENT 'Group Name',
    `createtime` TIMESTAMP NOT NULL COMMENT 'Group Creation Time'
);

USE ChatsDB;
DROP TABLE IF EXISTS belongs_to;
CREATE TABLE belongs_to (
	`uid` INT(16) NOT NULL COMMENT 'User ID',
    `gid` VARCHAR(16) NOT NULL COMMENT 'Group ID',
    `registertime` TIMESTAMP NOT NULL COMMENT 'User Register to Group Time',
    
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
    `time` TIMESTAMP NOT NULL COMMENT 'Message Send Time',
    
    CONSTRAINT pk_messages_1 PRIMARY KEY (`uid`, `gid`, `time`),
    CONSTRAINT fk_messages_1 FOREIGN KEY (`uid`) REFERENCES `users`(`uid`),
    CONSTRAINT fk_messages_2 FOREIGN KEY (`gid`) REFERENCES `groups`(`gid`)
);


