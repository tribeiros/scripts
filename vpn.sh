#!/bin/bash
vpnGroup=Suporte_Externo
vpnUser=xb198766
vpnHost=vpn.produban.com.br
sudo openconnect --authgroup=${vpnGroup} --user=${vpnUser} --background ${vpnHost}