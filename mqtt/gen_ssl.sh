#!/bin/bash

echo "domain: $1"

sudo certbot certonly --standalone -d $1

DIR="/etc/emqx/ssl"
if [ -d "$DIR" ]; then
   echo "'$DIR' exist!"
else
   mkdir "$DIR"
fi


cat /etc/ssl/certs/ISRG_Root_X1.pem /etc/letsencrypt/live/$1/chain.pem > /etc/emqx/ssl/ca.pem
cat /etc/letsencrypt/live/$1/chain.pem > /etc/emqx/ssl/chain.pem
cat /etc/letsencrypt/live/$1/cert.pem > /etc/emqx/ssl/cert.pem
cat /etc/letsencrypt/live/$1/fullchain.pem > /etc/emqx/ssl/fullchain.pem
cat /etc/letsencrypt/live/$1/privkey.pem > /etc/emqx/ssl/private.pem


chown emqx:emqx /etc/emqx/ssl -R

echo "Successfully!"


