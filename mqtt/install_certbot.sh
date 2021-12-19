#!/bin/bash

sudo apt-get install software-properties-common
sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get install certbot
sudo apt update && sudo apt upgrade -y
