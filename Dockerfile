#FROM centos:8

FROM rockylinux/rockylinux:8

ENV ver=2.1.2

WORKDIR /package

RUN yum install -y dnf-plugins-core || true ; yum config-manager --enable PowerTools || true;dnf config-manager --set-enabled powertools || true ; yum update -y ; yum repolist; yum install -y wget make gcc glibc-static ;\
    wget -c  http://smarden.org/runit/runit-$ver.tar.gz && tar zxf runit-$ver.tar.gz && cd admin/runit-$ver && ./package/install ;\
    cp -rf /package/admin/runit/command/* /usr/local/sbin/ ;
