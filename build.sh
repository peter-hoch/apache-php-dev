#!/bin/bash

ImageName=`cat image-name.txt`

docker build --no-cache -t $ImageName .
#docker build -t $ImageName .
docker build -t petersdockerid0815/apache-php-dev:latest .

docker run --rm --name apache-php-dev -it  \
    -v `pwd`:/app  \
    -p 80:80 \
    -p 443:443 \
    $ImageName  

