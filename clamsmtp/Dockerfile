################################################
#
#
#
#
#
################################################

FROM		ehudkaldor/alpine-s6:latest
MAINTAINER	Ehud Kaldor <ehud.kaldor@gmail.com>

RUN		apk add --update clamsmtp spamassassin clamav clamav-libunrar libbz2 ncurses openrc && \
#		rc-update del clamav && \
#		rc-update del clamsmtp default && \
#		rc-update del spamassassin default && \
#		rc-update del freshclam default && \
                rm -rf /tmp/* && \
		rm -rf /var/cache/apk/*

RUN		mkdir -p /etc/services.d/clamsmtp
RUN		mkdir -p /etc/services.d/clamav
RUN		mkdir -p /etc/services.d/spamassassin

ADD		rootfs /

EXPOSE		10024

RUN		ln -s /bin/s6-true /etc/services.d/clamsmtp/finish && \
		ln -s /bin/s6-true /etc/services.d/clamav/finish && \
		ln -s /bin/s6-true /etc/services.d/spamassassin/finish && \
#		freshclam --verbose
		mkdir /run/clamav 
