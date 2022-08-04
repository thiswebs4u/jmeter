#!/bin/bash
CONFIGPATH=`pwd`/config/
#Stop Influxdb and Grafana containers
kubectl delete -f $CONFIGPATH/influxdb.yaml
kubectl delete -f $CONFIGPATH/grafana.yaml
