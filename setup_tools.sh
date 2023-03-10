#!/bin/bash


mkdir -p ~/SANDBOX 
cd ~/SANDBOX 

function getVsCode() {
    sudo apt update && sudo apt upgrade -y;
    sudo apt install software-properties-common apt-transport-https wget -y;
    wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg;
    echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list;
    sudo apt update;
    sudo apt install code;
}

function getGitHub() {
    local email;
    local user;

    echo What is your git email address?
    read email
    echo What is your git user name?
    read user

    sudo apt install git git-lfs
    git config --global user.email "${email}"
    git config --global user.name "${user}"


}

function generateSSH() {
    ssh-keygen -t ed25519 -C;
    eval "$(ssh-agent -s)";
    ssh-add ~/.ssh/id_ed25519
    echo "Your ssh key listed below "
    cat ~/.ssh/id_ed25519.pub
}


function main() {
    getVsCode
    generateSSH
    getGitHub
}

main