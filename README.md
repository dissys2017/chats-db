# Chats DB

This is the repository for the __Chats DB__. Chats DB is the database that contains the all the chat messages, the groups and the users' information. It is based on MySQL 5.7. This database currently represents 3 entities: Users, Groups and Messages. 

## Docker 

The docker file is a container for an empty chats-db. It contains a default user of `monty:password` for development purposes. Please do not use this in the production system.

To build:
```
docker build -t ds/chats-db .
```
This command will build a new chats-db docker image. 


To run:
```
docker run -p 3312:3306 --rm --name chats-db -e MYSQL_ROOT_PASSWORD=my-secret-pw -it ds/chats-db
```
This command will run a new chats-db container. The port that is exposed from the image is `3306`. This can be redirected to any other ports on the host computer. `3312` is chosen arbitarily in the above command. The password for the root user is currently set to `my-secret-pw`. `-it` will run this container in interactive shell mode. 
