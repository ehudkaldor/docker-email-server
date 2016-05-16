################################################
#
#
#
#
#
################################################

FROM		ehudkaldor/alpine-s6:latest
MAINTAINER	Ehud Kaldor <ehud.kaldor@gmail.com>

RUN		echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
		apk add --update amavisd-new spamassassin clamav clamav-libunrar libbz2 ncurses perl-io-socket-inet6@testing && \
#		rc-update del freshclam clamav && \
		mv /etc/init.d/ /etc/init.d.old/ && \
                rm -rf /tmp/* && \
		rm -rf /var/cache/apk/*

RUN		mkdir -p /etc/services.d/amavis
RUN		mkdir -p /etc/services.d/clamav
RUN		mkdir -p /etc/services.d/spamassassin

ADD		rootfs /

EXPOSE		10024

RUN		ln -s /bin/s6-true /etc/services.d/amavis/finish && \
		ln -s /bin/s6-true /etc/services.d/clamav/finish && \
		ln -s /bin/s6-true /etc/services.d/spamassassin/finish && \
#		freshclam --verbose
		mkdir /run/amavis && \
		mkdir /run/clamav 
