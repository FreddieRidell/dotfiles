#!/bin/bash

echo "+---------------------------------------------------------------------------+"
echo "| View available hotspots: 'nmcli d wifi list'                              |"
echo "| Connect to new: 'nmcli d wifi connect <WiFiSSID> password <WiFiPassword>' |"
echo "| Connect to existing: 'nmcli d disconnect <WifiInterface>'                 |"
echo "+---------------------------------------------------------------------------+"
echo ""
nmcli connect

/bin/zsh
