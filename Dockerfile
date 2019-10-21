FROM centos:7 as builder

ENV ver=2.1.2

WORKDIR /package

RUN yum install -y wget make gcc glibc-static ;\
    wget -c  http://smarden.org/runit/runit-$ver.tar.gz ; tar zxf runit-$ver.tar.gz; cd admin/runit-$ver; ./package/install ;\
    cp -rf /package/admin/runit/command/* /sbin/ ;


FROM centos:7

COPY --from=builder /package/admin/runit/command/ /usr/local/sbin/
