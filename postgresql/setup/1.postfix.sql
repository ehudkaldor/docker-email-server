-- Revoke creating and using public schema for all
REVOKE CREATE ON SCHEMA public FROM PUBLIC;
REVOKE USAGE ON SCHEMA public FROM PUBLIC;

-- Give 'postgres' (sa) permission to create and use public schema
GRANT CREATE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO postgres;

-- Create postfix user and database
CREATE USER ##MAILREADER_USER## WITH ENCRYPTED PASSWORD '##MAILREADER_PASS##';
CREATE DATABASE ##MAIL_DB## WITH OWNER ##MAILREADER_USER##;
GRANT CONNECT ON DATABASE mail to ##MAILREADER_USER##;

-- Connect to mail DB and create tables
\c mail
CREATE EXTENSION pgcrypto;
CREATE TABLE transports (domain TEXT NOT NULL, gid INTEGER UNIQUE NOT NULL, transport TEXT NOT NULL, PRIMARY KEY (domain));
CREATE TABLE users (email TEXT NOT NULL, domain TEXT NOT NULL references transports(domain), password TEXT NOT NULL, realname TEXT, maildir TEXT NOT NULL, created TIMESTAMP WITH TIME ZONE DEFAULT now(), PRIMARY KEY (email));
CREATE TABLE aliases (source TEXT NOT NULL, destination TEXT NOT NULL, PRIMARY KEY (source));

-- Grant read permissions to DB 'mail' to postfix user
-- GRANT USAGE ON SCHEMA public to ##MAILREADER_USER##; 
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO ##MAILREADER_USER##;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO ##MAILREADER_USER##;
