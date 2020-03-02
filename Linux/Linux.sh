#!/bin/bash

# Forensics
uname -a > $user.txt
uptime  >> $user.txt
cat /proc/version  >> $user.txt
lspci >> $user.txt
lsusb >> $user.txt
lscpu >> $user.txt
lsmem >> $user.txt
free  >> $user.txt
lsblk  >> $user.txt
df -h  >> $user.txt
sudo fdisk -l  >> $user.txt
ip addr >> $user.txt
ifconfig >> $user.txt
iwconfig >> $user.txt
ps aux  >> $user.txt
netstat -ano  >> $user.txt

echo ==== proc ====  >> $user.txt
cat /proc/cpuinfo  >> $user.txt
cat /proc/loadavg  >> $user.txt
cat /proc/stat  >> $user.txt


# install Dark theme

sudo apt-get update
sudo apt-get install blackbird-gtk-theme
gsettings set org.gnome.desktop.interface gtk-theme "Blackbird"
gsettings set org.gnome.desktop.wm.preferences theme "Blackbird"

# resetting Panel
sudo rm -f ~/.config/lxpanel/Lubuntu/config
sudo rm -f  ~/.config/lxpanel/Lubuntu/panels/left
sudo rm -f  ~/.config/lxpanel/Lubuntu/panels/panel
sudo curl -GLk https://raw.githubusercontent.com/pwnshui/certutil/master/Linux/.config/lxpanel/Lubuntu/config -o ~/.config/lxpanel/Lubuntu/config
sudo curl -GLk https://raw.githubusercontent.com/pwnshui/certutil/master/Linux/.config/lxpanel/Lubuntu/panels/left -o ~/.config/lxpanel/Lubuntu/panels/left
sudo curl -GLk https://raw.githubusercontent.com/pwnshui/certutil/master/Linux/.config/lxpanel/Lubuntu/panels/panel -o ~/.config/lxpanel/Lubuntu/panels/panel
sudo chmod 777 ~/.config/lxpanel/Lubuntu/config 
sudo chmod 777 ~/.config/lxpanel/Lubuntu/panels/left 
sudo chmod 777 ~/.config/lxpanel/Lubuntu/panels/panel

# install Essential tools

sudo apt-get install gcc ffmpeg wifite aria2 wget curl ipsvd inetutils binutils nmap vim-nox emacs-nox youtube-dl mpv caffeine 


# Caffeine
# Touchpad gesture


sudo gpasswd -a $USER input
sudo apt-get install libinput-tools ruby fusuma xdotool wmctrl
gem install fusuma-plugin-keypress fusuma-plugin-wmctrl
settings set org.gnome.desktop.peripherals.touchpad send-events enabled
mkdir -p ~/.config/fusuma        # create config directory
nano ~/.config/fusuma/config.yml # edit config file.

# install Bitwig 3.0.2
cd
curl -GLOk https://github.com/pwnshui/certutil/raw/master/Linux/elementary-dark-theme_2012.06.13-0%7Esatya164%7Eprecise_all.deb
curl -GLOk https://github.com/pwnshui/certutil/releases/download/Software/bit3.0.2.deb
sudo dpkg -i bit3.0.2.deb
echo RUTRACKER > activation.bwreg
sudo echo 0.0.0.0 dash.bitwig.com >> /etc/hosts
sudo echo 0.0.0.0 services.bitwig.com >> /etc/hosts

# install VSTs in ~/.vsts


# install fun commands?

sudo apt-get install cowsay cowthink sl figlet toilet banner fortune rev moo aview aafire bb espeak rig hollywood

