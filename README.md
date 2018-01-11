## Dockerfile for MongoDB

install MongoDB by Docker

###### Function
- Create database for application database
- Create Username and password for application database

#### Build Dockerfile
```
docker build -t mymongo .
```

#### create container
* port binding
```
docker run -d -p 27017:27017 --name mongodb gloriajun/my-mongo
```

* volume binding
```
docker run -d \
-p 27017:27017 \
-v /Volumes/data/docker/db/mongodb/:/data/db \
--name mongodb gloriajun/my-mongo
```

#### application database setting
###### default database setting
```
docker exec mongodb sh /create_db.sh
```

###### customize database setting
```
docker exec \
-e MONGODB_APP_DBNAME=mytestdb \
-e MONGODB_APP_USERNAME=tester \
-e MONGODB_APP_PASSWORD=passw0rd \
mongodb sh /create_db.sh
```
