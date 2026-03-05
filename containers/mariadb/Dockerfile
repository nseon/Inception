FROM alpine:3.22.3

RUN apk add --no-cache mariadb mariadb-client
RUN mkdir -p /var/lib/mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld

RUN sed -i "s|skip-networking|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

COPY --chmod=+x entrypoint.sh .

EXPOSE 3306

USER mysql

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
