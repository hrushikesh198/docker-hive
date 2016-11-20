# docker-hive
Docker container for hive

This Dockerfile uses [sequenceiq/hadoop-docker](https://github.com/sequenceiq/hadoop-docker).

## Start container
```
$ docker run -itd --name hive hrushikesh198/hive
```

## Login to container
```
$ docker exec -it hive bash	
```

## Connect to beeline inside container
```
$ beeline -u jdbc:hive2://localhost:10000    
beeline> select 1;     
```
I have added a handy alias `bl` for the above.

## Connect from outside container
Start docker with port forwarding `10000`(hiveserver2), `10002`(webui).
```
$ docker run -itd -p 10000:10000 p 10002:10002 \
    --name hive hrushikesh198/hive
```
`jdbc:hive2://localhost:10000` can be used from beeline or jdbc driver. 
Visit [http://localhost:10002](http://localhost:10002) for webui.
 

