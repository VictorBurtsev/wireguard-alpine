FROM alpine:3.17

RUN apk add -U wireguard-tools=1.0.20210914-r1 \
		&& echo "wireguard" | tee /etc/modules-load.d/wireguard.conf \
		&& echo "options wireguard dyndbg=+p" | tee /etc/modprobe.d/wireguard.conf \
		&& rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
