#!/bin/bash

sudo apt update && sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common


curl -fsSL https://repos.emqx.io/gpg.pub | sudo apt-key add -

sudo apt-key fingerprint 3E640D53

sudo add-apt-repository \
    "deb [arch=amd64] https://repos.emqx.io/emqx-ce/deb/ubuntu/ \
    ./$(lsb_release -cs) \
    stable"

sudo apt update

sudo apt install emqx

sudo apt-cache madison emqx

emqx start

sudo systemctl start emqx

echo "Install successfully!"
