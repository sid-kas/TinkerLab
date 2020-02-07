#!/bin/bash
if [ `id -u` -ne 0 ]; then
    echo "*** This script can be executed only as root***"
    echo "*** Exiting... ***"
    exit 1
fi
set -e
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
CWD="$PWD"


install_default_packages() {
    apt-get update && apt-get install -qy \
        sudo \
        htop \
        openssh-server \
        git \
        ca-certificates \
        curl \
        screen \
        tmux \
        software-properties-common \
        python-pip\
        python3-dev \
        libatlas-base-dev \
        python3-pip

    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    apt-get -qy upgrade
}

install_docker() {
    curl -sSL https://get.docker.com | sh
    apt-get install -y docker-compose
    systemctl enable docker
    systemctl start docker
    usermod -aG docker pi
    apt-get -qy upgrade
}



install_cronjobs () {
    echo "Started installing new crons..."
    crontab -l > mycron
    input="./configs/cronjobs.txt"
    while IFS= read -r line
    do
        if grep -Fxq "$line" mycron
        then
            echo "Cronjob already exists: "+"$line"
        else
            echo "$line" >> mycron
        fi
    done < "$input"
    crontab mycron && rm mycron
    crontab -l | grep -v -C 1 "# "
}

install_systemd_services() {
    SYSTEMD_FILES_PATH=./configs/*.service
    for filename in $SYSTEMD_FILES_PATH; do
        echo "Copying $filename file..."
        cp $filename /etc/systemd/system/
        f=$(basename $filename)
        echo "$f"
        if systemctl start $f; then
            echo "$f started"
            if systemctl enable  $f; then
                echo "$f enabled"
            else
                echo "$f not enabled"
            fi   
        else
            echo "$f unable to start"
        fi
    done
    ls /etc/systemd/system/ -la | grep -n "$(date | cut -d" " -f2,3)"
}

activate_accesspoint() {
    cd / && git clone https://github.com/Autodrop3d/raspiApWlanScripts
    /bin/bash /raspiApWlanScripts/setup_wlan_and_AP_modes.sh -s "CIT" -p "citchalmers2019" -a "cit_digi_$(hostname)" -r "citchalmers2019"
    if [[ !$(iwgetid)]]; then
        echo "Starting access point"
    fi
}

run_function() {
    echo "Excecuting function $1"
    if $1; then
        echo "Successfully excecuted! $1"
    else
        echo "Failed to excecuting!! $1"
}

run_function install_cronjobs
run_function install_systemd_services
run_function install_default_packages
