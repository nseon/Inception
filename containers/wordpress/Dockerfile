FROM alpine:3.22.3

RUN apk add --no-cache \
	php83 \
	php83-fpm \
	php83-mysqli \
	php83-json \
	php83-curl \
	php83-dom \
	php83-exif \
	php83-fileinfo \
	php83-mbstring \
	php83-openssl \
	php83-xml \
	php83-zip \
	wget

RUN	mkdir -p /usr/share/webapps/ && \
	cd /usr/share/webapps/ && \
	wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz

RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php83/php-fpm.d/www.conf

COPY --chmod=+x entrypoint.sh .

EXPOSE 9000

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
