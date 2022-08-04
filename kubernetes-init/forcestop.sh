#!/bin/bash
CONFIGPATH=`pwd`/config/
#jmeter master and slaves
echo CONFIGPATH=$CONFIGPATH
kubectl delete -R -f $CONFIGPATH
