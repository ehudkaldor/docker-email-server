\c mail
INSERT INTO users (email, password, realname, maildir) VALUES ('##ADMIN_EMAIL##', md5('changeme'), 'admin', 'admin/');
INSERT INTO transports (domain, gid, transport) VALUES ('##SMTP_DOMAIN##', 1010, 'virtual:');
INSERT INTO aliases (alias, email) VALUES ('admin', '##ADMIN_EMAIL##');
