#!/bin/sh

wg-quick up wg0

while true
do
	wg show all dump | grep 10.0 | awk 'BEGIN {}; {if (systime()-$6 <180 ) print strftime("%m-%d-%Y %H:%M:%S", systime()),$5, $4, (systime()-$6) "sec" } ; END {}'
	sleep 60s
done
