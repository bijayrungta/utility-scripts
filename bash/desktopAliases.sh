#!/bin/bash

# Environment related:
export SVN_EDITOR=vim

bjPhpStormPath=""

# Platform dependent:
if ${isMac}; then
    # It's a Mac
    bjGuiEditor=bjOpenFileNB
    bjPhpStormPath="/Applications/PhpStorm.app/Contents/MacOS/phpstorm";
    alias sedi='sed -i ""'
else
    # Its a Linux
    bjGuiEditor=kate
    sedi="sed -i"
fi

bjHeidiLogDir="${bjHomeDir}/.wine/drive_c/users/bijay/Application Data/HeidiSQL/Sessionlogs/"

alias lockscr="gnome-screensaver-command -l"
alias psrv="ping ${srvIp} -c 5"
alias plinsrv="ping ${linsrvIp} -c 5"
alias pdt='${bjHomeDir}/opt/eclipse-php-helios/eclipse -nosplash -clean -refresh -name "Eclipse PHP Helios" -vmargs -Xms192M -Xmx384M -data ${bjHomeDir}/settings/workspaces/eclipse-php-helios/default'
# alias pdt='${bjHomeDir}/opt/eclipse-pdt/eclipse -nosplash -clean -refresh -name -vmargs -Xms384M -Xmx768M -data ${bjHomeDir}/settings/workspaces/eclipse-pdt/clean'

alias melddir='meld ${bjHomeDir}/projects/tmp ${bjHomeDir}/projects/tmp > /dev/null &'
alias meldf='meld ${bjHomeDir}/projects/tmp/dummy1 ${bjHomeDir}/projects/dummy2 > /dev/null &'

alias bjCheat='less ~/cheat'

# Applications..
alias pdt5='${bjHomeDir}/opt/eclipse-pdt/eclipse -nosplash -clean -refresh -name "Eclipse PDT Gallilio 2.1" -vmargs -Xms384M -Xmx768M -data ${bjHomeDir}/settings/workspaces/eclipse-pdt/default'
alias pdt='${bjHomeDir}/opt/eclipse-php-helios/eclipse -nosplash -clean -refresh -name "Eclipse PHP Gallilio" -vmargs -Xms384M -Xmx768M'
# alias pdt='${bjHomeDir}/opt/eclipse-pdt/eclipse -nosplash -clean -refresh -name -vmargs -Xms384M -Xmx768M -data ${bjHomeDir}/settings/workspaces/eclipse-pdt/clean'
alias pdt3='${bjHomeDir}/opt/eclipse-php-galileo-SR1/eclipse -nosplash -clean -refresh -name "Eclipse PHP Gallilio SR1" -vmargs -Xms384M -Xmx768M -data ${bjHomeDir}/settings/workspaces/eclipse-php-galileo/default'
alias melddir='meld ${bjHomeDir}/projects/tmp ${bjHomeDir}/projects/tmp > /dev/null &'
alias meldf='meld ${bjHomeDir}/projects/tmp/dummy1 ${bjHomeDir}/projects/dummy2 > /dev/null &'
alias pdf='evince'
alias nwg='sudo bash ${bjHomeDir}/lib/bash/changeGateway.sh'
alias kff='kill `pgrep firefox`'
alias zs='${bjHomeDir}/lib/Zend/ZendStudioForEclipse-Beta/ZendStudio -vmargs -Xms128M -Xmx256M -nosplash'
alias bjquit='sudo shutdown -P now'

# Services Config Edit
alias bjnwc='sudo vim /etc/network/interfaces'
alias bjnwr='sudo /etc/init.d/networking restart;'

# Administration
alias alsaUpdate="sudo m-a update; sudo m-a prepare; sudo m-a a-i alsa; sudo /etc/init.d/alsa-utils start"

# Networking
alias bjnwr='sudo /etc/init.d/networking restart; ggl'
alias bjnwPassive='sudo bash ${bjHomeDir}/lib/bash/restartNetworks.sh 30s'

# Apache
alias bjapr='sudo /etc/init.d/apache2 restart'
alias bjmys='sudo service mysql start'
alias bjmyr='sudo service mysql restart'
alias bjphpc='sudo vim /etc/php5/apache2/php.ini'

alias bjmysql="mysql -uroot -p ${bjMysqlDefaultDb}"
alias kwallet="kwalletmanager --kwalletd"
alias chm='kchmviewer'

bjGithubDir=${bjHomeDir}/codebase/checkouts/git/github
alias bjgh='cd ${bjGithubDir}'
alias githubh='cd ${bjGithubDir}'

# Backups
# alias bkpff='tar -cvvf ${bjHomeDir}/.mozilla/firefox/`date +%Y-%m-%d_%H-%M`_firefox.minimal.tar ${bjHomeDir}/.mozilla/firefox/firefox.minimal'
# screenshots
alias scrn='import -window root ~/tmp/`date +%Y%m%d%H%M`.png'

# CommandLinefu.com

# http://www.commandlinefu.com/commands/view/3648/disable-beep-sound-from-your-computer
alias nobeep='echo "blacklist pcspkr"|sudo tee -a /etc/modprobe.d/blacklist.conf'

alias bjosgit='cd ${bjHomeDir}/codebase/checkouts/git';
alias bjosgithub='cd ${bjHomeDir}/codebase/checkouts/git/github';

################
## JIRA Shell ##
################
alias jirash='${HOME}/opt/trentm-jirash/bin/jirash'      # or whatever
complete -C 'jirash --bash-completion' jirash   # bash completion

###############
## Functions ##
###############

function bkpff()
{
    echo "Function call to Backup/Tar Firefox Profile.";
    currentDirectory=`pwd`;
    pfx=`date +%Y-%m-%d_%H-%M-%S_`;
    cd ~/.mozilla/firefox
    rm -fR firefox.minimal/Cache/*
    tar cjf `date +%Y-%m-%d_%H-%M`_firefox.minimal.tar.bz2 firefox.minimal;
    echo 'Archive done';
    echo 'Back to previous Directory';
    cd ${currentDirectory};
    echo "Done.."
}

function cr()
{
    originalDir=`pwd`
    echo "Change Directory to ~/opt/cyber-roam-client"
    cd ~/opt/cyber-roam-client
    echo 'Start CyberRoamClient'
    ./crclient -u bijay > /dev/null &
    echo 'Back to previous Directory'
    cd ${originalDir}
    echo "Done.."
}

function crc()
{
    ps -ef | /bin/grep --ignore-case crclient
}

# Video Related..
function convertVideo()
{
    inputMovie=$1
    # outputFormat=$2
    outputFile=$1
    mencoder ${inputMovie} -oac mp3lame -ovc lavc -o ${outputFile}.avi
}

function chgateway()
{
    if [ -z $1 ] ; then
        echo "chgateway: invalid input"
    else
        sed -i 's/gateway 10\.0\.0\.[0-9]{2}/gateway 10.0.0.$1/g'
    fi
}


# Update Aliases for Various Projects.
function updateAliases()
{
    . ${bjHomeDir}/.bash_aliases
}

function convertWebPageToPdf()
{
    touch $2;firefox -print $1 -printmode PDF -printfile $2
}


function clipboard()
{
    touch ~/settings/clipboard
    echo ${strSeparator} >> ~/settings/clipboard
    echo "Clipboard Content dumped on `date -R`" >> ~/settings/clipboard
    echo ${strSeparator} >> ~/settings/clipboard
    echo "xclip -o >> ~/settings/clipboard"
    xclip -o >> ~/settings/clipboard
}

# Cleanup firefox's database.
# Sqlite database keeps collecting cruft as time passes,
# which can be cleaned by the 'vacuum;' command.
# This command cleans up the cruft in all sqlite files relating to the user you have logged in as.
# This command has to be run when firefox is not running, or it will exit displaying the pid of the firefox running.
function ffclean()
{
    find ~/.mozilla/firefox -name "*.sqlite" -exec bash -c "<<<'vacuum;' sqlite {}" \;
}

function ffclean2()
{
    pgrep -u `id -u` firefox-bin || find ~/.mozilla/firefox -name '*.sqlite'|(while read -e f; do echo 'vacuum;'|sqlite3 "$f" ; done)
}

# Manually Pause/Unpause Firefox Process with POSIX-Signals
# Suspends all Firefox Threads. Results in Zero CPU load.
# Useful when having 100+ Tabs open and you temporarily need the power elsewhere.
# Be careful - might produce RACE CONDITIONS or LOCKUPS in other processes or FF itself.

function ffs()
{
    killall -STOP -m firefox
}

function ffc()
{
    killall -CONT -m firefox
}

function kg()
{
    kill `pgrep gwibber`
}

function crclientl()
{
    echo 'Logging in to Cyber Roam Client.'
    cd ~/opt/cyber-roam-client
    ./crclient -u bijay > /dev/null &
}

function bjCleanDns()
{
    sudo /etc/init.d/nscd restart
}

function bjFlushDnsCache()
{
    if ${isMac}; then
        sudo dscacheutil -flushcache
    else
        sudo /etc/init.d/nscd restart
    fi
}

function bjConfirmAndOpenNB()
{
    bjConfirmAndOpenIde $1
}

function bjConfirmAndOpenIde()
{
    filePath=$1
    if ${isGuestOS} ; then
        echo 'Do not open File in Guest OS'
        return;
    fi
    printf "Open in IDE? y/n: "
    # read str
    str=y

    if [ "${str}" == "y" -o "${str}" == "Y" ] ; then
        echo "Opening file in IDE"
        bjFileOpenIde ${filePath}
    fi
}

function google()
{
    curl -A Mozilla "http://www.google.com/search?q=`urlencode $1`" | html2text -width 80
}

function bjFileOpenIde()
{
    filePath=$1
    ide=$2
    if [ -z ${ide} ]; then
        ide=netbeans # Set Default IDE
    fi
    case ${ide} in
        # Komodo
        k | komodo)      bjFileOpenKomodo ${filePath} ;;

        # NetBeans
        nb | netbeans)  bjOpenFileNB ${filePath} ;;
    esac;
}
alias bjKomodoOpen='bjFileOpenKomodo'

function bjOpenFileNB()
{
    filePath="$1"
    if [ ! -f "${filePath}" ] ; then
        echo "File does not exist at '${filePath}'"
        return 1
    fi
    if ${isMac}; then
        # bjOpenFile "${filePath}" nb
        netbeansPath="/Applications/NetBeans/NetBeans 7.4.app/Contents/MacOS/netbeans" # For Mac
        # netbeansPath="/Applications/NetBeans/NetBeans 8.0.app/Contents/MacOS/netbeans" # For Mac
        /bin/sh "${netbeansPath}" --open ${filePath}
    else
        netbeansPath="${bjHomeDir}/opt/netbeans-7.4/bin/netbeans" # For Linux
        /bin/sh "${netbeansPath}" --open ${filePath}
    fi
}
alias bjNetbeansOpen='bjOpenFileNB'

function bjFileOpenKomodo()
{
    filePath="$1"
    if [ ! -f "${filePath}" ] ; then
        echo "File does not exist at '${filePath}'"
        return 1
    fi
    if ${isMac}; then
        bjOpenFile "${filePath}" komodo
        # komodoPath="/Applications/Komodo Edit 8.app/Contents/MacOS/komodo";
    else
        echo "Not implemented for Linux yet."
        return;
    fi;
}

function bjFileOpenStorm()
{
    filePath="$1"
    if [ ! -f "${filePath}" ] ; then
        echo "File does not exist at '${filePath}'"
        return 1
    fi
    if ${isMac}; then
        bjOpenFile "${filePath}" phpstorm
        # phpStormPath="/Applications/PhpStorm.app/Contents/MacOS/phpstorm";
    else
        echo "Not implemented for Linux yet."
        return;
    fi;
}

alias bjStormOpen='bjFileOpenStorm'

function bjXYZOpenFileEclipse()
{
    # eclipsePath="${bjHomeDir}/opt/zend-eclipse-php/zend-eclipse-php" # For Linux
    eclipsePath="${bjHomeDir}/opt/zend-eclipse-php/zend-eclipse-php.app/Contents/MacOS/zend-eclipse-php" # For Mac
    filePath=$1
    if [ -f ${filePath} ] ; then
        /bin/sh ${eclipsePath} ${filePath}
    else
        echo "File does not exist at ${filePath}"
    fi
}

function bjInitNBProject()
{
    printHeader "Will try to create Project settings"
    netbeansProjectTemplatePath="${bjHomeDir}/settings/templates/netbeans"
    projectName=$1
    projectRoot=$2
    randomString="$3"
    if [ -z ${projectRoot} ]; then
        projectRoot=`pwd`
    fi
    if [ -z ${projectName} ]; then
        projectName="$(pfx)$(basename ${projectRoot})"
    fi
    if [ -z ${randomString} ]; then
        if ${isMac}; then
            printHeader "The Random Password generator doesn't work on Mac. Please pass Random String through Command line"
            printInfo "Pass the parameters as bjInitNBProject projectName projectRoot randomString (dZmPqtPP1uKh)"
            return
        fi
    fi
    if [ ! -d ${projectRoot}/nbproject ]; then
        printInfo "Initializing Netbeans PHP Project: ${projectName}"
        netbeansProjectSettingsFile="${projectRoot}/nbproject/project.xml"
        komodoProjectSettingsFile="${projectRoot}/${projectName}.komodoproject"

        cp -R ${netbeansProjectTemplatePath}/nbproject ${projectRoot}/
        printDryRunCommand "sedi "s/%project.name%/${projectName}/" ${netbeansProjectSettingsFile}"
        sedi "s/%project.name%/${projectName}/" "${netbeansProjectSettingsFile}"
        echo "Initialized Project named $(txtBold ${projectName}) at location ${projectRoot}"
        if [ ! -f ${projectRoot}/.gitignore ]; then
            cp -R ${netbeansProjectTemplatePath}/.gitignore ${projectRoot}/
        fi

        printInfo 'Create Project Settings for Komodo Project'
        cp -R "${netbeansProjectTemplatePath}/.komodotools" ${projectRoot}/
        cp -R ${netbeansProjectTemplatePath}/projectName.komodoproject "${komodoProjectSettingsFile}"

        if ! ${isMac}; then
            randomString=$(toUpper $(genPassword 12))
        fi
        printInfo "Random string for Komodo Project: ${randomString}"

        cat << HEREDOC
        sedi "s/%project.name%/${projectName}/" "${komodoProjectSettingsFile}"
        sedi "s/%random-string%/${randomString}/" "${komodoProjectSettingsFile}"
HEREDOC

        sedi "s/%project.name%/${projectName}/" "${komodoProjectSettingsFile}"
        sedi "s/%random-string%/${randomString}/" "${komodoProjectSettingsFile}"

        printStatus "Netbeans Project Settings" withSeparator
        cat ${netbeansProjectSettingsFile}

        printStatus "Komodo Project Settings" withSeparator
        cat "${komodoProjectSettingsFile}"

        printStatus "Open Project File to change Settings"
        bjFileOpenIde ${netbeansProjectSettingsFile}
    else
        echo "Project already exists."
        cat ${projectRoot}/nbproject/project.xml
        printSeparator
    fi
}

bjDelinkNBProject()
{
    projectRoot=$1
    if [ -z ${projectRoot} ]; then
        projectRoot=`pwd`
    fi
    if [ -d ${projectRoot}/nbproject ]; then
        printDryRunCommand "rm -fR ${projectRoot}/nbproject"
        rm -fR ${projectRoot}/nbproject
        echo "Removed NetBeans project related files."
        ls
    else
        echo "No Project exists"
    fi
}

bjDelinkKomodoProject()
{
    projectRoot=$1
    if [ -z ${projectRoot} ]; then
        projectRoot=`pwd`
    fi

    if [ -d ${projectRoot}/.komodotools ]; then
        rm -fR ${projectRoot}/.komodotools
        rm -fR ${projectRoot}/*.komodoproject
        echo "Removed NetBeans project related files."
        ls
    else
        echo "No Project exists"
    fi
}

function bjUbuntu()
{
    ssh ubuntu-13
}

function bjUbuntu13()
{
    ssh ubuntu-13
}

function bjImportLibraries()
{
    osBashAliasesPath=ubuntuBashAliases.sh
    if ${isMac}; then
        # echo 'This is Mac'
        osBashAliasesPath=macBashAliases.sh
    else
        source ${bashLibDir}/ubuntuBashAliases.sh
    fi

    if [ -f "${bashLibDir}/${osBashAliasesPath}.sh" ]; then
        source "${bashLibDir}/${osBashAliasesPath}.sh"
    fi
}

##
# MUST BE AT THE END OF FILE AS last STATEMENT.
# Import Accounts based Aliases and Functions Library.
bjImportLibraries
