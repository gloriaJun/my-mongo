## Dockerfile for MongoDB

#### build image
```
docker build -t mymongo .
```

#### create container
* port binding
```
docker run -d -p 27017:27017 --name mongodb mymongo
```

* volume binding
```
docker run -d -p 27017:27017 -v /Volumes/data/docker/db/mongodb/:/data/db --name mongodb mymongo
```
