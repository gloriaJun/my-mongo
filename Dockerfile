#### Installation mongodb with auth and create user database
FROM ubuntu:16.04

# Import the public key used by the package management system
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
# Create a list file for MongoDB
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# update local package database
RUN apt-get update
# Install the latest stable version of MongoDB
RUN apt-get install -y mongodb-org

# create database folder
VOLUME ["/data/db"]

# excute mongodb
CMD ["mongod"]

# expose ports
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017

# mongodb 설치 후에 실행할 스크립트 파일을 이미지 내부로 복사
#ADD set_mongodb.sh /tmp/set_mongodb.sh
#RUN chmod +x /tmp/set_mongodb.sh
