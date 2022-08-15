#!/bin/sh

mkdir -p ./config/apache
mkdir -p ./config/php

docker-compose up -d

docker cp apache/httpd.conf apache:/usr/local/apache2/conf/httpd.conf
docker cp apache/httpd-vhosts.conf apache:/usr/local/apache2/conf/extra/httpd-vhosts.conf

docker-compose restart
