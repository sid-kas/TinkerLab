
#### Add files to *boot* partition
- wpa_supplicant.conf
- ssh

#### Increase swap space
- **edit**: sudo nano /etc/dphys-swapfile
- **change**: CONF_SWAPSIZE = {max 2048}

#### Install python & docker
sudo bash install.sh

#### add cron job to update and upgrade at 3:00 am
crontab -e 
00 3 * * * apt-get update -y && apt-get upgrade -y && reboot
crontab -l

#### Find a raspberry pi
- nmap -sP 172.25.113.0/24 | grep -n -B 2 "Rasp"
- nmap -sP 172.25.113.0/24 > res.txt && grep -n -B 2 "Rasp" ./res.txt

#### AP or station mode switch
- https://github.com/Autodrop3d/raspiApWlanScripts
- sudo bash setup_wlan_and_AP_modes.sh -s "CIT" -p "citchalmers2019" -a "cit_digi_$(hostname)" -r "citchalmers2019"

#### Octo print (3d printer setup)
