################################################
#
#
#
#
#
################################################

FROM		ehudkaldor/alpine-s6:3.4
MAINTAINER	Ehud Kaldor <ehud.kaldor@gmail.com>

RUN		apk add --update openssl && \
		apk upgrade --update && \
#		echo "@community http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
		apk add --update \
			dovecot \
			dovecot-pgsql \
			dovecot-pigeonhole-plugin \
#			dovecot-pigeonhole-plugin@community \
#			dovecot-pigeonhole-plugin-tools@community \
			clamsmtp \
			spamassassin \
			clamav \
			clamav-libunrar \
			libbz2 \
			ncurses \
			openrc \
			postfix \
 			postfix-pgsql \
			postgrey \
			gnutls \
			ca-certificates \
			postgresql-client \
			curl \
			postgresql \
			postgresql-contrib && \
                rm -rf /tmp/* && \
		rm -rf /var/cache/apk/*

#RUN		mkdir -p /etc/services.d/clamsmtp
#RUN		mkdir -p /etc/services.d/clamav
#RUN		mkdir -p /etc/services.d/spamassassin

ADD		rootfs /
ADD		initdb.d /initdb.d/
ADD 		conf /opt/

#EXPOSE		10024

EXPOSE		25 465 587 10024

RUN		mkdir -p /var/spool/mail/vhosts


RUN		for srv_dir in `ls /etc/services.d/`; do ln -s /bin/s6-true /etc/services.d/$srv_dir/finish ; done
#		ln -s /bin/s6-true /etc/services.d/clamav/finish && \
#		ln -s /bin/s6-true /etc/services.d/spamassassin/finish && \
#		freshclam --verbose
RUN		mkdir /run/clamav 

