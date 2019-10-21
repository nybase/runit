FROM centos:8

ENV ver=2.1.2

WORKDIR /package

RUN yum install -y wget make gcc ;\
    wget -c  http://smarden.org/runit/runit-$ver.tar.gz && tar zxf runit-$ver.tar.gz && cd admin/runit-$ver && ./package/install ;\
    cp -rf /package/admin/runit/command/* /sbin/ ;


### ERROR ###
### /usr/bin/ld: cannot find -lc
### seems no glibc-static in centos:8
