# base image
FROM debian:11

# install mariadb server
RUN apt-get update && apt-get install -y mariadb-server

# expose default mariadb port
EXPOSE 3306

RUN mysql_install_db

# copy entrypoint script to a different location
COPY conf/entrypoint.sh /usr/local/bin/

# grant execute permission to the entrypoint script
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
