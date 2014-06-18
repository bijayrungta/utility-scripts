#!/bin/bash

### Fix for GPG error "NO_PUBKEY"?

function bjRefreshGpgPubkey
{
    # Example: sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8BAF9A6F
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "$1"
    sudo apt-get update
}


# Update the System.
function update()
{
    printStatus 'Updating Repositories..'
    gksudo "apt-get update"
}

# Update the System.
function upgrade()
{
    printStatus 'Updating Repositories..'
    gksudo "apt-get update"

    printStatus 'Removing unwanted Programs..'
    gksudo "apt-get --assume-yes autoremove"

    printStatus 'Upgrading now..'
    gksudo "apt-get --assume-yes --force-yes --install-recommends dist-upgrade"

    printStatus 'Cleaning Cache..'
    gksudo "apt-get autoclean"
}

function pruneSignatures()
{
    printStatus 'Clean Repositories..'
    sudo apt-get clean

    printStatus 'Change to Singnature Folder..'
    cd /var/lib/apt

    printStatus 'Back up lists Folder..'
    sudo mv lists `pfx`lists

    printStatus 'Create necessary Folders..'
    sudo mkdir -p lists/partial

    printStatus 'Clean Repositories again..'
    sudo apt-get clean

    printStatus 'Update Repositories..'
    sudo apt-get update
}

function deleteKey()
{
    sudo apt-key del $1
}

function getKeys()
{
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $1
}

# Install a Package
function bjinstall()
{
    printStatus "Installing Package $1"
    gksudo "apt-get --install-recommends install $1"
}

# Possible Solutions for Bad Signature Keys.

# sudo aptitude -o Acquire::http::No-Cache=True -o Acquire::BrokenProxy=true update
