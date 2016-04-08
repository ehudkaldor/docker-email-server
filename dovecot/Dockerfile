################################################
#
#
#
#
#
################################################

FROM		ehudkaldor/alpine-s6
MAINTAINER	Ehud Kaldor <ehud.kaldor@gmail.com>

RUN		apk add --update openssl && \
		apk upgrade --update && \
		echo "@community http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
		apk add --update dovecot dovecot-pgsql acf-dovecot dovecot-pigeonhole-plugin@community dovecot-pigeonhole-plugin-tools@community && \
		rm -rf /var/cache/apk/*

RUN		mkdir -p /etc/services.d/dovecot

EXPOSE		143 993 12345 10026

VOLUME		/etc/dovecot /srv/mail /private/ssl

ADD		rootfs /

ADD 		dovecot.run /etc/services.d/dovecot/run

COPY 		conf/dovecot /opt/dovecot.default

RUN		ln -s /bin/s6-true /etc/services.d/dovecot/finish
