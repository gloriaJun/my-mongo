#!/bin/bash

# command
CMD="mongod"

# application db user
MONGODB_APP_DBNAME=${MONGODB_APP_DBNAME:-"dashboard"}
MONGODB_APP_USERNAME=${MONGODB_APP_USERNAME:-"appadmin"}
MONGODB_APP_PASSWORD=${MONGODB_APP_PASSWORD:-"passw0rd!"}

# excute mongoDB
#$CMD &

# Wait for MongoDB to boot
RET=1
while [ $RET -ne 0 ]; do
    echo "=> Waiting for confirmation of MongoDB service startup..."
    sleep 5s
    mongo admin --eval "help" >/dev/null 2>&1
    RET=$?
    if [ $RET -ne 0 ]; then
      $CMD &
    fi
done

# create database
echo "==> create database[$MONGODB_APP_DBNAME] and user[$MONGODB_APP_USERNAME]"
mongo admin << EOF
use $MONGODB_APP_DBNAME
db.createUser({
  user: "$MONGODB_APP_USERNAME",
  pwd: "$MONGODB_APP_PASSWORD",
  roles: [{role: "readWrite", db: "$MONGODB_APP_DBNAME"}]})
EOF
sleep 2s

echo "==> DONE !!"


#echo "========================================================================"
#echo "You can now connect to the admin MongoDB server using:"
#echo ""
#echo "    mongo admin -u $MONGODB_ADMIN_USER -p $MONGODB_ADMIN_PASS --host <host> --port <port>"
#echo ""
#echo "Please remember to change the admin password as soon as possible!"
#echo "========================================================================"
