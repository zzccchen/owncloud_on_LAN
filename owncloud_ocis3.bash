#!/bin/bash

sudo apt update  # To get the latest package lists

sudo wget -O /usr/local/bin/ocis https://download.owncloud.com/ocis/ocis/stable/3.0.0/ocis-3.0.0-linux-amd64
sudo chmod +x /usr/local/bin/ocis
ocis version

sudo useradd --system --no-create-home --shell=/sbin/nologin ocis
sudo mkdir -p /var/lib/ocis
sudo chown ocis:ocis /var/lib/ocis

sudo mkdir -p /etc/ocis
sudo touch /etc/ocis/ocis.env
sudo chown -R ocis:ocis /etc/ocis

sudo echo "OCIS_URL=https://192.168.6.75:9200" | sudo tee -a /etc/ocis/ocis.env
sudo echo "PROXY_HTTP_ADDR=0.0.0.0:9200" | sudo tee -a /etc/ocis/ocis.env
sudo echo "PROXY_TLS=true" | sudo tee -a /etc/ocis/ocis.env
sudo echo "OCIS_INSECURE=true" | sudo tee -a /etc/ocis/ocis.env
sudo echo "OCIS_LOG_LEVEL=warn" | sudo tee -a /etc/ocis/ocis.env
sudo echo "OCIS_CONFIG_DIR=/etc/ocis" | sudo tee -a /etc/ocis/ocis.env
sudo echo "OCIS_BASE_DATA_PATH=/var/lib/ocis" | sudo tee -a /etc/ocis/ocis.env
sudo -u ocis ocis init --config-path /etc/ocis
