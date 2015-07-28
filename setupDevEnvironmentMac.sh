#!/bin/bash

##
# Utility Shell Scripts
#
# LICENSE
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# @copyright    Copyright (c) 2005-2014 Bijay Rungta http://bijayrungta.com
# @license      http://www.gnu.org/licenses/gpl-2.0.html GNU GENERAL PUBLIC LICENSE
##

##
# Development Environment for LAMP in Mac OSX.
# You can install any version actually. But these Scripts have been written after test on Ubuntu 12.04
#
# Softwares: Install the following Softwares.
# CAUTION: You should not run this script directly. It is advised to run individual Scripts.
# NOTE: Make sure to enable Canonical Partners in Software Sources.
##

# CAUTION: You should not run this script directly. It is advised to run individual Scripts.
echo "CAUTION: You should not run this script directly. It is advised to run individual Scripts."
exit 1

# Install Brew
# http://brew.sh/
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Xcode command line tools.
xcode-select --install

# Brew Packages:
brew install wget watch gnu-sed coreutils fortune aspell htop
brew install git
brew install bash bash-completion

# Not sure about below:
brew install autoconf libtiff nspr erlang unixodbc jpeg freetype

brew install gettext

# Brew Packages for PHP and Mysql:
brew install mysql php54 python sqlite zlib mcrypt htop-osx

# Brew Packages for PHP tools:
brew install composer
brew install php-code-sniffer php-cs-fixer

# Brew Packages for Memcache and Couchbase.
brew install memcached memcache-top php54-memcache
brew install couchdb

brew install gdbm jpeg libpng openssl readline unixodbc

#################
# Node Packages #
#################

# Install Node
# @see http://stackoverflow.com/questions/5056115/how-to-install-latest-version-of-node-using-brew
brew install node

# Brew Packages for Node tools
brew install phantomjs

# Brew Packages for Java tools
brew install maven

################################################################################
############################ Python and essentials #############################
################################################################################
brew install python brew-pip

# Some Python dependencies.
# http://apple.stackexchange.com/questions/169601/no-package-libffi-found-in-homebrew-virtual-environment
brew install libffi

# Python Packages:
pip install awscli jira
pip install --pre github3.py

# Install python Packages
pip install awscli gitdb readline uritemplate docutils GitPython
pip install unicodecsv

#######################
# Mac OSX Preferences #
#######################
# http://osxdaily.com/2011/08/01/turn-off-resume-per-app-in-mac-os-x-lion/
# Disable Resuming/Restoring of Windows for various Apps.
defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false
