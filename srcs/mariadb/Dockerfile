FROM alpine:3.22

RUN apk add --no-cache mariadb mariadb-client && \
	mkdir -p /var/lib/mysql /run/mysqld && \
	chown -R mysql:mysql /var/lib/mysql /run/mysqld && \
	sed -i "s|skip-networking|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

COPY --chmod=+x entrypoint.sh .

EXPOSE 3306

USER mysql

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
