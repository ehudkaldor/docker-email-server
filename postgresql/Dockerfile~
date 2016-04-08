################################################
#
#
#
#
#
################################################

FROM		ehudkaldor/alpine-s6:latest
MAINTAINER	Ehud Kaldor <ehud.kaldor@gmail.com>

ENV 		PGDATA /var/lib/postgresql/data
ENV 		LANG en_US.utf8

RUN 		apk add --update curl postgresql postgresql-contrib && \
		mkdir /etc/services.d/postgresql && \
                rm -rf /tmp/* && \
		rm -rf /var/cache/apk/* 

VOLUME 		/var/lib/postgresql/data

ADD		rootfs /

COPY 		postgresql.run /etc/services.d/postgresql/run
RUN             ln -s /bin/s6-true /etc/services.d/postgresql/finish

EXPOSE 5432

#ADD             conf/postgres /opt/postgres.default

ADD		setup /initdb.d/
