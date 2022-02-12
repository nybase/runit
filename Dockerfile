FROM  centos:7 as builder
#FROM quay.io/centos/centos:stream9 as builder
#FROM centos:8 as builder
#FROM rockylinux/rockylinux:8 as builder

ENV ver=2.1.2

WORKDIR /package

RUN yum install -y dnf-plugins-core || true ; yum install -y yum-utils || true ; \
    yum config-manager --enable PowerTools || true;yum config-manager --set-enabled powertools || true ; \
    yum config-manager --enable crb || true;\
    yum update -y ; yum repolist; yum install -y wget make gcc glibc-static ;\
    wget -c  http://smarden.org/runit/runit-$ver.tar.gz && tar zxf runit-$ver.tar.gz && cd admin/runit-$ver && ./package/install ;\
    cp -rf /package/admin/runit/command/* /usr/local/sbin/ ;


FROM quay.io/centos/centos:stream9
#FROM rockylinux/rockylinux:8

COPY --from=builder /package/admin/runit/command/ /usr/local/sbin/
