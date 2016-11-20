FROM sequenceiq/hadoop-docker

#https://github.com/hrushikesh198/docker-hive
ENV HIVE_VERSION=1.2.1
ENV HIVE_HOME=/usr/local/hive
RUN curl -O http://apache.claz.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz &&\
	tar zxf ./apache-hive-${HIVE_VERSION}-bin.tar.gz &&\
	mv apache-hive-${HIVE_VERSION}-bin $HIVE_HOME &&\
	rm -f apache-hive-${HIVE_VERSION}-bin.tar.gz
ENV PATH=$HIVE_HOME/bin:$HADOOP_HDFS_HOME/bin:$PATH
VOLUME /tmp/hhadoop-root
#RUN schematool -dbType derby -initSchema
ENV PS1='[\D{%m/%d %H:%M} \u@\h \w]$ '
ADD entry.sh /
CMD bash /entry.sh
EXPOSE 10000 10002
