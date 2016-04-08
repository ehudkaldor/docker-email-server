#!/bin/sh

#createUser="CREATE USER $POSTFIX_USER WITH PASSWORD '$POSTFIX_PASSWORD';"
#createSql="CREATE DATABASE $POSTFIX_DB WITH OWNER $POSTFIX_USER;"
#createUsersTable="CREATE TABLE users (email TEXT NOT NULL, password TEXT NOT NULL, realname TEXT, maildir TEXT NOT NULL, created TIMESTAMP WITH TIME ZONE #DEFAULT now(), PRIMARY KEY (email));"
#createTransportTable="CREATE TABLE transports (domain  TEXT NOT NULL, gid INTEGER UNIQUE NOT NULL, transport TEXT NOT NULL, PRIMARY KEY (domain));"
#createAliasTable="CREATE TABLE aliases (alias TEXT NOT NULL, email TEXT NOT NULL, PRIMARY KEY (alias));"
#transferOwnerToMailreader="ALTER DATABASE $POSTFIX_DB OWNER TO $POSTFIX_USER; ALTER TABLE users OWNER TO $POSTFIX_USER; ALTER TABLE transports OWNER TO $POSTFIX_USER; ALTER TABLE aliases OWNER TO $POSTFIX_USER;"
#echo $createUser | gosu postgres psql
#echo $createSql | gosu postgres psql
#echo $createUsersTable | gosu postgres psql -d mail
#echo $createTransportTable | gosu postgres psql -d mail
#echo $createAliasTable | gosu postgres psql -d mail
