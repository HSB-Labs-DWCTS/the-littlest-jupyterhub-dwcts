#!/bin/sh

set -e

#
# JupyterHub 설치 (bare metal)
#

do_install() {
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y python3 python3-dev git curl unzip
  curl -L https://tljh.jupyter.org/bootstrap.py | sudo -E python3 - --admin admin
  sudo tljh-config set user_environment.default_app jupyterlab
  sudo tljh-config reload hub
  # export PATH=$PATH:/opt/tljh/user/bin
}

#
# 
#
do_install