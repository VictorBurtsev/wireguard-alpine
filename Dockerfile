FROM alpine:3.17

RUN apk add -U wireguard-tools=1.0.20210914-r1 \
					&& rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
