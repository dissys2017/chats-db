#!/bin/bash

# SQL Construct Folder (All *.sql files in this folder will be run)
SQL_CONSTRUCT=sql_construct

# Client Credentials Config file (WILL BE OVERWRITED IF EXISTS)
CLIENT_CNF=client.cnf

# Update client.cnf file 
# $MYSQL_ROOT_PASSWORD is defined in mysql docker
# otherwise use default root password as root

echo "[client]" > $CLIENT_CNF
echo "user=root" >> $CLIENT_CNF

if [ $MYSQL_ROOT_PASSWORD ]
then
	echo "password=$MYSQL_ROOT_PASSWORD" >> $CLIENT_CNF
else
	echo "password=root" >> $CLIENT_CNF
fi

echo "Created mysql client config file as '$CLIENT_CNF'"

# Loop through all *.sql files in lexical order

COUNTER=0
for f in $SQL_CONSTRUCT/*.sql
do 
	echo "Processing $f"
	cat $f | mysql --defaults-file=$CLIENT_CNF --default-character-set=utf8
	COUNTER=$((COUNTER + 1))
done
echo "Finished (processed $COUNTER files)"

source create_users.sh
