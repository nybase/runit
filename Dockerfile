#FROM centos:8

FROM rockylinux/rockylinux:8

ENV ver=2.1.2

WORKDIR /package

RUN dnf install -y dnf-plugins-core || true ; dnf config-manager --enable PowerTools || true;dnf config-manager --set-enabled powertools || true ; dnf update -y ; dnf repolist; dnf install -y wget make gcc glibc-static ;\
    wget -c  http://smarden.org/runit/runit-$ver.tar.gz && tar zxf runit-$ver.tar.gz && cd admin/runit-$ver && ./package/install ;\
    cp -rf /package/admin/runit/command/* /usr/local/sbin/ ;




### ERROR ###
### /usr/bin/ld: cannot find -lc
### seems no glibc-static in centos:8
