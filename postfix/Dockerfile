################################################
#
#
#
#
#
################################################

FROM		ehudkaldor/alpine-s6
MAINTAINER	Ehud Kaldor <ehud.kaldor@gmail.com>

#RUN		echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN 		apk add --update \
#			rsync \
			postfix \
 			postfix-pgsql \
			postgrey \
			gnutls \
			ca-certificates \
			openssl \
			postgresql-client && \
		apk upgrade --update && \
                rm -rf /tmp/* && \
		rm -rf /var/cache/apk/*

EXPOSE		25 465 587 10025

RUN		mkdir -p /var/spool/mail/vhosts

VOLUME		/var/spool/mail/vhosts

VOLUME		/etc/postfix

#RUN		chown vmail:postdrop /var/spool/mail/vhosts

#ADD             postfix.run /etc/services.d/postfix/run
RUN             ln -s /bin/s6-true /etc/services.d/postfix/finish

ADD 		conf/postfix /opt/postfix.default

ADD		rootfs /

ADD		setup /initdb.d/

