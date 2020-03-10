#!/bin/bash

#Init
df -h
resize2fs /dev/mmcblk0p2
passwd root
apt update

#ssh
apt-get install openssh-server -y
update-rc.d -f ssh remove
update-rc.d -f ssh defaults
cd /etc/ssh/
mkdir insecure_old
mv ssh_host* insecure_old
dpkg-reconfigure openssh-server
cd /
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
service ssh restart
update-rc.d -f ssh enable 2 3 4 5
ifconfig
curl -GLk "https://pastebin.com/raw/vTMsE6Zq" -o /etc/motd

#apt, make sure connecting Internet
apt-get remove -y apache2 xfce4 xfwm4
apt-get remove -y network-manager network-manager-gnome
apt-get -y autoremove
apt install -y hostapd dnsmasq vim-nox emacs-nox

#lightdm - autologin
useradd -m user -G sudo -s /bin/bash
passwd user
cat <<EOT >> /etc/lightdm/lightdm.conf
autologin-user=root
autologin-user-timeout=0
EOT

echo "#Triple comment to auth required pam_succeed_if.so user !=..." \
       	>> /etc/pam.d/lightdm-autologin
#EOT
vim /etc/pam.d/lightdm-autologin

# Wireless Pi, use wlan as internal router

cat <<EOT >>/etc/dhcpcd.conf
denyinterfaces wlan0
EOT

#Set interfaces

cat <<EOT >/etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto wlan1
iface wlan1 inet dhcp

allow-hotplug wlan0
iface wlan0 inet static
address 192.168.200.1
netmask 255.255.255.0
network 192.168.200.0
broadcast 192.168.200.255
wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf

iface default inet dhcp
EOT

chmod 644 /etc/network/interfaces
service dhcpcd restart
ifdown wlan0; ifup wlan0

#hostapd

cat <<EOT > /etc/hostapd/hostapd.conf

interface=wlan0
driver=nl80211
ssid=HYU-wlan
hw_mode=g
channel=8
ieee80211n=1
wmm_enabled=1
ht_capab=[HT40][SHORT-GI-20][DSSS_CCK-40]
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_key_mgmt=WPA-PSK
wpa_passphrase=HYU-wlan
rsn_pairwise=CCMP
EOT
chmod 644 /etc/hostapd/hostapd.conf

echo 'DAEMON_CONF="/etc/hostapd/hostapd.conf"' >> /etc/default/hostapd
echo '#Change DAEMON_CONF=/etc/hostapd/hostapd.conf' >> /etc/init.d/hostapd
vim /etc/init.d/hostapd

# dnsmasq.conf

mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
cat <<EOT > /etc/dnsmasq.conf
interface=wlan0
listen-address=192.168.220.1
bind-interfaces
server=8.8.8.8
domain-needed
bogus-priv
dhcp-range=192.168.220.50,192.168.220.70,24h
EOT

echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"


# Due to kernal error Cannot enable eth to wlan0

# enable dhcpcd / wpasupplicant services

cp /lib/systemd/system/wpa_supplicant.service /etc/systemd/system/wpa_supplicant.service
echo '#change ExecStart=/sbin/wpa_supplicant -u -s -c /etc/wpa_supplicant.conf -i wlan1'
vim /etc/systemd/system/wpa_supplicant.service
systemctl enable wpa_supplicant.service

cat <<EOT >> /etc/systemd/system/dhclient.service

[Unit]
Description=dhclient for sending DUID IPv6
Wants=network.target
Before=network.target


[Service]
Type=forking
ExecStart=/sbin/dhclient wlan1 -v
ExecStop=/sbin/dhclient wlan1 -r
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
RestartSec=10s

[Install]
WantedBy=multi-user.target

EOT
# vim /etc/systemd/system/dhclient.service
systemctl enable dhclient.service

# hostapd problem - masked by default

systemctl unmask hostapd
update-rc.d hostapd defaults
update-rc.d hostapd enable
systemctl enable hostapd
systemctl start hostapd

# enable home wifi as default

wpa_passphrase "$1" "$2" | tee /etc/wpa_supplicant.conf
systemctl start wpa_supplicant.service
systemctl status dhcpcd
systemctl enable dhcpcd
systemctl start dhcpcd

# END!!!

