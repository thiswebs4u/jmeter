FROM java:8

ARG JMETER_VERSION="5.5"
ARG PLUGIN_MAN_VERSION="1.7"

ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN  ${JMETER_HOME}/bin
ENV PATH $PATH:${JMETER_BIN}
ENV JMETER_LIB ${JMETER_HOME}/lib
#ENV MIRROR_HOST http://mirrors.ocf.berkeley.edu/apache/jmeter
#user.propertiesENV JMETER_DOWNLOAD_URL ${MIRROR_HOST}/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ENV JMETER_PLUGINS_DOWNLOAD_URL https://repo1.maven.org/maven2/kg/apc
ENV JMETER_PLUGINS_FOLDER ${JMETER_HOME}/lib/ext/

# Add Jmeter to the Path
ENV PATH ${JMETER_HOME}/bin:$PATH

RUN wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz \
    && tar -xvzf apache-jmeter-${JMETER_VERSION}.tgz -C /opt \
    && rm apache-jmeter-${JMETER_VERSION}.tgz

COPY user.properties ${JMETER_BIN}/
COPY cmdrunner-2.2.jar ${JMETER_LIB}
COPY jmeter-plugins-manager-1.4.jar  ${JMETER_PLUGINS_FOLDER}/
COPY jmeter-plugins-graphs-vs-2.0.jar  ${JMETER_PLUGINS_FOLDER}/

COPY plugins/lib/jmeter-plugins-cmn-jmeter-0.6.jar  ${JMETER_LIB}
COPY plugins/lib/ext/jmeter-plugins-casutg-2.9.jar  ${JMETER_PLUGINS_FOLDER}
COPY plugins/lib/ext/jmeter-plugins-dummy-0.4.jar  ${JMETER_PLUGINS_FOLDER}


#RUN curl -L ${JMETER_PLUGINS_DOWNLOAD_URL}/cmdrunner/2.2/cmdrunner-2.2.jar -o ${JMETER_HOME}/lib/cmdrunner-2.2.jar
#RUN curl -L ${JMETER_PLUGINS_DOWNLOAD_URL}/jmeter-plugins-manager/{$PLUGIN_MAN_VERSION}/jmeter-plugins-manager-{$PLUGIN_MAN_VERSION}.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-manager-{$PLUGIN_MAN_VERSION}.jar

COPY ./launch.sh /
RUN chmod +x /launch.sh

ENTRYPOINT ["/launch.sh"]
#CMD ["-n -t /etc/jmeter/script.jmx -l /etc/jmeter/results/reslut-$(date +'%m_%d_%Y-%H_%M_%S_%N').jtl -j /etc/jmeter/logs/master-log-$(date +'%m_%d_%Y-%H_%M_%S_%N').log"]