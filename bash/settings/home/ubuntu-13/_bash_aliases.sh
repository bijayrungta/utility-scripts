#!/bin/bash

###################### BIJAY_UTILITY_SCRIPT_STARTS #############################
##
# Shell Script for Bash Aliases loaded on Shell startup through ~/.bash_profile
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
# This file should be copied to Home folder for your Mac/Linux Machine as ~/.bash_aliases
# Alternatively, you can keep this in a different path and load this on demand as
# source /path/to/this/file
##

bjHomeDir=$HOME
bjProjectCode=ws
isNative=true
isMac=false      # Set this to false if it's not a Mac.
isGuestOS=false

# If it's a Guest OS on Virtual Machine, give the name.
guestHostName="ubuntu-13"
isUbuntu13=true
isDesktop=true

function bjp()
{
    if [ -f ${bjHomeDir}/lib/bash/commonBashAliases.sh ]; then
        source ${bjHomeDir}/lib/bash/commonBashAliases.sh
    elif [ -f ~/lib/bash/commonBashAliases.sh ]; then
        source ~/lib/bash/commonBashAliases.sh
    fi

    if [ -f ${bjHomeDir}/lib/bash/workstationBashAliases.sh ]; then
        source ${bjHomeDir}/lib/bash/workstationBashAliases.sh
    elif [ -f ~/lib/bash/workstationBashAliases.sh ]; then
        source ~/lib/bash/workstationBashAliases.sh
    fi
}

# Comment it if you don't want to load the Scripts automatically
bjp
###################### BIJAY_UTILITY_SCRIPT_ENDS ###############################
