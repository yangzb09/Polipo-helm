#!/usr/bin/env bash
logs=${LOG_PATH:-/logs}

conf=${CONFIG_PATH:-./conf/config.yml}

loop=$1

sed -i "s/SSR_HOST/$SSR_HOST/g" polipo/config
sed -i "s/SSR_PORT/$SSR_PORT/g" polipo/config

for i in `seq 1 $loop`
do

epoch=`date +%s`


./polipo/polipo -c polipo/config

sleep 1

done

# sleep
while true; do sleep 100; done
