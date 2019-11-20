#!/bin/bash

influx -execute "CREATE USER admin WITH PASSWORD 'Ab888888' WITH ALL PRIVILEGES"
influx -execute "CREATE USER forms WITH PASSWORD 'Ab888888'"
influx -execute "CREATE DATABASE apm_metrics"
influx -database 'apm_metrics' -execute "GRANT ALL ON apm_metrics TO forms"
sed -i 's/#[ ]*auth-enabled.*$/auth-enabled = true/' /etc/influxdb/influxdb.conf
systemctl restart influxdb
