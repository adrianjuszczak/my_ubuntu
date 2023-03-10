#!/bin/bash 

# do nothing on lid closing 
function handleLidSwitch() {
    local FONT_RED='\033[0;31m'
    local FONT_NC='\033[0m'
    
    sudo sed -i 's/.*HandleLidSwitch.*/HandleLidSwitch=ignore/g' /etc/systemd/logind.conf;

    echo -e "${FONT_RED} WARNING: ${FONT_NC} HandleLisSwitch changed. "
    cat /etc/systemd/logind.conf | grep HandleLid
}

function main() {
    handleLidSwitch
}

main