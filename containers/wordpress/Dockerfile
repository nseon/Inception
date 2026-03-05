FROM alpine:3.22.3

RUN apk add --no-cache wordpress

COPY entrypoint.sh .

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
