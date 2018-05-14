#!/bin/bash
git config --global --unset http.proxy
sudo rm /etc/profile.d/proxylatam.sh
sudo rm /etc/apt/apt.conf.d/99HttpProxy
sudo shutdown now