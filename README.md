# docker-hive
hive 1.2.1
Docker hub url <a href="https://hub.docker.com/r/hrushikesh198/hive/" target="_blank">https://hub.docker.com/r/hrushikesh198/hive/</a>.

This container is built on top of <a href="https://github.com/sequenceiq/hadoop-docker" target="_blank">sequenceiq/hadoop-docker</a>.

## Start container
```
$ docker pull hrushikesh198/hive
$ docker run -itd --name hive hrushikesh198/hive
```
* It takes few minutes to start. You can check progress with`$ docker logs -f hive`. Wait for log `Started HttpServer[hiveserver2] on port 10002`.
* If you get error about container with same name `hive` exists. You can delete it with `docker rm -f hive`.
## Login to container
```
$ docker exec -it hive bash	
```

## Connect to beeline inside container   
* Run alias `bl` or ` beeline -u jdbc:hive2://localhost:10000` to connect beeline.
* Test your hive setup with a query `SELECT 1;`

## Connect from outside container
Start docker with port forwarding `10000`(hiveserver2), `10002`(webui).
```
$ docker run -itd -p 10000:10000 -p 10002:10002 \
    --name hive hrushikesh198/hive
``` 
Visit <a href="http://localhost:10002" target="_blank">http://localhost:10002</a> for webui.

* For easy data transfer you can mount a host directory inside container
  ```
  $ docker run -itd -v /path/to/data:/data --name hive hrushikesh198/hive
  ```
* You can try `docker start/stop/restart hive` without losing hdfs data. This has been achieved through a docker volume `/tmp/hadoop-root`.
  


