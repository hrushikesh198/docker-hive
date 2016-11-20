#!/usr/bin/env bash
whoami
echo alias bl=\'beeline -u jdbc:hive2://localhost:10000\' >> /root/.bashrc
hive --service hiveserver2 --hiveconf hive.server2.thrift.port=10000 --hiveconf hive.root.logger=INFO,console --hiveconf hive.server2.enable.doAs=false &
/etc/bootstrap.sh -d
