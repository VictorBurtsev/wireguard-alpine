#!/bin/sh

cat << EOF > /etc/wireguard/wg0.conf
[Interface]
PrivateKey = YP3dNo3cEbtPZThtZzkcve0Q74Nrz6ob5Y5sm1nLIXE=
Address = 10.0.0.1/24
ListenPort = 51820
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey = x4I5ZPyf9m0Pv7RduMCDBs6Amfleat1S3DcNmLOX8lc=
AllowedIPs = 10.0.0.2/32
EOF

wg-quick up wg0

while true
do
	wg show all dump | grep 10.0 | awk 'BEGIN {}; {if (systime()-$6 <180 ) print strftime("%m-%d-%Y %H:%M:%S", systime()),$5, $4, (systime()-$6) "sec" } ; END {}'
	sleep 60s
done
