################################################
#
#
#
#
#
################################################

FROM		ehudkaldor/alpine-s6
MAINTAINER	Ehud Kaldor <ehud.kaldor@gmail.com>

RUN 		apk add --update spamassassin wget && \
		rm -rf /var/cache/apk/*

RUN		mkdir -p /etc/services.d/spamassassin

VOLUME		/etc/spamassassin
VOLUME		/var/lib/spamassassin

ADD 		spamd.run /etc/services.d/spamassassin/run

RUN		adduser -H -D -s nologin spamd

RUN		cd /etc/services.d/spamassassin && ln -s /var/true

ADD 		conf/spamd.conf /etc/spamd.conf

EXPOSE 		10025
