#!/usr/bin/env bash

set -e

echo Installing docker-compose
os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(uname -m)
@@ -9,13 +11,13 @@ sudo curl -L "https://github.com/docker/compose/releases/download/v2.1.1/docker-
sudo chmod +x /usr/local/bin/docker-compose
echo Installing terraform onto machine...
mkdir -p $HOME/bin
mkdir -p "${HOME}/bin"
sudo apt-get update && sudo apt-get install -y unzip jq
pushd $HOME/bin
pushd "${HOME}/bin"
wget -q "https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_${pro}.zip"
unzip -q -o "terraform_${terraform_version}_linux_${pro}.zip"
. ~/.profile
. "${HOME}/.profile"
popd
pushd /vagrant
docker build ./services/account -t form3tech-oss/platformtest-account
@@ -27,4 +29,4 @@ echo Applying terraform script
pushd /vagrant/tf
terraform init -upgrade
terraform apply -auto-approve
popd
popd
