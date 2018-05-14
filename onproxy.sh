#!/bin/bash
git config --global http.proxy http://tribeiros:Santander796736II!@proxylatam.indra.es:8080
sudo cp ~/proxy_files/proxylatam.sh /etc/profile.d/
sudo cp ~/proxy_files/99HttpProxy /etc/apt/apt.conf.d/
sudo shutdown now 