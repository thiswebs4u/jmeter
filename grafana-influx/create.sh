#!/bin/bash
pwd=`pwd`
CONFIGPATH=$pwd/config/
mkdir -p $CONFIGPATH

echo pwd=$pwd

#create grafana copy
cp grafana.yaml.bak $CONFIGPATH'grafana.yaml'
#update persistance path grafana
sed -i '' 's@PERSISTANCE@'$pwd/grafana/'@g' $CONFIGPATH'grafana.yaml'
#create data files
mkdir -p $pwd/grafana/
chmod 777 -R $pwd/grafana/

echo pwd/grafana/=$pwd/grafana/

#create influxdb copy
cp influxdb.yaml.bak $CONFIGPATH'influxdb.yaml'
#update persistance path grafana
sed -i '' 's@PERSISTANCE@'$pwd/influxdb/'@g' $CONFIGPATH'influxdb.yaml'
#create date folder
mkdir -p $pwd/influxdb/
chmod 777 -R $pwd/influxdb/
#Start Infuxdb and Grafana containers
kubectl apply -f $CONFIGPATH/influxdb.yaml
kubectl apply -f $CONFIGPATH/grafana.yaml
