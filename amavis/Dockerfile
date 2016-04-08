################################################
#
#
#
#
#
################################################

FROM		ehudkaldor/alpine-s6
MAINTAINER	Ehud Kaldor <ehud.kaldor@gmail.com>

RUN		apk add --update amavisd-new spamassassin clamav && \
		rm -rf /var/cache/apk/*

RUN		mkdir -p /etc/services.d/amavis
RUN		mkdir -p /etc/services.d/clamav
RUN		mkdir -p /etc/services.d/spamassassin

ADD		setup/amavisd.conf /etc/

#EXPOSE		25 465 587 143 993

ADD 		amavis.setup /etc/services.d/amavis/setup
ADD 		amavis.run /etc/services.d/amavis/run
RUN		ln -s /bin/true /etc/services.d/amavis/finish

ADD 		clamav.setup /etc/services.d/clamav/setup
ADD 		clamav.run /etc/services.d/clamav/run
RUN		ln -s /bin/true /etc/services.d/clamav/finish

ADD 		spamassassin.setup /etc/services.d/spamassassin/setup
ADD 		spamassassin.run /etc/services.d/spamassassin/run
RUN		ln -s /bin/true /etc/services.d/spamassassin/finish

