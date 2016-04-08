#!/bin/bash
export tag
if [[ -n $1 ]]; then
    tag=":$1"
else
    tag=":latest"
fi

docker run \
	-it \
	-h pgsql.connected.us.com \
	-e "SMTP_DOMAIN=connected.us.com" \
	-e "SMTP_HOSTNAME=email.connected.us.com" \
	-e "DOVECOT_HOST=dovecot.connected.us.com" \
	-e "MAIL_DB=mail" \
	-e "SMTP_DOMAIN=connected.us.com" \
	-e "MAILREADER_USER=mailreader" \
	-e "MAILREADER_PASS=JJisCC" \
	-e "DOVECOT_DB=dovecot" \
	-e "DOVECOT_USER=dovecot" \
	-e "DOVECOT_PASS=dovecot" \
	-P \
	--rm \
	--name pgsql \
	ehudkaldor/postgresql$tag \
	sh
