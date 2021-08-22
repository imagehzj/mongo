FROM ttbb/base

LABEL maintainer="shoothzj@gmail.com"
LABEL description="Mongo nake image"

ARG version=5.0.2

RUN wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel80-$version.tgz && \
mkdir -p /opt/sh/mongo && \
tar -xf mongodb-linux-x86_64-rhel80-$version.tgz -C /opt/sh/mongo --strip-components 1 && \
rm -rf mongodb-linux-x86_64-rhel80-$version.tgz && \
echo "export PATH=$PATH:/opt/sh/mongo/bin" >> /etc/bashrc


WORKDIR /opt/sh/mongo