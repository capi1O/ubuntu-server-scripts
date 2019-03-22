#!/bin/bash

curl -O https://raw.githubusercontent.com/monkeydri/ubuntu-server-scripts/master/td-agent-bit-template.conf
sudo bash -c "TIMBER_API_KEY=${TIMBER_API_KEY} TIMBER_SOURCE_ID=${TIMBER_SOURCE_ID} HOSTNAME=${HOSTNAME} envsubst < ./td-agent-bit-template.conf > /etc/td-agent-bit/td-agent-bit.conf"