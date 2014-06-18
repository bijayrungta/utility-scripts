#!/bin/bash

##
# Bash Aliases to make git operations less painful
##

function bjGitInfo()
{
    projectRoot=$1
    if [ -z $projectRoot ]; then
        projectRoot=`pwd`
    fi

    currentDirInfo
    echo "Git Info:"
    if [ -d ${projectRoot}/.git ]; then
        cat ${projectRoot}/.git/config
        printSeparator
        printInfo "Git Branches..."
        git branch -a
        printHeader "Repository Status"
        git status
        printSeparator
    else
        echo "Not a Git Repository"
    fi
}

function bjGitCommit()
{
    git commit -a -m "$1"
}

function bjGitStatus()
{
    git status
}

function bjGitPush()
{
    git push
}

function bjGitRemoveObsoleteBranches()
{
    # Prune References to removed Remote Branches.
    git remote prune origin
}

function bjGitDiff()
{
    git diff "$@" > /tmp/gitDiff.diff
    previewSyntax /tmp/gitDiff.diff
}

function bjGitApplyPatch()
{
    # @see https://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git/
    patchFile=$1;
    echo "Applying patch ${patchFile} to Current Dir";
    if [ ! -f "${patchFile}" ]; then
        printInfo "Patch does not exist."
        return;
    fi
    printDryRunCommand "git apply patch -p0 ${patchFile}"
    git apply --stat ${patchFile}
}

function bjGitAddEmptyFolder()
{
    filePath=$(bjFilePath "$@")
    mkdir -p "${filePath}"
    cp ${bashLibDir}/settings/templates/git/.gitignore-emptyFolder "${filePath}/.gitignore"
}

function bjGitSyncUpstream()
{
    # @see https://help.github.com/articles/syncing-a-fork
    printHeader "This script will sync your Fork from Upstream"

    printRaw "Fetch from Upstream"
    git fetch upstream

    printRaw "All Branches:"
    git branch -va

    printRaw "Checkout Master Bracnch"
    git checkout master

    printRaw "Pull from Origin"
    git pull origin master

    printRaw "Merge from Upstream"
    git merge upstream/master

    printRaw "Push latest upstream into Origin"
    git push origin
}

function bjGitAddUpstream()
{
    bjGitAddRemote upstream "$@"
}

function bjGitAddRemote()
{
    remoteId=upstream
    remoteRepoId='jabong'
    repo=$(basename $(pwd))
    if [ "$1" ];then
        remoteId="$1"
    fi
    if [ "$2" ];then
        repo="$2"
    fi
    if [ "$3" ];then
        remoteRepoId="$3"
    fi
    # @see https://help.github.com/articles/syncing-a-fork
    git remote -v
    printHeader "Adding Remote as 'git@github.com-jabong:${remoteRepoId}/${repo}.git'"
    git remote add ${remoteId} https://github.com/${remoteRepoId}/${repo}.git
    git remote -v
}

function bjGitDiffFiles()
{
    originalDir=$(pwd)
    dir1=$(bjFilePath $1)
    dir2=$(bjFilePath $2)
    destinationDir=$3

    cd ${dir1}
    fileListFile1=${destinationDir}/$(basename ${dir1})_fileList.txt
    bjListAllFiles ${fileListFile1}
    bjGitCleanFilesList ${fileListFile1}

    cd ${dir2}
    fileListFile2=${destinationDir}/$(basename ${dir2})_fileList.txt
    bjListAllFiles ${fileListFile2}
    bjGitCleanFilesList ${fileListFile2}

    filesDiffFile="${destinationDir}/filesChanges_$(basename ${dir1})_$(basename ${dir2}).diff"
    git diff -U0 ${fileListFile1} ${fileListFile2} > ${filesDiffFile}

    bjGitPrepareSyncChanges ${filesDiffFile} ${dir1} ${dir2}
    cd ${originalDir}
}
