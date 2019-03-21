#!/bin/bash

wget -qO - https://packages.fluentbit.io/fluentbit.key | sudo apt-key add -
sudo bash -c "echo 'deb https://packages.fluentbit.io/ubuntu/bionic bionic main' >> /etc/apt/sources.list"
sudo apt-get update && sudo apt install -y td-agent-bit