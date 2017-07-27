#
# software Dockerfile
# 
# Installing basic software set for oraclelinux:7
#

# Pull base image.
FROM centos

MAINTAINER ser891@me.com
RUN rm -f /etc/localtime && \
ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime

COPY erlang.repo /etc/yum.repos.d/
RUN useradd rabbitmq -o -u 11 -g 0
RUN yum clean all;
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y  mercurial git net-tools erlang
RUN yum install -y  https://bintray.com/rabbitmq/rabbitmq-server-rpm/download_file?file_path=rabbitmq-server-3.6.10-1.el7.noarch.rpm
COPY run.sh /
