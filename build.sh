#!/bin/bash


docker build --no-cache -t petersdockerid0815/apache-php-dev:3.0 .
docker build -t petersdockerid0815/apache-php-dev:latest .

docker run --rm --name apache-php-dev -it  \
    -v `pwd`:/app  \
    -p 80:80 \
    -p 443:443 \
    petersdockerid0815/apache-php-dev:3.0  

