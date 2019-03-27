# docker-sqlrelay
run sql-relay as docker container 

[sql-relay](http://sqlrelay.sourceforge.net/sqlrelay/)

[sql-relay configure](http://sqlrelay.sourceforge.net/sqlrelay/admin/configguide.html)

[configure example for mysql](https://github.com/ferdiozturk/docker-sqlrelay/blob/master/sqlrelay.conf)

## Usage
To run the container, do the following(for example):

start 

```sh 
docker run -p xx:xx -v /xx:/xx -t -i -d foerdi/sqlrelay /bin/bash
``` 

then 

```sh 
[root@xxxxxxxxxxxx /]# sqlr-start -config /xx/sqlrelay.conf -id xx
``` 
click `crtl+p+q` ,let container running in background 

or 

```shell
   docker run -p xx:xx -v /xx:/xx -t -i -d foerdi/sqlrelay start -config /xx/sqlrelay.conf -id xx
```



## Building

To build the image, simply invoke

    docker build github.com/ferdiozturk/docker-sqlrelay

A prebuilt container is also available in the docker index

    docker pull foerdi/sqlrelay

