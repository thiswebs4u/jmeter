#!/bin/bash
set -x

echo "JVM_ARGS=${JVM_ARGS}"

echo "START Running Jmeter on `date`"

#Install PluginManager and plugins  https://jmeter-plugins.org/wiki/PluginsManagerAutomated/
#java -cp /opt/apache-jmeter-5.5/lib/ext/jmeter-plugins-manager-1.4.jar org.jmeterplugins.repository.PluginManagerCMDInstaller install jpgc-casutg,jpgc-dummy
#PluginsManagerCMD.sh install jpgc-casutg,jpgc-dummy
#PluginsManagerCMD.sh status

#Start Jmeter
if [ "$mode" == "master" ]; then
  jmeter $@
else
  jmeter-server >>  /etc/jmeter/logs/$mode-jmeter-server_`date '+%Y-%m-%d_%H-%M-%S'`.log
fi

echo `whoami`
echo "END Running Jmeter on `date`"
