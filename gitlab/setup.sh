#!/bin/bash

mkdir -p config/ssl logs data

if [ -f .env ]
then
  export $(cat .env | xargs)
fi
cp ./ssl.template ./ssl.conf
sed -i "s/domain/${DOMAIN}/g;" ./ssl.conf
openssl req -x509 -new -nodes -sha256 -utf8 -days 3650 -newkey rsa:2048 -keyout ./config/ssl/${DOMAIN}.key -out ./config/ssl/${DOMAIN}.crt -config ssl.conf
chmod 775 ./config/ssl/*

docker-compose up -d
