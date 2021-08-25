FROM ttbb/base

LABEL maintainer="shoothzj@gmail.com"
LABEL description="Mongo nake image"

ENV MONGO_HOME /opt/sh/mongo

ARG version=5.0.2

RUN wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel80-$version.tgz && \
mkdir -p /opt/sh/mongo && \
tar -xf mongodb-linux-x86_64-rhel80-$version.tgz -C /opt/sh/mongo --strip-components 1 && \
rm -rf mongodb-linux-x86_64-rhel80-$version.tgz && \
ln -s /opt/sh/mongo/bin/mongo /usr/bin/mongo && \
ln -s /opt/sh/mongo/bin/mongod /usr/bin/mongod && \
ln -s /opt/sh/mongo/bin/mongos /usr/bin/mongos

WORKDIR /opt/sh/mongo