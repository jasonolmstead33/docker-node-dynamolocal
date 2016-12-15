#!/bin/bash

cd /tmp

curl -L "https://github.com/nodejs/docker-node/archive/master.zip" > master.zip

unzip master.zip

for file in docker-node-master/${NODE_VERSION_PREFIX}*/Dockerfile
do
  cp $file node_docker.source
done

sed -i 's/^ENV \([^ ]*\) \(.*\)/export \1=\2/;/^FROM/d;/^CMD/d;s/RUN //' node_docker.source

source node_docker.source

rm -rf ~/.gnupg

rm -rf /tmp/*
