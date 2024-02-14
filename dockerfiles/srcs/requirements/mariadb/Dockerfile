FROM debian:11

RUN apt-get update && \
    apt-get -y install \
        gettext-base \
        mariadb-server \
	mariadb-client \
        procps \
        vim
RUN mkdir -p /var/run/mysqld \
  && chown -R mysql:mysql /var/run/mysqld

COPY ./conf/my.cnf /my.cnf.tmpl

RUN chmod 744 /my.cnf.tmpl

RUN mv /my.cnf.tmpl /etc/mysql/my.cnf

COPY ./tools/run.sh /run.sh

VOLUME [ "/sys/fs/cgroup" ]

ENTRYPOINT [ "bash", "/run.sh" ]
