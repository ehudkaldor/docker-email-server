-- Revoke creating and using public schema for all
REVOKE CREATE ON SCHEMA public FROM PUBLIC;
REVOKE USAGE ON SCHEMA public FROM PUBLIC;

-- Give 'postgres' (sa) permission to create and use public schema
GRANT CREATE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO postgres;

-- Create postfix user and database
CREATE USER ##POSTFIX_PGSQL_USER## WITH ENCRYPTED PASSWORD '##POSTFIX_PGSQL_PASS##';
CREATE DATABASE ##POSTFIX_PGSQL_DB## WITH OWNER ##POSTFIX_PGSQL_USER##;
GRANT CONNECT ON DATABASE ##POSTFIX_PGSQL_DB## to ##POSTFIX_PGSQL_USER##;

-- Connect to mail DB and create tables
\c mail
CREATE EXTENSION pgcrypto;
CREATE TABLE transports (domain TEXT NOT NULL, gid INTEGER UNIQUE NOT NULL, transport TEXT NOT NULL, PRIMARY KEY (domain));
CREATE TABLE users (email TEXT NOT NULL, domain TEXT NOT NULL references transports(domain), password TEXT NOT NULL, realname TEXT, maildir TEXT NOT NULL, created TIMESTAMP WITH TIME ZONE DEFAULT now(), PRIMARY KEY (email));
CREATE TABLE aliases (source TEXT NOT NULL, destination TEXT NOT NULL, PRIMARY KEY (source));

ALTER DATABASE ##POSTFIX_PGSQL_DB## OWNER TO ##POSTFIX_PGSQL_USER##;
ALTER TABLE transports OWNER TO ##POSTFIX_PGSQL_USER##;
ALTER TABLE users OWNER TO ##POSTFIX_PGSQL_USER##;
ALTER TABLE aliases OWNER TO ##POSTFIX_PGSQL_USER##;
-- Grant read permissions to DB ##POSTFIX_PGSQL_DB## to postfix user
-- GRANT USAGE ON SCHEMA public to ##POSTFIX_PGSQL_USER##; 
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO ##POSTFIX_PGSQL_USER##;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO ##POSTFIX_PGSQL_USER##;
