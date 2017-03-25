# docker-hive
hive 1.2.1 <br/>
hadoop 2.7.1 <br/>
Docker hub url <a href="https://hub.docker.com/r/hrushikesh198/hive/" target="_blank">https://hub.docker.com/r/hrushikesh198/hive/</a><br>
This container is built on top of <a href="https://github.com/sequenceiq/hadoop-docker" target="_blank">sequenceiq/hadoop-docker</a>:2.7.1


## Basic docker operations
* Pull docker hive image `docker pull hrushikesh198/hive:1.0.0`
* Create and Run container daemon `docker run -d -v ~/work:/root/work --name hive_cont1 hrushikesh198/hive:1.0.0`
    * `-v ~/work:/root/work` creates a shared folder for easy data transfer to/from container
    * It takes few minutes to start hive thrift connection.
    * Progress logs can be checked using `docker logs -f hive_cont1`
* Login to container bash shell `docker exec -it hive_cont1 'bash'`
* Start/Stop/Restart container using `docker start/stop/restart hive_cont1` without losing any data.
* If you want to make changes to the container like adding/removing shared folders and exposing new ports
    * Commit current container `docker commit hive_cont1 hive_commited_img1`
    * Create a new container from the committed image `docker run -d -P 10002:10002 --name hive_cont1 hive_commited_img1`


## Connecting to beeline hive client
Log in to the running hive containier.
* Run precreated alias `bl` or ` beeline -u jdbc:hive2://localhost:10000` to connect beeline.
* Test your hive setup with a query `SELECT 1;`

