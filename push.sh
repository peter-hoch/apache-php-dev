#!/bin/bash

ImageName=`cat image-name.txt`

docker push $ImageName

docker push  petersdockerid0815/apache-php-dev:latest 
