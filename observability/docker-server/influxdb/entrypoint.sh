#!/usr/bin/env sh
# https://docs.influxdata.com/influxdb/v1.7/query_language/database_management/

if [ ! -f "/var/lib/influxdb/.init" ]; then
    exec influxd $@ &
    
    until wget -q "http://localhost:8086/ping" 2> /dev/null; do
        sleep 1
    done
    
    influx -host=localhost -port=8086 -execute="CREATE USER ${INFLUX_USER} WITH PASSWORD '${INFLUX_PASSWORD}' WITH ALL PRIVILEGES"
    influx -username admin -password admin -host=localhost -port=8086 -execute="CREATE DATABASE ${INFLUX_DB}"
    influx -username admin -password admin -host=localhost -port=8086 -execute="CREATE DATABASE ${TELEGRAF_DB}"
    influx -username admin -password admin -host=localhost -port=8086 -execute="CREATE RETENTION POLICY "one_day_only" ON ${INFLUX_DB} DURATION 7d REPLICATION 1"
    influx -username admin -password admin -host=localhost -port=8086 -execute="CREATE RETENTION POLICY "one_day_only" ON ${TELEGRAF_DB} DURATION 7d REPLICATION 1"
    
    touch "/var/lib/influxdb/.init"
    
    kill -s TERM %1
fi

exec influxd $@
