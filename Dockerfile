#dynamodb LOCAL

FROM java:8

MAINTAINER jdietrich

#RUN apt-get update && apt-get install -y \

WORKDIR /opt

RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz

RUN tar xzf dynamodb_local_latest.tar.gz

EXPOSE 8000

RUN mkdir /db

VOLUME /db

CMD ["java","-Djava.library.path=./DynamoDBLocal_lib","-jar","DynamoDBLocal.jar","-sharedDb","-inMemory","-cors","*","-port", "8000","-dbPath","/db"]
