FROM java:8

ARG JMETER_VERSION="5.5"
ARG PLUGIN_MAN_VERSION="1.7"

ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN  ${JMETER_HOME}/bin

#ENV MIRROR_HOST http://mirrors.ocf.berkeley.edu/apache/jmeter
#user.propertiesENV JMETER_DOWNLOAD_URL ${MIRROR_HOST}/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ENV JMETER_PLUGINS_DOWNLOAD_URL https://repo1.maven.org/maven2/kg/apc
ENV JMETER_PLUGINS_FOLDER ${JMETER_HOME}/lib/ext/
ENV JMETER_HOME /opt/jmeter/apache-jmeter-5.5/

RUN mkdir /opt/jmeter \
    && cd /opt/jmeter/ \
    && wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.5.tgz \
    && tar -xvzf apache-jmeter-5.5.tgz -C /opt \
    && rm apache-jmeter-5.5.tgz

COPY user.properties $JMETER_HOME/bin

# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH

RUN curl -L ${JMETER_PLUGINS_DOWNLOAD_URL}/cmdrunner/2.2/cmdrunner-2.2.jar -o ${JMETER_HOME}/lib/cmdrunner-2.2.jar \
RUN curl -L ${JMETER_PLUGINS_DOWNLOAD_URL}/jmeter-plugins-manager/{$PLUGIN_MAN_VERSION}/jmeter-plugins-manager-{$PLUGIN_MAN_VERSION}.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-manager-{$PLUGIN_MAN_VERSION}.jar

ENV PATH $PATH:$JMETER_BIN

COPY ./launch.sh /
RUN chmod +x /launch.sh

ENTRYPOINT ["/launch.sh"]
CMD ["-n -t /mnt/jmeter/script.jmx -l /mnt/jmeter/results/reslut-$(date +'%m_%d_%Y-%H_%M_%S_%N').jtl -j /mnt/jmeter/logs/master-log-$(date +'%m_%d_%Y-%H_%M_%S_%N').log"]
