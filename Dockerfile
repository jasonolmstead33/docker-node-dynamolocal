FROM java:8

MAINTAINER Ryan Fitzgerald, ryan.fitz1@gmail.com

WORKDIR /data

RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz
RUN tar xzf dynamodb_local_latest.tar.gz
RUN rm dynamodb_local_latest.tar.gz

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs


EXPOSE 8000
