\c mail
INSERT INTO transports (domain, gid, transport) VALUES ('##SMTP_DOMAIN##', 1010, 'virtual:');
INSERT INTO users (email, domain, password, realname, maildir) VALUES ('root@##SMTP_DOMAIN##', '##SMTP_DOMAIN##', crypt('changeme',gen_salt('bf',5)), 'root', 'root/');
INSERT INTO aliases (source, destination) VALUES ('admin@##SMTP_DOMAIN##', 'root@##SMTP_DOMAIN##');
