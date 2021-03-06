FROM ttbb/base

LABEL maintainer="shoothzj@gmail.com"
LABEL description="Mongo nake image"

ENV MONGO_HOME /opt/sh/mongo

ARG version=5.0.5

ARG TARGETARCH

ARG amd_download=mongodb-linux-x86_64-rhel80-5.0.5

ARG arm_download=mongodb-linux-aarch64-rhel82-5.0.5

RUN if [[ "$TARGETARCH" = "amd64" ]]; \
    then download=$amd_download; \
    else download=$arm_download; \
    fi && \
    wget https://fastdl.mongodb.org/linux/$download.tgz && \
    mkdir -p /opt/sh/mongo && \
    tar -xf $download.tgz -C /opt/sh/mongo --strip-components 1 && \
    rm -rf $download.tgz && \
    ln -s /opt/sh/mongo/bin/mongo /usr/bin/mongo && \
    ln -s /opt/sh/mongo/bin/mongod /usr/bin/mongod && \
    ln -s /opt/sh/mongo/bin/mongos /usr/bin/mongos

WORKDIR /opt/sh/mongo