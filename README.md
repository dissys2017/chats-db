# Chats DB


To build:
```
docker build -t ds/chats-db .
```

To run:
```
docker run -p 3312:3306 --rm --name chats-db -e MYSQL_ROOT_PASSWORD=my-secret-pw -it ds/chats-db
```
