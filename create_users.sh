#!/bin/bash

# SQL Users Folder (All *.sql files in this folder will be run)
SQL_USERS=sql_users

# Client Credentials Config file (WILL BE OVERWRITED IF EXISTS)
CLIENT_CNF=client.cnf

# Loop through all *.sql files in lexical order

COUNTER=0
for f in $SQL_USERS/*.sql
do 
	echo "Processing $f"
	cat $f | mysql --defaults-file=$CLIENT_CNF --default-character-set=utf8
	COUNTER=$((COUNTER + 1))
done
echo "Finished (processed $COUNTER files)"
