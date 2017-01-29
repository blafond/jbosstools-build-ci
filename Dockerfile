FROM centos:centos7
MAINTAINER Jeff Maury <jmaury@redhat.com>

# install deps required by our build
RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 352c64e5 f4a80eb5
RUN gpg2 --export -a 352c64e5 >352c64e5.key;gpg2 --export -a f4a80eb5 >f4a80eb5.key
RUN rpm --import 352c64e5.key;rpm --import f4a80eb5.key
RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm

RUN yum install -y python-pip git

RUN pip install python-magic jira

WORKDIR /tmp/

ENTRYPOINT [ "/bin/bash", "-l" ]