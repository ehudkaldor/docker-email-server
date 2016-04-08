#!/bin/bash

export tag
if [[ -n $1 ]]; then
  tag=":$1" 
else
  tag=":latest"
fi

docker run \
	-it \
	-h email.connected.us.com \
	-e "ADMIN_EMAIL=root@connected.us.com" \
	-e "SMTP_DOMAIN=connected.us.com" \
	-e "SMTP_HOSTNAME=email.connected.us.com" \
	-e "PGSQL_HOST=pgsql.connected.us.com" \
	-e "POSTFIX_PGSQL_USER=mailreader" \
	-e "POSTFIX_PGSQL_PASS=JJisCC" \
	-e "POSTFIX_PGSQL_DB=mail" \
	-e "DOVECOT_HOST=dovecot.connected.us.com" \
	-e "DOVECOT_PGSQL_USER=dovecot" \
	-e "DOVECOT_PGSQL_PASS=dovecot" \
	-e "SPAMASSASSIN_HOST=spamd.connected.us.com" \
	-v /etc/postfix \
	-v /var/spool/mail/vhosts \
	-P \
	--rm \
	--name postfix \
	ehudkaldor/postfix$tag \
	sh
