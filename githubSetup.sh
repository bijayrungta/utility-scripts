#!/bin/bash

function doGenerateSshKeys()
{
    echo "Generating SSH Keys. Press Enter when prompted for Passphrase."
    ssh-keygen -t rsa -C "${userEmail}" -f id_rsa
    ssh-add ~/.ssh/id_rsa

    echo "Install xclip if Ubuntu"
    sudo apt-get install xclip
    xclip -sel clip < ~/.ssh/id_rsa.pub

    echo "#######################################"
    echo "## Please visit the link below to Add your SSH key to GitHub"
    echo "## https://help.github.com/articles/generating-ssh-keys#step-3-add-your-ssh-key-to-github"
}

printf "Enter your Full Name: "
read userName

printf "Enter your email: "
read userEmail

# if [[ ! "${userName}" ] -o [ ! "${userName}" ]]; then
if [ ! "${userName}" -o ! "${userEmail}" ]; then
    echo 'Can not proceed without name or email'
    return;
fi

echo "Set Global GIT Config for User name and Email"
git config --global user.name "${userName}"
git config --global user.email "${userEmail}"

echo "Create the SSH Directory if it doesn't exist"
mkdir -p ~/.ssh

originalDir=$(pwd)
cd ~/.ssh
if [ ! -f ~/.ssh/id_rsa ]; then
    doGenerateSshKeys
fi
