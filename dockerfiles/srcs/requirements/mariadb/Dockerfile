# base image
FROM debian:11

# install mariadb server
RUN apt-get update && apt-get install -y mariadb-server

# copy entrypoint script to a different location
COPY conf/entrypoint.sh /usr/local/bin/

# grant execute permission to the entrypoint script
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mysql_install_db

# expose default mariadb port
EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
