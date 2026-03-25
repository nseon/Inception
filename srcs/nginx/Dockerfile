FROM alpine:3.22

RUN apk add --no-cache nginx openssl && mkdir -p etc/nginx/ssl

COPY nginx.conf /etc/nginx/
COPY --chmod=+x entrypoint.sh .

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
