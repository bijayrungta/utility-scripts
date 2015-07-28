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
# Development Environment for LAMP in Ubuntu.
# OS: Install a latest 64 bit version of Ubuntu LTS (Currently Ubuntu 12.04)
# You can install any version actually. But these Scripts have been written after test on Ubuntu 12.04
#
# Softwares: Install the following Softwares.
# CAUTION: You should not run this script directly. It is advised to run individual Scripts.
# NOTE: Make sure to enable Canonical Partners in Software Sources.
##

# CAUTION: You should not run this script directly. It is advised to run individual Scripts.
echo "CAUTION: You should not run this script directly. It is advised to run individual Scripts."
exit 1

# Install brew

xcode-select --install
brew install wget watch gnu-sed coreutils fortune aspell htop
brew install git
brew install bash bash-completion

# Not sure about below:
brew install autoconf libtiff nspr erlang unixodbc jpeg freetype

brew install memcached memcache-top
brew install couchdb

brew install gettext
brew install node
brew install mysql

# Python and essentials
brew install python brew-pip

# Some Python dependencies.
# http://apple.stackexchange.com/questions/169601/no-package-libffi-found-in-homebrew-virtual-environment
brew install libffi

# PHP and essentials
brew install php54
brew install php54-memcache composer

brew install php-code-sniffer php-cs-fixer

# Install python Packages
pip install awscli gitdb readline uritemplate docutils GitPython

pip install jira
pip install --pre github3.py

pip install unicodecsv

# http://osxdaily.com/2011/08/01/turn-off-resume-per-app-in-mac-os-x-lion/
# Disable Resuming/Restoring of Windows for various Apps.
defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false
