#!/bin/bash

##
# Shell Script Utility functions to manipulate text.
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

function bjFixLineFeed()
{
    # http://www.cyberciti.biz/faq/howto-unix-linux-convert-dos-newlines-cr-lf-unix-text-format/#comment-79500
    path=$1
    perl -pi -e 's/\r\n/\n/g' $path
    printInfo "Done with fixing Line Feed at $path"
}

function bjTextExamples()
{
    # http://stackoverflow.com/questions/7068179/convert-line-endlings-for-whole-directory-tree-git
    find . -type f -exec grep -qIP '\r\n' {} ';' -exec perl -pi -e 's/\r\n/\n/g' {} '+'

}

function bjFindInFiles()
{
    findPattern=$1
    pathToScan=.
    if [ "$2" ] ; then
        pathToScan=$2
    fi
    grepOptions="--recursive --no-messages --extended-regexp -E "

    printHeader "pathToScan: ${pathToScan}; "
    printRaw "findPattern: ${findPattern}; "

    printInfo "${pathToScan} is a Directory. Will search for the pattern recursively"
    printDryRunCommand  "\$(grep ${grepOptions} "${findPattern}" ${pathToScan})"
    grep ${grepOptions} "${findPattern}" ${pathToScan}
}

function bjFindReplace()
{
    findPattern=$1
    replacePattern=$2
    pathToReplace=.
    if [ "$3" ] ; then
        pathToReplace=$3
    fi
    grepOptions="--recursive --no-messages --files-with-matches --extended-regexp -E "

    printHeader "pathToReplace: ${pathToReplace}; "
    printRaw "findPattern: ${findPattern}; "
    printInfo "replacePattern: ${replacePattern}; "

    if [ -d ${pathToReplace} ]; then
        printInfo "${pathToReplace} is a Directory. Will search for the pattern recursively"
        printDryRunCommand  "\$(grep ${grepOptions} -E "${findPattern}" ${pathToReplace})"
        for fileToReplace in $(grep ${grepOptions} -E "${findPattern}" ${pathToReplace})
        do
            :
            printDryRunCommand "sed -i '' ""s/${findPattern}/${replacePattern}/gi"" ${fileToReplace}"
            sed -i '' "s/${findPattern}/${replacePattern}/g" ${fileToReplace}
        done
    else
        printDryRunCommand "sed -i '' ""s/${findPattern}/${replacePattern}/gi"" ""${pathToReplace}"""
        sed -i .bkp "s/${findPattern}/${replacePattern}/g" "${pathToReplace}"
    fi
    printInfo "You may want to remove the backup files by running below command:"
    printDryRunCommand "find ${pathToReplace} -type f -iname *.bkp"
    printDryRunCommand "find ${pathToReplace} -type f -iname *.bkp -exec rm {} \;"
}
