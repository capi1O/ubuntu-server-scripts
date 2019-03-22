#!/bin/bash

UBUNTU_SCRIPTS_PATH=https://raw.githubusercontent.com/monkeydri/ubuntu-server-scripts/master/

# TODO : check required env vars are all set
# REQUIRED_ENV_VARS=[TIMBER_API_KEY, TIMBER_SOURCE_ID]
source .env

# partition setup

see [[ubuntu-server-setup-raid-1]]

# bash setup

sudo curl -s ${UBUNTU_SCRIPTS_PATH}/bash-setup.sh | bash

# fluentbit + Timber setup
curl -s ${UBUNTU_SCRIPTS_PATH}/setup-fluentbit.sh | bash
curl -s ${UBUNTU_SCRIPTS_PATH}/setup-fluentbit-timber.sh | TIMBER_API_KEY=${TIMBER_API_KEY} TIMBER_SOURCE_ID=${TIMBER_SOURCE_ID} HOSTNAME="reverse-proxy-vm-${HOSTNAME}" bash

# docker setup
curl -s ${UBUNTU_SCRIPTS_PATH}/docker-setup.sh | bash

# docker-compose setup
curl -s ${UBUNTU_SCRIPTS_PATH}/docker-compose-setup.sh | bash

# HTTPS reverse proxy (let's encrypt) [docker]
# create .env with required env vars then
curl -s https://raw.githubusercontent.com/monkeydri/reverse-proxy/master/setup.sh | bash

# seafile [docker] => https://github.com/monkeydri/seafile-server#quickstart

cd dockers && git clone https://github.com/monkeydri/seafile-server && cd seafile-server
# fill required env vars in .env (VOLUME_PATH=/data/docker-volumes/
chmod +x setup.sh && ./setup.sh
