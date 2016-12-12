## Docker command line
- `docker ps -a -q` (a: all, q: quiet)
- `docker rm $(docker ps -a -q)`

## spring-boot-init
- [spring-boot-init image](https://hub.docker.com/r/zhongwei/spring-boot-init/)
- `docker run --name mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=springboot -d mysql`
- `docker run --name spring-boot-init --link mysql:mysql -p 8080:8080 -d zhongwei/spring-boot-init`
- `http://localhost:8080/`
- `docker exec -it mysql /bin/sh`
- `#mysql -uroot -proot`
- `mysql>show databases;`
- `mysql>use springboot;`
- `mysql>show tables;`

## create-react-app
- [create-react-app image](https://hub.docker.com/r/zhongwei/create-react-app/)
