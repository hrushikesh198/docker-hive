FROM sequenceiq/hadoop-docker:2.7.1

#https://github.com/hrushikesh198/docker-hive
ENV HIVE_VERSION=2.1.0
ENV HIVE_HOME=/usr/local/hive
RUN curl -O http://apache.claz.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz &&\
	tar -zxf ./apache-hive-${HIVE_VERSION}-bin.tar.gz &&\
	mv ./apache-hive-${HIVE_VERSION}-bin $HIVE_HOME &&\
	rm -f ./apache-hive-${HIVE_VERSION}-bin.tar.gz
ENV PATH=$HIVE_HOME/bin:$HADOOP_HDFS_HOME/bin:$PATH
RUN schematool -dbType derby -initSchema
CMD hive --service hiveserver2 --hiveconf hive.server2.thrift.port=10000 --hiveconf hive.root.logger=INFO,console --hiveconf hive.server2.enable.doAs=false
EXPOSE 10000 10002
ENV PS1='[\D{%m/%d %H:%M} \u@\h \w]$ '
RUN echo "alias bl='beeline -u jdbc:hive2://localhost:10000'">/root/.bashrc

