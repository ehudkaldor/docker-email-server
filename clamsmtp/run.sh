#!/bin/bash

export tag
if [[ -n $1 ]]; then
  tag=":$1" 
else
  tag=":latest"
fi

docker run \
	-it \
	-h amavis.connected.us.com \
	-e "ADMIN_EMAIL=root@connected.us.com" \
	-e "SMTP_DOMAIN=connected.us.com" \
	-e "SMTP_HOSTNAME=email.connected.us.com" \
	-e "PGSQL_HOST=pgsql.connected.us.com" \
	-e "CLAM_HOST=clam.connected.us.com" \
	-P \
	--rm \
	--name clamsmtp \
	ehudkaldor/clamsmtp$tag \
	sh
